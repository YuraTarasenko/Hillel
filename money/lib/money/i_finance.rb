module Money
  class IFinance
    class << self
      def get_rates
        uri = URI("https://finance.i.ua/")
        body = Nokogiri::HTML(Net::HTTP.get(uri))

        cash = body.css('div.widget-currency_cash tbody')

        rates = Hash[cash.css('tr').map { |tr| [tr.css('th').text.downcase.to_sym, tr.css('td')[0].css('span.value span').text.to_f] }]
        rates.merge(uah: 1)
      end
    end
  end
end
