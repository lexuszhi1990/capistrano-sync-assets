namespace :sync do
  namespace :assets do
    desc 'Synchronize your remote assets using local assets'
    task :push do
      on release_roles :all do
        within release_path do
          # require 'pry'; binding.pry

          # puts sync dirs
          sync_assets_dirs = fetch(:sync_assets_dirs)

          # init asset with cap

          # ask whether sync with backup

          # do the sync
        end
      end
    end

    desc 'Synchronize your local assets using remote assets'
    task :pull do
      on roles(:app) do
        within release_path do
          with rails_env: fetch(:rails_env) do
            # require 'pry'; binding.pry

            # puts sync dirs

            # init asset with cap

            # ask whether sync with backup

            # do the sync
          end
        end
      end
    end
  end
end

namespace :load do
  task :defaults do
    # defaults here.
  end
end
