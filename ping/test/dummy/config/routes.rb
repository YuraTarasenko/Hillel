Rails.application.routes.draw do
  mount Ping::Engine => "/ping"
end
