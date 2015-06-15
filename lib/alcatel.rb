# -*- encoding : utf-8 -*-
require 'pty'
require 'expect'
require 'alcatel/version'

module Alcatel
  class Session
    def initialize(options = {}, &blk)
      @host = options[:host]
      @user = options[:user]
      @password = options[:password]
      @password_pat = options[:password_pat] || %r/password:/io
      @prompt_pat = options[:prompt_pat] || %r/isadmin/io
      $expect_verbose = true if options[:debug] == true
      begin
        @o, @i = PTY.spawn("ssh -oStrictHostKeyChecking=no #{@user}@#{@host}")
        @i.sync = true
        @o.expect(@password_pat){ @i.puts @password }
        @o.expect(/#{@password_pat}|#{@prompt_pat}/io) do |output|
          abort "Incorrect username or password!" if output.first =~ @password_pat
          @i.puts
        end
      rescue
        abort "Could not connect to device #{@host}!"
      end
    end

    def cmd(command, options = {})
      @o.expect(@prompt_pat){ @i.puts command }
    end

    def logout
      cmd('logout')
    end

    def change_igmp(rack, shelf, slot, port, vpi, vci, max_num_group)
      cmd('configure igmp channel %s/%s/%s/%s:%s:%s max-num-group %s' % [rack, shelf, slot, port, vpi, vci, max_num_group])
    end

    def disable_igmp(rack, shelf, slot, port, vpi, vci)
      change_igmp(rack, shelf, slot, port, vpi, vci, 0)
    end

    def enable_igmp(rack, shelf, slot, port, vpi, vci)
      change_igmp(rack, shelf, slot, port, vpi, vci, 5)
    end

  end
end
