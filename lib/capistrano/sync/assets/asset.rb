module Capistrano
  module Sync
    class Asset
      def initialize(cap)
        @user_host = [cap.host.user, cap.host.hostname].compact.join('@')
        @port = cap.host.port || 22
      end

      def pull(local_asset_dir, server_asset_dir)
        system "rsync -avrt --recursive --times --compress --human-readable --progress --delete --rsh='ssh -p #{@port}' #{@user_host}:#{server_asset_dir} #{local_asset_dir}"
      end

      def push(server_asset_dir, local_asset_dir)
        system "rsync -avrt --recursive --times --compress --human-readable --progress --delete --rsh='ssh -p #{@port}' #{local_asset_dir} #{@user_host}:#{server_asset_dir}"
      end

      def backup_local_asset(dir)
        backup_dir = "#{dir}_bak"
        system("rm -rf #{backup_dir}") if Dir.exist?(backup_dir)
        system("mv #{dir} #{backup_dir}") if Dir.exist?(dir)
      end

      def backup_server_asset(dir)

      end
    end
  end
end
