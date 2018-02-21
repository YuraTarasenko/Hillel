module Money
  # main class for Money gem
  class Money
    attr_reader :amount, :currency

    class << self
      attr_reader :base_currency, :currency_rates

      RATES_PROVIDERS = {
        fixer: -> (base_currency) { FixerRates.get_rates(base_currency) },
        ifinance: -> (base_currency) { IFinance.get_rates }
      }

      def conversion_rates(base_currency, currency_rates)
        @base_currency = base_currency
        @currency_rates = currency_rates.merge(Hash[base_currency, 1])
      end

      def online_rates(base_currency: :usd, rate_provider: :fixer)
        @base_currency = base_currency
        @currency_rates = RATES_PROVIDERS.fetch(rate_provider).call(base_currency)
      rescue KeyError
        raise ::Money::MoneyError, 'Unable to find this currency. ' \
          "Available currencies are: #{Money.currency_rates.keys.join(' ')}"
      end
    end

    def initialize(amount, currency)
      @amount = amount
      @currency = currency
    end

    def inspect
      "#{format('%.2f', @amount)} #{@currency.to_s.upcase}"
    end

    def convert_to(new_currency)
      return Money.new(@amount, @currency) if @currency == new_currency

      if @currency == Money.base_currency
        Money.new(@amount * Money.currency_rates.fetch(new_currency),
                  new_currency)
      else
        new_amount = (@amount / Money.currency_rates.fetch(@currency)) *
                     Money.currency_rates.fetch(new_currency)

        Money.new(new_amount, new_currency)
      end
    rescue KeyError
      raise ::Money::MoneyError, 'Unable to find this currency. ' \
        "Available currencies are: #{Money.currency_rates.keys.join(' ')}"
    end

    %i[+ -].each do |method|
      define_method(method) do |other|
        if other.is_a?(Money)
          Money.new(@amount.send(method, other.convert_to(@currency).amount),
                    @currency)
        else
          Money.new(@amount.send(method, other), @currency)
        end
      end
    end

    %i[* /].each do |method|
      define_method(method) do |number|
        Money.new(@amount.send(method, number), @currency)
      end
    end

    %i[== > < >= <= !=].each do |method|
      define_method(method) do |other|
        @amount.to_f.round(2)
               .send(method, other.convert_to(@currency).amount.to_f.round(2))
      end
    end
  end
end
