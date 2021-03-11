class RecipesController < ApplicationController
  def index
    matching_recipes = Recipe.all

    @list_of_recipes = matching_recipes.order({ :created_at => :desc })

    render({ :template => "recipes/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_recipes = Recipe.where({ :id => the_id })

    @the_recipe = matching_recipes.at(0)

    @matching_usage = Usage.where({ :recipe_id => @the_recipe.id}) 

    #new_ingredient_name = params.fetch("query_name")

    #@the_ingredient = Ingredient.where({ :name => new_ingredient_name})

    render({ :template => "recipes/show.html.erb" })
  end

  def create
    the_recipe = Recipe.new
    the_recipe.user_id = params.fetch("query_user_id")
    the_recipe.photo = params.fetch("query_photo")
    the_recipe.name = params.fetch("query_name")
    the_recipe.details = params.fetch("query_details")
    the_recipe.food_categories = params.fetch("query_food_categories")

    if the_recipe.valid?
      the_recipe.save
      redirect_to("/recipes/#{the_recipe.id}", { :notice => "Recipe created successfully, please complete Ingedient List" })
    else
      redirect_to("/recipes/", { :alert => "Name already exists." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_recipe = Recipe.where({ :id => the_id }).at(0)

    the_recipe.user_id = params.fetch("query_user_id")
    the_recipe.details = params.fetch("query_details")
    the_recipe.food_categories = params.fetch("query_food_categories")

    if the_recipe.valid?
      the_recipe.save
      redirect_to("/recipes/#{the_recipe.id}", { :notice => "Recipe updated successfully."} )
    else
      redirect_to("/recipes/#{the_recipe.id}", { :alert => "Recipe failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_recipe = Recipe.where({ :id => the_id }).at(0)

    the_recipe.destroy

    redirect_to("/recipes", { :notice => "Recipe deleted successfully."} )
  end
end
