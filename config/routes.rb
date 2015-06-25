RedmineApp::Application.routes.draw do
  match '*path', :to => 'cors#preflight', via: [:options]
end
