# frozen_string_literal: true

lock '3.15.0'

exclude_dir = %w[tmp log node_modules public/uploads test public/packs spec public/assets public/dist .git .idea]

set :rails_env, 'production'
set :application, 'bester'
set :scm, :copy
set :deploy_to, "/var/www/#{fetch(:application)}"
set :include_dir, ['*',  '.ruby-version']
set :exclude_dir, exclude_dir

set :migration_role, :app
set :migration_servers, -> { primary(fetch(:migration_role)) }
set :conditionally_migrate, true
set :assets_roles, [:app]


set :rvm_ruby_version, '2.6.3'

append :linked_files, '.env'
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system', 'node_modules', 'public/assets', 'public/packs'

set :keep_releases, 10