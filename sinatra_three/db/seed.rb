class Seed
  def self.seed
    create_products unless Models::Product.exists?
    create_users unless Models::User.exists?
  end

  private

  PRODUCTS = [
    { id: 1, title: 'First Product', description: 'description of first product', price: 10 },
    { id: 2, title: 'Second Product', description: 'description of second product', price: 20 }
  ]

  USERS = [
    { id: 1, username: 'admin', password: Gibberish::SHA1('admin') }
  ]

  def self.create_products
    Models::Product.create(PRODUCTS)
  end

  def self.create_users
    log('create users')
    Models::User.create(USERS)
  end
end
