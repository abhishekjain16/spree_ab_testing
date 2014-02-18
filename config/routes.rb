Spree::Core::Engine.routes.draw do
  resources :experiments do
    resources :variations, :path => :variation
  end

  resources :variations, :only => [] do
    collection do
      post :increment
    end
  end
end
