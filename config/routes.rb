Rails.application.routes.draw do
  namespace 'api' do
  	namespace 'v1' do
  		resources :institutions, :students, :registrations, :bills
  	end
  end
end
