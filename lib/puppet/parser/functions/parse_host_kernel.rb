
module Puppet::Parser::Functions
  newfunction(:parse_host_kernel, :type => :rvalue) do |args|
    args[0].split('_')
  end
end
