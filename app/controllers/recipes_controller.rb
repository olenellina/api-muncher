require "#{Rails.root}/lib/edamam_api_wrapper"

class RecipesController < ApplicationController
  def index
    # results = Recipe.all
    # @my_query = []
    # results.length.times do |x|
    #   if results[x].query = params["query"]
    #     @my_query >> results[x]
    #   end
    # end
    @my_query = Recipe.where(query: params["query"])
    return @my_query
  end

  def show
  end

  def search
    flash[:notice] = nil
    if params["query"] != nil && params["query"] != ""
      @my_results = Edamam_Api_Wrapper.get_recipes(params["query"])
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
