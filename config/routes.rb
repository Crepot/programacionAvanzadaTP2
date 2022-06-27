Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :api do #Esto es por conveción 
    namespace :v1 do #Indico la Vesrion 1 de mi api
      resources :players

      resources :game do
      #TODO: VER que recursos definir acá adentro
        #MAZO --> player_hand se puede retirar
        post 'repartir', to: 'game#repartir'
        post 'mostrar', to: 'game#mostrar_carta'
        patch 'player', to: 'game#join_game'
      end

      post 'authenticate', to: 'authentication#create'
    end
  end
end
