Rails.application.routes.draw do
  scope :api do
    get 'rooms' => 'rooms#index'
    post 'rooms' => 'rooms#create'
    get 'rooms/:id/last_messages' => 'rooms#last_messages'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
