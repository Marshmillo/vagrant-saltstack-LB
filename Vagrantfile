# -*- mode: ruby -*-
# vi: set ft=ruby :

machines = {
    "load-balancer" => { :ip => "", :cpu => 1, :mem => 512},
    "web-1" => { :ip => "", :cpu => 1, :mem => 512},
    "web-2" => { :ip => "", :cpu => 1, :mem => 512},
    "database" => { :ip => "", :cpu => 1, :mem => 512},
    "mirror" => { :ip => "", :cpu => 1, :mem => 512}
}

Vagrant.configure("2") do |config|
    
    machines.each do |hostname, info|
        config.vm.define hostname do |lb-conf|
            lb-conf.vm.provider "virtualbox" do |vb|
                vb.memory = "#{info[:mem]}"
                vb.cpu = "#{info[:cpu]}"
                vb.name = hostname
            end
            lb-conf.vm.box = "centos/7"
            lb-conf.vm.provision = "salt"
            lb-conf.synced_folder "saltstack/salt", "/svr/salt"
            lb-conf.synced_folder "saltstack/pillar", "/svr/pillar"
            
            lb-conf.vm.provision "salt" do |salt|
                salt.masterless = true
                salt.run_highstate = true
                salt.verbose = true        
            end
        end
    end
end

