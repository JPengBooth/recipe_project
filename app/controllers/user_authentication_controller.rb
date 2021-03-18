class UserAuthenticationController < ApplicationController
  # Uncomment this if you want to force users to sign in before any other actions
  # skip_before_action(:force_user_sign_in, { :only => [:sign_up_form, :create, :sign_in_form, :create_cookie] })

  def landing_page
    if @current_user == nil
      @all_recipe = Recipe.all.order({ :created_at => :desc})
      render({ :template => "user_authentication/homepage.html.erb"})
    else 
      @current_user_bookmark = Bookmark.where({ :user_id => @current_user.id})
      @all_recipe = Recipe.all.order({ :created_at => :desc})
      @safe_recipe = Array.new
      @all_recipe.each do |a_recipe|
        @matching_usage = Usage.where({ :recipe_id => a_recipe.id}) 
        @usage_ingredient = Array.new
        @matching_usage.each do |a_usage|
          @usage_ingredient.push(a_usage[:ingredient_id])
        end
          
        @matching_allergies = Allergy.where({ :user_id => @current_user})
          
        @allergies = Array.new
        @matching_allergies.each do |an_allergy|
          @allergies.push(an_allergy[:ingredient_id])
        end

        @safe = (@usage_ingredient-@allergies).size == @usage_ingredient.size
        if @safe == true
          @safe_recipe.push(a_recipe.id)
        else
        end
      end
      render({ :template => "user_authentication/homepage.html.erb"})
    end
  end

  def sign_in_form
    render({ :template => "user_authentication/sign_in.html.erb" })
  end

  def create_cookie
    user = User.where({ :email => params.fetch("query_email") }).first
    
    the_supplied_password = params.fetch("query_password")
    
    if user != nil
      are_they_legit = user.authenticate(the_supplied_password)
    
      if are_they_legit == false
        redirect_to("/user_sign_in", { :alert => "Incorrect password." })
      else
        session[:user_id] = user.id
      
        redirect_to("/", { :notice => "Signed in successfully." })
      end
    else
      redirect_to("/user_sign_in", { :alert => "No user with that email address." })
    end
  end

  def destroy_cookies
    reset_session

    redirect_to("/", { :notice => "Signed out successfully." })
  end

  def sign_up_form
    render({ :template => "user_authentication/sign_up.html.erb" })
  end

  def create
    @user = User.new
    @user.email = params.fetch("query_email")
    @user.user_name = params.fetch("query_user_name")
    @user.password = params.fetch("query_password")
    @user.password_confirmation = params.fetch("query_password_confirmation")

    save_status = @user.save

    if save_status == true
      session[:user_id] = @user.id
   
      redirect_to("/", { :notice => "User account created successfully."})
    else
      redirect_to("/user_sign_up", { :alert => "User account failed to create successfully."})
    end
  end
    
  def edit_profile_form
    render({ :template => "user_authentication/edit_profile.html.erb" })
  end

  def update
    @user = @current_user
    @user.email = params.fetch("query_email")
    @user.password = params.fetch("query_password")
    @user.password_confirmation = params.fetch("query_password_confirmation")
    
    if @user.valid?
      @user.save

      redirect_to("/", { :notice => "User account updated successfully."})
    else
      render({ :template => "user_authentication/edit_profile_with_errors.html.erb" })
    end
  end

  def destroy
    @current_user.destroy
    reset_session
    
    redirect_to("/", { :notice => "User account cancelled" })
  end
 
end
