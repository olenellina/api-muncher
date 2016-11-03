class AddQueryToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :query, :string
  end
end
