namespace :sync do
  namespace :assets do
    desc 'Synchronize your remote assets using local assets'
    task :push do
      on roles(:app) do
        within release_path do
          with rails_env: fetch(:rails_env) do
            # require 'pry'; binding.pry
            # puts sync dirs

            # init asset with cap
            servers = Capistrano::Configuration.env.send(:servers)
            server = servers.detect { |s| s.roles.include?(:app) }
            port = server.netssh_options[:port] || 22
            user = server.netssh_options[:user]

            # ask whether sync with backup

            # do the sync
            # system("rsync -a --del -L -K -vv --progress --rsh='ssh -p #{port}' #{user}@#{server}:#{cap.current_path}/#{dir} #{cap.fetch(:local_assets_dir)}")
          end
        end
      end
    end

    desc 'Synchronize your local assets using remote assets'
    task :pull do
      puts 'pull'
    end
  end
end

namespace :load do
  task :defaults do
    # defaults here.
  end
end
