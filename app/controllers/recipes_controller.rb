require "#{Rails.root}/lib/edamam_api_wrapper"

class RecipesController < ApplicationController
  def index
    @my_query = Recipe.where(query: params["query"])
    return @my_query
  end

  def show
    @my_recipe = Recipe.find_by(id: params["id"].to_i)
  end

  def search
    flash[:notice] = nil
    if params["query"] != nil && params["query"] != ""
      if Recipe.find_by(query: params["query"]) == nil
        @my_results = Edamam_Api_Wrapper.get_recipes(params["query"])
      end
      if @my_results != []
        redirect_to recipe_index_path(params["query"])
      else
        flash[:notice] = "Your search failed to return results. Please try again"
      end
    end
  end
end



#   def show
#     @my_recipe = Edamam_Recipe.find(params[:label])
#   end
#
#   def search
#     flash[:notice] = nil
#     if params["query"] != nil && params["query"] != ""
#       @my_results = Edamam_Api_Wrapper.get_recipes(params["query"])
#       if @my_results != []
#         render 'index'
#       else
#         flash[:notice] = "Your search failed to return results. Please try again"
#       end
#     end
#   end
#
# end
