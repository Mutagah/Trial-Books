class ApplicationController < Sinatra::Base
    set :default_content_type, "application/json"
    # task :allow_methods, "GET, HEAD, POST, PUT, OPTIONS, DELETE"
    set :allow_origin, "http:/localhost:3000"
     set :bind, '0.0.0.0'
  configure do
    enable :cross_origin
  end
  before do
    response.headers['Access-Control-Allow-Origin'] = '*'
  end
  
  # routes...
  options "*" do
    response.headers["Allow"] = "GET, PUT, POST, DELETE, OPTIONS"
    response.headers["Access-Control-Allow-Headers"] = "Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token"
    response.headers["Access-Control-Allow-Origin"] = "*"
    200
  end
  
   get '/books' do
      books = Book.all
      books.to_json
    end
  
    get '/books/:id' do
      book = Book.find(params[:id])
      book.to_json
    end
  
   # get book genres available
  
    get '/genres' do
      genres = Genre.all
      genres.to_json
    end
  
    get '/genres/:id' do
      genres = Genre.find(params[:id])
      genre.to_json
    end
  
    get '/customers' do
      customers = Customer.all
      customers.to_json
    end
  
   # get purchases
    get '/purchases' do
      purchases = Purchase.all
      purchases.to_json
    end
    # patch request to make the new purchases
    patch '/purchases' do
      patched_purchases = Book.find(params[:id])
      patched_purchases.update(
        purchase_title: params[:purchase_title],
        customer_id: params[:customer_id],
        book_id: params[:book_id]
      )
      patched_purchases.to_json
    end
  
  
    # patch request to make the new purchases
  
    patch '/purchases/:id' do
      patched_purchases = Book.find(params[:id])
      patched_purchases.update(
        purchase_title: params[:purchase_title], 
        customer_id: params[:customer_id],
        book_id: params[:book_id]
      )
      patched_purchases.to_json
      
    end
    # post request to make new purchases
  
    post '/books' do
      books= Book.create(
        title:params[:title],
        author:params[:author],
        genre:params[:genre],
        publisher:params[:publisher],
      )
      books.to_json
  
    # delete to delete the purchases made
     delete '/books/:id' do
      book = Book.find(params[:id])
      book.destroy
      book.to_json
     end
    end
  end