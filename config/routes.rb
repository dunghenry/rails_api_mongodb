Rails.application.routes.draw do
  namespace :api do
    namespace :auth do
      post 'login', to: 'auth#login'
    end
    namespace :v1 do
      post 'add_user', action: :addUser, controller: :users
      get 'get_users', action: :getUsers, controller: :users
      get 'get_user/:id', action: :showUser, controller: :users
      put 'update_user/:id', action: :updateUser, controller: :users
      delete 'delete_user/:id', action: :deleteUser, controller: :users
    end
    namespace :v2 do
      get 'get_posts', to: 'posts#getPosts'
      get 'get_post/:id', to: 'posts#showPost'
      post 'create_post', to: 'posts#createPost'
      put 'update_post/:id', to: 'posts#updatePost'
      delete 'delete_post/:id', to: 'posts#deletePost'
    end
  end
end
