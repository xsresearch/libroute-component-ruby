require "libroute/component/version"
require 'socket'
require 'bson'

module Libroute
  module Component

  class << self
    def run
  
      server = TCPServer.open(2000)

      Signal.trap("INT") {
        server.close
        return
      }

      loop {
        client = server.accept
        params_data = client.read
        params = Hash.from_bson(BSON::ByteBuffer.new(params_data))
        client.puts yield(params).to_bson.to_s
        
        client.close
      }
    end
  end

  end
end
