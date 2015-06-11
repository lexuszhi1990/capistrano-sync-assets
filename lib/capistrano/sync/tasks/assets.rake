require File.expand_path('../../assets/asset.rb', __FILE__)
require File.expand_path('../../assets/utils.rb', __FILE__)

namespace :sync do
  namespace :assets do
    desc 'Synchronize your remote assets using local assets'
    task :push do
      on release_roles :all do
        within shared_path do
          sync_assets_dirs = fetch(:sync_assets_dirs)
          info "the assets dirs as #{sync_assets_dirs.join(', ')}"
          asset = Capistrano::Sync::Asset.new(self)
          sync_assets_dirs.each do |dir|
            server_asset_dir = Utils.assets_dir "#{@shared_path}/#{dir}"
            local_asset_dir = Utils.assets_dir "#{Dir.pwd}/#{dir}"
            # TODO: ask whether sync with backup
            asset.backup_server_asset(local_asset_dir)
            asset.pull(dir)
          end
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
              server_asset_dir = Utils.assets_dir "#{@shared_path}/#{dir}"
              local_asset_dir = Utils.assets_dir "#{Dir.pwd}/#{dir}"
              # TODO: ask whether sync with backup
              info "backup the #{local_asset_dir}"
              asset.backup_local_asset(local_asset_dir)
              info "sync the #{local_asset_dir} from server #{server_asset_dir}"
              asset.pull(dir)
            end
          end
        end
      end
    end
  end
end

