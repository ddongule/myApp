Rails.application.routes.draw do


  devise_for :users
  root to: 'welcome#index'

  get 'team/index'

  get 'team/sec_cau'

  get 'welcome/index'

  resources :posts


  ## devise_for :users,
  ##  path: 'apple' 이라고 하면 컨트롤러 이름이 user이 아니고, apple이 된다.
  ##

  ## devise_for :users,
  ##  path: 'users'
  ##  path_names: {sign_in: 'login', sign_out: 'logout'} #액션 이름이 바뀐다.
end
