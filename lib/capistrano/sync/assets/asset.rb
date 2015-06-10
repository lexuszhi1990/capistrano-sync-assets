module Capistrano
  module Sync
    module Assets
      def initialize(cap)
        servers = Capistrano::Configuration.env.send(:servers)
        server = servers.detect { |s| s.roles.include?(:app) }
        port = server.netssh_options[:port] || 22
        user = server.netssh_options[:user]
      end
    end
  end
end
