
module Puppet::Parser::Functions
  newfunction(:search_netboot_images, :type => :rvalue) do |args|
    lookupvar('netboot_images').split(',').include?(args[0])
  end
end
