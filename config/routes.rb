Rails.application.routes.draw do
  get 'lists/new'
  get 'top'=>'homes#top'
  post 'lists'=>'lists#create'
  # get 'lists/index'
  get 'lists'=>'lists#index'
  # get 'lists/show'
  # .../lists/1 や.../lists/3に該当する
  get 'lists/:id'=>'lists#show',as:'list'
  get 'lists/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
