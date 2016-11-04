Rails.application.routes.draw do

  root to: 'recipes#home'

  get 'recipes/home' => 'recipes#home'

  get 'recipes/index/:query' => 'recipes#index', as: 'recipe_index'

  get 'recipes/search' => 'recipes#search', as: 'recipe_search'

  get 'recipes/show/:id' => 'recipes#show', as: 'recipe_show'

end
