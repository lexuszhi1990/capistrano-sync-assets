module Capistrano
  module Sync
    class Asset
      def initialize(cap)
        @user_host = [cap.host.user, cap.host.hostname].compact.join('@')
        @port = cap.host.port || 22
        @shared_path = cap.shared_path
      end


      def pull(dir)
        # system("rsync -a --del -L -K -vv --progress --rsh='ssh -p #{port}' #{user}@#{server}:#{cap.current_path}/#{dir} #{cap.fetch(:dir)}")
        server_asset_dir = Utils.assets_dir "#{@shared_path}/#{dir}"
        local_asset_dir = Utils.assets_dir "#{Dir.pwd}/#{dir}"

        puts "rsync -avrt --recursive --times --compress --human-readable --progress --delete --rsh='ssh -p #{@port}' #{@user_host}:#{server_asset_dir} #{local_asset_dir}"
      end

      def push(dir)
        # system("rsync -a --del -L -K -vv --progress --rsh='ssh -p #{port}' #{user}@#{server}:#{cap.current_path}/#{dir} #{cap.fetch(:dir)}")
        server_asset_dir = Utils.assets_dir "#{@shared_path}/#{dir}"
        local_asset_dir = Utils.assets_dir "#{Dir.pwd}/#{dir}"

        puts "rsync -avrt --recursive --times --compress --human-readable --progress --delete --rsh='ssh -p #{@port}' #{@user_host}:#{server_asset_dir} #{local_asset_dir}"
      end
    end
  end
end
