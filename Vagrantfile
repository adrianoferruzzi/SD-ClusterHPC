Vagrant.configure("2") do |config|
        config.vm.define "master" do |master|
            master.vm.box = "ubuntu/bionic64"
            master.vm.provider "virtualbox" do |v|
                v.memory = 512
                v.cpus = 1
              end
            master.vm.network "public_network", ip: "192.168.1.200", bridge: "wlp5s0"
            master.vm.network "private_network", ip: "10.0.10.1", virtualbox__intnet: true
            master.vm.provision "shell", path: "master/master.sh"
            #master.vm.provision "shell", path: "master/master-install-nis.sh"
            #master.vm.provision "shell", path: "master/master-config-nis.sh"
            #master.vm.provision "shell", path: "master/master-config-nis-ypinit.sh"
            #master.vm.provision "shell", path: "master/master-config-nis-final.sh"
        end

    (1..2).each do |i|
        config.vm.define "c0#{i}" do |compute|
        compute.vm.box = "ubuntu/bionic64"
        compute.vm.provider "virtualbox" do |v|
          v.memory = 512
          v.cpus = 1
        end
        compute.vm.network "private_network", ip: "10.0.10.#{i+1}", virtualbox__intnet: true
        compute.vm.provision "shell", path: "c01/c01.sh"
        end
    end
end
