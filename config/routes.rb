
Rails.application.routes.draw do
  resources :messages
  namespace 'api' do
    namespace 'v1' do
      resources :applications

      scope 'applications/:appToken' do
        resources :chats
      end
      scope 'applications/:appToken/:chatNumber' do
        resources :messages
      end
    end
  end
end