
#require "capistrano/scm/git"
#install_plugin Capistrano::SCM::Git

require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/bundler'
require 'capistrano/rvm'
require 'capistrano/puma'
require 'capistrano/puma/workers'
require 'capistrano/rails/console'
require 'capistrano/rails_tail_log'
require 'capistrano-db-tasks'
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
