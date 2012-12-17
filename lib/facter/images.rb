base_dir = "/var/tftp"
images = { "ubuntu_1204_64_netboot" => "#{base_dir}/ubuntu_1204_64_netboot",   "ubuntu_1204_32_netboot" => "#{base_dir}/ubuntu_1204_32_netboot"}

images.each.do |name, location|
   Facter.add(name) do
      setcode do
         if File.exist? location
            true
         else
            false
         end
      end
   end
end
