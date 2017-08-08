server '34.211.179.136', user: 'ubuntu', roles: %w(app db web), my_property: :my_value
set :ssh_options, forward_agent: true, keys: %w(~/.ssh/id_rsa)
set :branch, 'master'
set :linked_files, %w(config/database.yml config/secrets.yml)
set :rails_env, 'production'
set :keep_releases, 3