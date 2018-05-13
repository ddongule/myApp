Rails.application.routes.draw do


  devise_for :users
  root to: 'welcome#index'

  get 'team/index'

  get 'team/sec_cau'

  get 'welcome/index'

  resources :posts 
  # resources :posts do
  #   resources :comments
  # end

  # 팀관련 route
  get 'show/:teamid/posts' => 'posts#index', as: 'show'

  post 'teams/admin' => 'team#admin', as: 'admin'
  post 'teams/student' => 'team#student', as: 'student'
  get 'secret' => 'team#secret'
  post 'selectTeam/:teamid' => 'team#selectTeam', as: 'team'
  get 'onlycau' => 'team#only_cau'

  post 'show/:teamid/posts' => 'posts#create'
  get 'show/:teamid/posts/new' => 'posts#new', as: 'tnew_post'
  get 'show/:teamid/posts/:id/edit' => 'posts#edit', as: 'tedit_post'
  # get 'show/:teamid/posts/:id' => 'team#team_show', as: 'team_post'
  patch 'show/:teamid/posts/:id' => 'posts#update'
  delete 'show/:teamid/posts/:id' => 'posts#destroy', as: 'tpost_destroy'
  get 'show/:teamid/posts/:id' => 'posts#show', as: 'show_post'

  # #post 관련 route
  # get 'teams/:teamid/posts' => 'posts#index', as: 'posts'
  # post 'teams/:teamid/posts' => 'posts#create'
  # get 'teams/:teamid/posts/new' => 'posts#new', as: 'new_post'
  # get 'teams/:teamid/posts/:id/edit' => 'posts#edit', as: 'edit_post'
  # get 'teams/:teamid/posts/:id' => 'posts#show', as: 'post'
  # patch 'teams/:teamid/posts/:id' => 'posts#update'
  # delete 'teams/:teamid/posts/:id' => 'posts#destroy', as: 'destroy'
  ## devise_for :users,
  ##  path: 'apple' 이라고 하면 컨트롤러 이름이 user이 아니고, apple이 된다.
  ##

  ## devise_for :users,
  ##  path: 'users'
  ##  path_names: {sign_in: 'login', sign_out: 'logout'} #액션 이름이 바뀐다.
end
