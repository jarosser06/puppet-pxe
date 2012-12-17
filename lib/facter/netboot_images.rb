netboot_dir = "/srv/tftp/netboot"

Facter.add("netboot_images") do
  setcode do
    Dir.entries(netboot_dir).grep(/^[a-zA-Z0-9_]*$/).join(",")
  end
end
