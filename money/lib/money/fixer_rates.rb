module Money
  class FixerRates
    class << self
      def get_rates(base_currency)
        uri = URI("http://api.fixer.io/latest?base=#{base_currency.to_s.upcase}")
        rates = ::JSON.parse(Net::HTTP.get(uri))['rates']

        rates = Hash[rates.map { |key, value| [key.downcase.to_sym, value.to_f] }]
        rates[base_currency] = 1

        rates
      end
    end
  end
end
