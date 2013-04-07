RedmineApp::Application.routes.draw do
  match '*path', :to => 'cors#preflight', :constraints => {:method => 'OPTIONS'}
end
