require "#{Rails.root}/lib/edamam_api_wrapper"

class RecipesController < ApplicationController

  def home
  end

  def index
    @my_query = Recipe.where(query: params["query"]).page(params[:page]).per(10)
    if @my_query.empty?
      flash[:notice] = "Your search failed to return results. Please try again."
    else
      return @my_query
    end
  end

  def show
    @my_recipe = Recipe.find_by(id: params["id"].to_i)
  end

  def search
    if params["query"] != nil && params["query"] != ""
        results = Edamam_Api_Wrapper.get_recipes(params["query"])
        if results.empty?
          flash[:notice] = "Your search failed to return results. Please try again."
          redirect_to root_path
        else
          redirect_to recipe_index_path(params["query"])
        end
    else
      flash[:notice] = "Please enter a valid search term."
      redirect_to root_path
    end
  end
end

# def search
#   if params["query"] != nil && params["query"] != ""
#       Edamam_Api_Wrapper.get_recipes(params["query"])
#       if Recipe.find_by(query: params["query"]) != nil
#         redirect_to recipe_index_path(params["query"])
#       else
#         flash[:notice] = "Your search failed to return results. Please try again."
#         redirect_to root_path
#       end
#   else
#     flash[:notice] = "Please enter a valid search term."
#     redirect_to root_path
#   end
# end
