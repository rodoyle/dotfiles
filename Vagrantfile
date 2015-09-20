## DO NOT USE THIS VAGRANT FILE VERBATIM
## READ THE COMMENTS

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"

  # Set the RAM to something less tiny

  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 4
  end

  # Change to point to your local clone of conf repo
  config.vm.synced_folder "./", "/srv"

  # AFTER PROVISIONING IS COMPLETE, UNCOMMENT THIS AND `vagrant reload`
  config.vm.synced_folder "../dgsource", "/opt/dgsource", :owner=> 'deskgen', :group=>'deskgen'
  config.vm.synced_folder "../dgparse", "/opt/dgsource/dgparse", :owner=> 'deskgen', :group=>'deskgen'
  config.vm.synced_folder "/home/rileyd/biodata", "/opt/biodata", :owner=> 'deskgen', :group=>'deskgen'
  config.vm.synced_folder "../dgsource/browser/landing", "/opt/venvs/deskgen/landing", :owner=> 'deskgen', :group=>'deskgen'
  config.vm.synced_folder "../dgsource/browser/guidebook_client/guidebook", "/opt/venvs/deskgen/guidebook", :owner=> 'deskgen', :group=>'deskgen'
  config.vm.network "forwarded_port", guest: 80, host: 8080  # http
  config.vm.network "forwarded_port", guest: 443, host: 8443  # https
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
  config.vm.provision :shell do |shell|
    shell.path = 'vagrant/provision.sh'
    # PRODUCT GRAIN
    # THE BELOW MUST BE SET BEFORE PROVISIONING
    # SEE https://github.com/DeskGen/conf
    shell.args = 'deskgen-platform'
  end
end
