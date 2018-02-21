require_relative 'base'

module Controllers
  module Admin
    class Products < Controllers::Admin::Base

      get '/admin/products' do
        products = Models::Product.all
        slim 'admin/products/index'.to_sym, locals: { products: products }
      end

      get '/admin/products/new' do
        erb 'admin/products/new'.to_sym, locals: { product: Models::Product.new }
      end

      post '/admin/products' do
        product = Models::Product.new(title: params['title'],
                                      description: params['description'],
                                      price: params['price'])

        if product.save
          redirect to('/admin/products')
        else
          erb 'admin/products/new'.to_sym, locals: { product: product }
        end
      end

      get '/admin/products/:id/update' do
        product = Models::Product.find(params['id'].to_i)
        erb 'admin/products/update'.to_sym, locals: { product: product }
      end

      put '/admin/products/:id' do
        product = Models::Product.find(params['id'].to_i)
        product.title = params['title']
        product.description = params['description']
        product.price = params['price']

        if product.save
          redirect to('/admin/products')
        else
          erb 'admin/products/update'.to_sym, locals: { product: product }
        end
      end

      delete '/admin/products/:id' do
        Models::Product.find(params['id'].to_i).destroy
        redirect to('/admin/products')
      end

      get '/admin/products/:id' do
        id = params['id'].to_i

        product = Models::Product.find(id)
        slim 'admin/products/product'.to_sym, locals: { product: product }
      end

    end
  end
end
