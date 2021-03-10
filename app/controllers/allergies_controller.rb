class AllergiesController < ApplicationController
  def index
    matching_allergies = Allergy.all

    @list_of_allergies = matching_allergies.order({ :created_at => :desc })

    render({ :template => "allergies/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_allergies = Allergy.where({ :id => the_id })

    @the_allergy = matching_allergies.at(0)

    render({ :template => "allergies/show.html.erb" })
  end

  def create
    the_allergy = Allergy.new
    the_allergy.user_id = params.fetch("query_user_id")
    the_allergy.ingredient_id = params.fetch("query_ingredient_id")
    the_allergy.severity = params.fetch("query_severity")

    if the_allergy.valid?
      the_allergy.save
      redirect_to("/allergies", { :notice => "Allergy created successfully." })
    else
      redirect_to("/allergies", { :notice => "Allergy failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_allergy = Allergy.where({ :id => the_id }).at(0)

    the_allergy.user_id = params.fetch("query_user_id")
    the_allergy.ingredient_id = params.fetch("query_ingredient_id")
    the_allergy.severity = params.fetch("query_severity")

    if the_allergy.valid?
      the_allergy.save
      redirect_to("/allergies/#{the_allergy.id}", { :notice => "Allergy updated successfully."} )
    else
      redirect_to("/allergies/#{the_allergy.id}", { :alert => "Allergy failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_allergy = Allergy.where({ :id => the_id }).at(0)

    the_allergy.destroy

    redirect_to("/allergies", { :notice => "Allergy deleted successfully."} )
  end
end
