require 'spec_helper'

RSpec.describe Money do
  let(:currency_rates) do
    {
      usd: 1.11,
      bitcoin: 0.0047
    }
  end

  it 'has a version number' do
    expect(Money::VERSION).not_to be nil
  end

  it 'should setup currency exchange' do
    Money::Money.conversion_rates(:eur, currency_rates)

    expect(Money::Money.base_currency).to eq(:eur)
    expect(Money::Money.currency_rates).to eq(currency_rates.merge(eur: 1))
  end

  it 'should create money instance' do
    fifty_eur = Money::Money.new(50, :eur)

    expect(fifty_eur.amount).to eq(50)
    expect(fifty_eur.currency).to eq(:eur)
    expect(fifty_eur.inspect).to eq('50.00 EUR')
  end

  it 'should create money instance for float' do
    fifty_eur = Money::Money.new(50.457, :eur)

    expect(fifty_eur.amount).to eq(50.457)
    expect(fifty_eur.currency).to eq(:eur)
    expect(fifty_eur.inspect).to eq('50.46 EUR')
  end

  it 'should convert to other currency' do
    Money::Money.conversion_rates(:eur, currency_rates)

    fifty_eur = Money::Money.new(50, :eur)

    dollar_result = fifty_eur.convert_to(:usd)

    expect(dollar_result.amount).to eq(55.50000000000001)
    expect(dollar_result.currency).to eq(:usd)
    expect(dollar_result.inspect).to eq('55.50 USD')
  end

  it 'should return itself when converts to the same currency' do
    Money::Money.conversion_rates(:eur, currency_rates)

    fifty_eur = Money::Money.new(50, :eur)

    other_eur = fifty_eur.convert_to(:eur)

    expect(other_eur.amount).to eq(50)
    expect(other_eur.currency).to eq(:eur)
    expect(other_eur.inspect).to eq('50.00 EUR')
  end

  it 'should raise an exception if no proper currency is available' do
    Money::Money.conversion_rates(:eur, currency_rates)

    fifty_eur = Money::Money.new(50, :eur)
    expect { fifty_eur.convert_to(:rub) }.to raise_error(Money::MoneyError)
  end

  it 'should plus the money' do
    Money::Money.conversion_rates(:eur, currency_rates)

    fifty_eur = Money::Money.new(50, :eur)
    twenty_dollars = Money::Money.new(20, :usd)

    result = fifty_eur + twenty_dollars

    expect(result.amount).to eq(68.018018018018015)
    expect(result.currency).to eq(:eur)
    expect(result.inspect).to eq('68.02 EUR')
  end

  it 'should plus the number' do
    Money::Money.conversion_rates(:eur, currency_rates)

    fifty_eur = Money::Money.new(50, :eur)

    result = fifty_eur + 20

    expect(result.amount).to eq(70)
    expect(result.currency).to eq(:eur)
    expect(result.inspect).to eq('70.00 EUR')
  end

  it 'should minus the money' do
    Money::Money.conversion_rates(:eur, currency_rates)

    fifty_eur = Money::Money.new(50, :eur)
    twenty_dollars = Money::Money.new(20, :usd)

    result = fifty_eur - twenty_dollars

    expect(result.amount).to eq(31.981981981981985)
    expect(result.currency).to eq(:eur)
    expect(result.inspect).to eq('31.98 EUR')
  end

  it 'should minus the number' do
    Money::Money.conversion_rates(:eur, currency_rates)

    fifty_eur = Money::Money.new(50, :eur)

    result = fifty_eur - 20

    expect(result.amount).to eq(30)
    expect(result.currency).to eq(:eur)
    expect(result.inspect).to eq('30.00 EUR')
  end

  it 'should multi by number' do
    fifty_eur = Money::Money.new(50, :eur)
    result = fifty_eur * 2

    expect(result.amount).to eq(100)
    expect(result.currency).to eq(:eur)
    expect(result.inspect).to eq('100.00 EUR')
  end

  it 'should divide by number' do
    fifty_eur = Money::Money.new(50, :eur)
    result = fifty_eur / 2

    expect(result.amount).to eq(25)
    expect(result.currency).to eq(:eur)
    expect(result.inspect).to eq('25.00 EUR')
  end

  it 'should compare the money' do
    Money::Money.conversion_rates(:eur, currency_rates)
    twenty_dollars = Money::Money.new(20, :usd)
    fifty_eur = Money::Money.new(50, :eur)

    expect(twenty_dollars).to eq(Money::Money.new(20, :usd))
    expect(twenty_dollars).to_not eq(Money::Money.new(30, :usd))

    expect(twenty_dollars != Money::Money.new(30, :usd)).to be_truthy

    fifty_eur_in_usd = fifty_eur.convert_to(:usd)
    expect(fifty_eur_in_usd).to eq(fifty_eur)

    expect(twenty_dollars).to be > Money::Money.new(5, :usd)
    expect(twenty_dollars).to be < fifty_eur
  end

  it 'should take currency_rates from th Internet' do
    Money::Money.online_rates(base_currency: :eur)

    expect(Money::Money.base_currency).to eq(:eur)
    expect(Money::Money.currency_rates).to be_a Hash

    expect(Money::Money.currency_rates.fetch(:usd)).to be_a Float
  end

  it 'should take the rate info from IFinance provider' do
    Money::Money.online_rates(base_currency: :uah, rate_provider: :ifinance)

    expect(Money::Money.base_currency).to eq(:uah)
    expect(Money::Money.currency_rates).to be_a Hash

    expect(Money::Money.currency_rates.fetch(:usd)).to be_a Float
  end
end
