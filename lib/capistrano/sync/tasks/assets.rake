require File.expand_path('../../assets/asset.rb', __FILE__)

namespace :sync do
  namespace :assets do
    desc 'Synchronize your remote assets using local assets'
    task :push do
      on release_roles :all do
        within shared_path do
          sync_assets_dirs = fetch(:sync_assets_dirs)
          info "the assets dirs as #{sync_assets_dirs.join(', ')}"
          asset = Capistrano::Sync::Asset.new(self)
          asset.push
        end
      end
    end

    desc 'Synchronize your local assets using remote assets'
    task :pull do
      on roles(:app) do
        within shared_path do
          with rails_env: fetch(:rails_env) do
            sync_assets_dirs = fetch(:sync_assets_dirs)
            info "the assets dirs as #{sync_assets_dirs.join(', ')}"
            asset = Capistrano::Sync::Asset.new(self)
            sync_assets_dirs.each do |dir|
              # TODO: ask whether sync with backup
              # asset.backup(dir)
              asset.pull(dir)
            end
          end
        end
      end
    end
  end
end

