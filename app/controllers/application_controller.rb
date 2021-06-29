class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  
  # create
  get "/recipes/new" do 
    erb :new
  end 
  # show 
  get "/recipes" do 
    @recipes = Recipe.all
    erb :index
  end
  # read 
  get "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    erb :show
  end
  #edit 
  get "/recipes/:id/edit" do 
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  # update
  patch "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    @recipe.assign_attributes(params[:recipe])
    @recipe.save
    redirect "/recipes/#{recipe.id}"
  end

  # create a recipe
  post "/recipes" do
    @recipe = Recipe.create(params)
    redirect "/recipes/#{@recipe.id}"
  end

  # delete
  delete "/recipes/:id" do 
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect to "/recipes"
  end
end
