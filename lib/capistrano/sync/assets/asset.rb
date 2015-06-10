module Capistrano
  module Sync
    module Asset
      def initialize(cap)
        @user_host = [cap.host.user, cap.host.hostname].compact.join('@')
        @port = cap.host.port || 22
        @shared_path = cap.shared_path
        @sync_assets_dirs = cap.fetch(:sync_assets_dirs)
      end


      def pull
        # system("rsync -a --del -L -K -vv --progress --rsh='ssh -p #{port}' #{user}@#{server}:#{cap.current_path}/#{dir} #{cap.fetch(:dir)}")

        # "rsync -avrt --recursive --times --rsh=ssh --compress --human-readable --progress --delete user@server:/var/www/your-dir/public/ ~/your-dir/public/"

        # info "Downloading config #{config} as #{local_path} "
      end

      def push

      end
    end
  end
end
