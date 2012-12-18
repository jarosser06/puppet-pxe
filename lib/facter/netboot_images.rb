netboot_dir = "/srv/tftp/netboot"

Facter.add("netboot_images") do
  setcode do
    if File.directory?(netboot_dir)
      Dir.entries(netboot_dir).grep(/^[a-zA-Z0-9_]*$/).join(",")
    else
      'none'
    end
  end
end
