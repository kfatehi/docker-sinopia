Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--memory", "2048"]
    v.customize ["modifyvm", :id, "--cpus", "2"]
  end

  config.vm.provision "docker" do |docker|
    docker.pull_images "keyvanfatehi/sinopia:latest"
    docker.run "keyvanfatehi/sinopia", args: "-p 4873:4873"
  end

  config.vm.network "private_network", ip: "10.10.10.10"
end
