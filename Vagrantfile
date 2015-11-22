Vagrant.configure(2) do |config|
    config.vm.box = "ubuntu/vivid64"
    config.vm.box_check_update = false

    # config.vm.network "forwarded_port", guest: 80, host: 7005
    # config.vm.network "private_network", ip: "192.168.33.11"
    # config.vm.synced_folder "public/", "/var/www/html"

    config.vm.provision "shell", inline: <<-SHELL
          sudo apt-get install -y git               # apache2 php5
    SHELL
end
