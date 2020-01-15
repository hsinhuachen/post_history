Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts
  post "/upload_image" => "upload#upload_image", :as => :upload_image

end
