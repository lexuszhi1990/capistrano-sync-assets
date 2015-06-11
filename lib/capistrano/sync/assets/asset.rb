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

      def backup_local_asset(local_asset_dir)
        local_backup_dir = "#{local_asset_dir}_bak"
        system("rm -r #{local_backup_dir}") if Dir.exist?(local_backup_dir)
        system("cp -r #{local_asset_dir} #{local_backup_dir}") if Dir.exist?(local_asset_dir)
      end

      def backup_server_asset(server_asset_dir)
        delete_exist_backup = "if [ -e #{server_asset_dir}_bak ]; then rm -r #{server_asset_dir}_bak; fi"
        backup_assets = "if [ -e #{server_asset_dir} ]; then cp -r #{server_asset_dir} #{server_asset_dir}_bak; fi"
        execute [delete_exist_backup, backup_assets].join(";")
      end
    end
  end
end
