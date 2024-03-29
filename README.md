Module to aid with installation and configuration of a Linux PXE Boot server.

Uses dnsmasq for DHCP and PXE. 
Lighttpd for serving up seed files.

Latest Fixes:

Added the ability to download images by specifying image as true in a menu host, 
and setting the kernel to the proper naming convention ie: ubuntu_precise_amd64.

Usage
---

### Include PXE

    include pxe

    include pxe { 'install_server':
      tftp_root     => '/srv/tftp',
    }


### Menu

    pxe::menu::header { 'menu': }

    pxe::menu::header { 'menu':
      menu_title    => "Our PXE Boot Menu",
      menu_timeout  =>  500,
    } 

    pxe::menu::entry { 'webserver1':
      label         => 'webserver1',
      kernel        => 'ubuntu-installer-12.04/amd64/linux',
      append        => 'initrd=ubuntu-installer-12.04/amd64/initrd.gz'
    }

    pxe::menu::entry { 'testServer1':
      label         => 'testServer1',
      kernel        => 'ubuntu_precise_amd64',
      image         => true,
    }

    pxe::menu::entry { 'webserver2':
      kernel        => 'ubuntu-installer-12.04/amd64/linux',
      append        => 'initrd=ubuntu-installer-12.04/amd64/initrd.gz'
    }

### DNS 

    pxe::dns::header {
      domain       => 'mydomain.com',
      range        => '192.168.1.0,static',
      dhcp_boot    => 'pxelinux.0',
    }

    pxe::dns::host {
      mac_address  => '00:50:56:29:a0:5d',
      host_name    => 'myhost',
      ip_address   => '192.168.1.4',
      lease_time   => 'infinite',
    }
