require "#{Rails.root}/lib/edamam_api_wrapper"

class RecipesController < ApplicationController
  def index
    @my_results = Recipe.all
  end

  def show
  end

  def search
    flash[:notice] = nil
    if params["query"] != nil && params["query"] != ""
      @my_results = Edamam_Api_Wrapper.get_recipes(params["query"])
      if @my_results != []
        render 'index'
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
