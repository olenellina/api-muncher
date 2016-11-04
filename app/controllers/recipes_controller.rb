require "#{Rails.root}/lib/edamam_api_wrapper"

class RecipesController < ApplicationController
  def index
    @my_query = Recipe.where(query: params["query"]).page(params[:page]).per(10)
    if @my_query.empty?
      flash[:notice] = "Your search failed to return results. Please try again"
    else
      return @my_query
    end
  end

  def show
    @my_recipe = Recipe.find_by(id: params["id"].to_i)
  end

  def search
    flash[:notice] = nil
    if params["query"] != nil
        @my_results = Edamam_Api_Wrapper.get_recipes(params["query"])
        redirect_to recipe_index_path(params["query"])
    end
  end
end
