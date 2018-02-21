class Seed
  def self.seed
    create_products
  end

  private

  PRODUCTS = [
    { id: 1, title: 'First Product', description: 'description of first product', price: 10 },
    { id: 2, title: 'Second Product', description: 'description of second product', price: 20 }
  ]

  def self.create_products
    Models::Product.create(PRODUCTS)
  end
end
