# config valid only for current version of Capistrano
lock "3.8.2"

set :application, "url_shortner"
set :repo_url, "git@github.com:anjanaraveendra/url_shortner.git"
set :deploy_to, '/home/ubuntu/deploy'
set :scm, :git
set :format, :pretty
set :log_level, :debug

# Puma
set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{shared_path}/log/puma.error.log"
set :puma_error_log,  "#{shared_path}/log/puma.access.log"
set :puma_threads, [0, 4]
set :puma_workers, 3
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true # Change to false when not using ActiveRecord
set :puma_preload_app, false
set :puma_prune_bundler, true
set :whenever_identifier, -> { "#{fetch(:application)}_#{fetch(:stage)}" }

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'vendor/bundle', 'tmp/pids', 'tmp/sockets', '#{RAILS_ROOT}/bin', 'public', 'uploads')

namespace :deploy do
  task :precompile do
    on roles(:web) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :bundle, 'install --deployment'
          execute :bundle, 'exec rake assets:precompile'
          execute :bundle, 'exec rake db:migrate'
        end
      end
    end
  end

  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end

  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      within release_path do
        with rails_env: fetch(:rails_env) do
          invoke 'puma:restart'
        end
      end
    end
  end
  before :publishing, :precompile
  after :publishing, :restart
end

after 'deploy:updated', 'deploy:cleanup'