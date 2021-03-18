class IngredientsController < ApplicationController
  def filter_by_ingredient
    the_id = params.fetch("path_id")

    matching_ingredients = Ingredient.where({ :id => the_id })

    @the_ingredient = matching_ingredients.at(0)

    matching_usage = Usage.where({ :ingredient_id => the_id})

    @the_usage = matching_usage.first

    @matching_recipes = Recipe.where({ :id => @the_usage.recipe_id})

    render({ :template => "ingredients/recipes_index.html.erb" })
  end

  
  
  def index
    matching_ingredients = Ingredient.all

    @list_of_ingredients = matching_ingredients.order({ :created_at => :desc })

    render({ :template => "ingredients/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_ingredients = Ingredient.where({ :id => the_id })

    @the_ingredient = matching_ingredients.at(0)

    render({ :template => "ingredients/show.html.erb" })
  end

  def create
    the_ingredient = Ingredient.new
    the_ingredient.name = params.fetch("query_name")
    the_ingredient.ingredient_class = params.fetch("query_ingredient_class")

    if the_ingredient.valid?
      the_ingredient.save
      redirect_to("/ingredients", { :notice => "Ingredient created successfully." })
    else
      redirect_to("/ingredients", { :notice => "Ingredient failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_ingredient = Ingredient.where({ :id => the_id }).at(0)

    the_ingredient.name = params.fetch("query_name")
    the_ingredient.ingredient_class = params.fetch("query_ingredient_class")

    if the_ingredient.valid?
      the_ingredient.save
      redirect_to("/ingredients/#{the_ingredient.id}", { :notice => "Ingredient updated successfully."} )
    else
      redirect_to("/ingredients/#{the_ingredient.id}", { :alert => "Ingredient failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_ingredient = Ingredient.where({ :id => the_id }).at(0)

    the_ingredient.destroy

    redirect_to("/ingredients", { :notice => "Ingredient deleted successfully."} )
  end
end
