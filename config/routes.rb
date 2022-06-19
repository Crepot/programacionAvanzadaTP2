Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :api do #Esto es por conveción 
    namespace :v1 do #Indico la Vesrion 1 de mi api
      p "Pasando por las rutas"
      resources :players

      resources :table do
      #TODO: VER que recursos definir acá adentro
        #MAZO --> player_hand se puede retirar

      end

      post 'authenticate', to: 'authentication#create'
    end
  end
end
