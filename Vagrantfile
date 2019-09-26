# -*- mode: ruby -*-
# vi: set ft=ruby :

machines = {
    "load-balancer" => { :ip => "192.168.130.222", :mem => 512},
    "web-1" => { :ip => "192.168.130.223", :mem => 512},
    "web-2" => { :ip => "192.168.130.224", :mem => 512},
    "database" => { :ip => "192.168.130.225", :mem => 512},
    "mirror" => { :ip => "192.168.130.226", :mem => 512}
}

Vagrant.configure("2") do |config|
    
    machines.each do |hostname, info|
        config.vm.define hostname do |lbconf|
            lbconf.vm.synced_folder "saltstack/salt", "/svr/salt"
            lbconf.vm.synced_folder "saltstack/pillar", "/svr/pillar"
            lbconf.vm.provider :virtualbox do |vb|
                vb.memory = "#{info[:mem]}"
                vb.name = hostname
            end
            lbconf.vm.box = "centos/7"
            lbconf.vm.network "public_network", bridge: "eno1", ip: "#{info[:ip]}"
            
            lbconf.vm.provision "salt" do |salt|
                salt.masterless = true
                salt.run_highstate = true
                salt.verbose = true        
            end
        end
    end
end

