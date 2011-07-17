RubotoApi::Application.routes.draw do
  match '/:package',        :controller => 'packages', :action => :show, :package => /[a-z\.]+/
  match '/:package/:klass', :controller => 'klasses',  :action => :show, :package => /[a-z\.]+/
end
