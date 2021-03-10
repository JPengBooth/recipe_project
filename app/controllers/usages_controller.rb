class UsagesController < ApplicationController
  def index
    matching_usages = Usage.all

    @list_of_usages = matching_usages.order({ :created_at => :desc })

    render({ :template => "usages/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_usages = Usage.where({ :id => the_id })

    @the_usage = matching_usages.at(0)

    render({ :template => "usages/show.html.erb" })
  end

  def create
    the_usage = Usage.new
    the_usage.recipe_id = params.fetch("query_recipe_id")
    the_usage.ingredient_id = params.fetch("query_ingredient_id")
    the_usage.amount = params.fetch("query_amount")

    if the_usage.valid?
      the_usage.save
      redirect_to("/usages", { :notice => "Usage created successfully." })
    else
      redirect_to("/usages", { :notice => "Usage failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_usage = Usage.where({ :id => the_id }).at(0)

    the_usage.recipe_id = params.fetch("query_recipe_id")
    the_usage.ingredient_id = params.fetch("query_ingredient_id")
    the_usage.amount = params.fetch("query_amount")

    if the_usage.valid?
      the_usage.save
      redirect_to("/usages/#{the_usage.id}", { :notice => "Usage updated successfully."} )
    else
      redirect_to("/usages/#{the_usage.id}", { :alert => "Usage failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_usage = Usage.where({ :id => the_id }).at(0)

    the_usage.destroy

    redirect_to("/usages", { :notice => "Usage deleted successfully."} )
  end
end
