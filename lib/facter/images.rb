base_dir = "/srv/tftp"

images["ubuntu_precise_amd64", "ubuntu_precise_i386", "ubuntu_lucid_amd64", "ubuntu_lucid_i386"]

images.each.do |name|
   Facter.add("#{name}_netboot") do
      setcode do
         if File.exist? "#{base_dir}/#{name}" 
            "#{base_dir}/#{name}" 
         end
      end
   end
end
