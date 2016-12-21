# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.box = 'ubuntu/trusty32'
  config.vm.hostname = 'rails-tr32'
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.provision :shell, path: 'bootstrap.sh', keep_color: true
  config.vm.provider 'virtualbox' do |v|
    v.memory = 2038
    v.cpus = 2
  end
end
