Rails.application.routes.draw do

  # Routes for the Bookmark resource:

  # CREATE
  post("/insert_bookmark", { :controller => "bookmarks", :action => "create" })
          
  # READ
  get("/bookmarks", { :controller => "bookmarks", :action => "index" })
  
  get("/bookmarks/:path_id", { :controller => "bookmarks", :action => "show" })
  
  # UPDATE
  
  post("/modify_bookmark/:path_id", { :controller => "bookmarks", :action => "update" })
  
  # DELETE
  get("/delete_bookmark/:path_id", { :controller => "bookmarks", :action => "destroy" })

  #------------------------------

  # Routes for the Allergy resource:

  # CREATE
  post("/insert_allergy", { :controller => "allergies", :action => "create" })
          
  # READ
  get("/allergies", { :controller => "allergies", :action => "index" })
  
  get("/allergies/:path_id", { :controller => "allergies", :action => "show" })
  
  # UPDATE
  
  post("/modify_allergy/:path_id", { :controller => "allergies", :action => "update" })
  
  # DELETE
  get("/delete_allergy/:path_id", { :controller => "allergies", :action => "destroy" })

  #------------------------------

  # Routes for the Usage resource:

  # CREATE
  post("/insert_usage", { :controller => "usages", :action => "create" })
          
  # READ
  get("/usages", { :controller => "usages", :action => "index" })
  
  get("/usages/:path_id", { :controller => "usages", :action => "show" })
  
  # UPDATE
  
  post("/modify_usage/:path_id", { :controller => "usages", :action => "update" })
  
  # DELETE
  get("/delete_usage/:path_id", { :controller => "usages", :action => "destroy" })

  #------------------------------

  # Routes for the Ingredient resource:

   #recipes containing ingredient
  get("/ingredients/recipes/:path_id",{ :controller => "ingredients", :action => "filter_by_ingredient"})

  # CREATE
  post("/insert_ingredient", { :controller => "ingredients", :action => "create" })
          
  # READ
  get("/ingredients", { :controller => "ingredients", :action => "index" })
  
  get("/ingredients/:path_id", { :controller => "ingredients", :action => "show" })
  
  # UPDATE
  
  post("/modify_ingredient/:path_id", { :controller => "ingredients", :action => "update" })
  
  # DELETE
  get("/delete_ingredient/:path_id", { :controller => "ingredients", :action => "destroy" })

  #------------------------------

  # Routes for the Recipe resource:

 
  # CREATE
  post("/insert_recipe", { :controller => "recipes", :action => "create" })
          
  # READ
  get("/recipes", { :controller => "recipes", :action => "index" })
  
  get("/recipes/:path_id", { :controller => "recipes", :action => "show" })
  
  # UPDATE
  
  post("/modify_recipe/:path_id", { :controller => "recipes", :action => "update" })
  
  # DELETE
  get("/delete_recipe/:path_id", { :controller => "recipes", :action => "destroy" })

  

  #------------------------------

  # Routes for homepage
  get("/", { :controller => "user_authentication", :action => "landing_page"})

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
