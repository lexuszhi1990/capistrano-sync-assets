module Capistrano
  module Sync
    class Asset
      def initialize(cap)
        @user_host = [cap.host.user, cap.host.hostname].compact.join('@')
        @port = cap.host.port || 22
      end

      def pull(dir)
        # system("rsync -a --del -L -K -vv --progress --rsh='ssh -p #{port}' #{user}@#{server}:#{cap.current_path}/#{dir} #{cap.fetch(:dir)}")
        server_asset_dir = Utils.assets_dir "#{@shared_path}/#{dir}"
        local_asset_dir = Utils.assets_dir "#{Dir.pwd}/#{dir}"

        puts "rsync -avrt --recursive --times --compress --human-readable --progress --delete --rsh='ssh -p #{@port}' #{@user_host}:#{server_asset_dir} #{local_asset_dir}"
      end

      def push(server_asset_dir, local_asset_dir)
        # system("rsync -a --del -L -K -vv --progress --rsh='ssh -p #{port}' #{user}@#{server}:#{cap.current_path}/#{dir} #{cap.fetch(:dir)}")

        puts "rsync -avrt --recursive --times --compress --human-readable --progress --delete --rsh='ssh -p #{@port}' #{@user_host}:#{server_asset_dir} #{local_asset_dir}"
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
