ActionController::Routing::Routes.draw do |map|
  map.resources :s3_uploads
  map.resources :news_images, :only => [:index, :create, :destroy]

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action
  map.connect 'insider_files/:id/:style.:format', :controller => 'insider_files', :action => 'download', :conditions => {:method => :get}

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)
  map.rate 'articles/:id/rate/:rating', :controller => 'articles', :action => 'rate'
  map.rate_album 'albums/:id/rate/:rating', :controller => 'albums', :action => 'rate'
  map.reply_to_message 'messages/:id/reply', :controller => 'messages', :action => 'reply'
  map.publish 'articles/:id/publish', :controller => 'articles', :action => 'publish'

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products
  map.devise_for :users
  map.resources :settings, :except => :show
  map.resources :users
  map.resources :brackets
  map.resources :comments
  map.resources :insiders

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }
  map.resources :video_categories, :only => [:new, :create, :edit, :update], :collection => {:admin => :get}
  map.resources :messages
  map.resources :adverts, :collection => {:admin => :get}
  map.resources :albums, :collection => {:admin => :get}
  map.resources :streams, :collection => {:admin => :get}
  map.resources :pages, :collection => {:admin => :get}
  map.resources :news_categories, :collection => {:admin => :get}
  map.resources :managers, :collection => {:admin => :get}
  map.resources :partners, :collection => {:admin => :get}
  map.resources :awards, :collection => {:admin => :get}
  map.resources :ok_players, :collection => {:admin => :get}
  map.resources :players, :collection => {:admin => :get}
  map.resources :blogs, :collection => {:admin => :get}
  map.resources :categories, :collection => {:admin => :get}
  map.resources :formats, :collection => {:admin => :get}
  map.resources :articles,
    :collection => {:admin => :get, :unapproved => :get},
    :member => {:lock => :get, :unlock => :get}
  map.resources :matches, :collection => {:admin => :get}
  map.resources :videos, :collection => {:admin => :get, :encode_notify => :post}
  map.resources :events, :collection => {:admin => :get}, :shallow => true do |event|
    event.resources :groups
    event.resources :brackets
  end
  map.resources :teams, :collection => {:admin => :get}

  map.resources :groups

  # Insider forums
  map.resources :forums, :has_many => :topics, :shallow => true
  map.resources :topics, :has_many => :posts, :shallow => true, :member => {:lock => :get, :unlock => :get}

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller

  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end
  map.static 'static/:permalink', :controller => 'pages', :action => 'show'
  map.static 'unauth', :controller => 'unauth', :action => 'index'

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"
  map.root :controller => "articles", :action => 'home'

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
