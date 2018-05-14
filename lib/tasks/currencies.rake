namespace :currencies do
  desc "Create test currencies"
  task create_test_currencies: :environment do
    file = File.read('Common-Currency.json')
    currencies = JSON.parse file
    currencies.each do |element|
      currency_params = element.second
      Currency.create!(currency_params)
    end
  end
  desc "Create rates"
  task create_rate: :environment do
    file = File.read('euro-rate.json')
    objects = JSON.parse file
    objects.each do |object|
      currency = Currency.find_by(code: object['code'])
      next unless currency
      currency.update(rate: object['rate'])
    end
  end
  desc "Connect countries and currencies"
  task add_to_countries: :environment do
    file = File.read('countries-currencies.json')
    countries_currencies = JSON.parse file
    countries = Country.all
    countries.each do |country|
      currency = Currency.find_by(code: countries_currencies[country.alpha2])
      next unless currency
      country.update(currency: currency)
    end
  end

end