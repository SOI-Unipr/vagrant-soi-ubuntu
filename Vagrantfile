Vagrant.configure('2') do |config|
  config.vm.box = 'bento/ubuntu-20.04'

  config.vm.box_check_update = false

  config.vm.host_name = 'soi-unipr-ubuntu'

  config.vm.network 'forwarded_port', guest: 22,   host: 2170, id: 'ssh', auto_correct: true

  # config.vm.synced_folder '../data', '/vagrant_data'

  config.vm.provider 'virtualbox' do |vb|
    vb.gui = true
    vb.name = 'soi-unipr-ubuntu'
    vb.memory = 4096
    vb.cpus = 2
    vb.customize ['modifyvm', :id, '--vram', '256']
    vb.customize ['modifyvm', :id, '--accelerate2dvideo', 'on']
    # vb.customize ['modifyvm', :id, '--accelerate3d', 'on']
    vb.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
    #vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
    #vb.customize ['modifyvm', :id, '--natdnsproxy1', 'on']
    # vb.customize ['setextradata', :id, 'GUI/HiDPI/UnscaledOutput', '1']
  end

  config.vm.provision 'shell', privileged: false, path: 'provision/base.sh', name: 'base.sh'
  config.vm.provision 'shell', privileged: false, path: 'provision/lubuntu.sh', name: 'lubuntu.sh'
  config.vm.provision 'shell', privileged: false, path: 'provision/keyboard.sh', name: 'keyboard.sh'
  config.vm.provision 'shell', privileged: false, path: 'provision/google-chrome.sh', name: 'google-chrome.sh'
  config.vm.provision 'shell', privileged: false, path: 'provision/vs-code.sh', name: 'vs-code.sh'
  config.vm.provision 'shell', privileged: false, path: 'provision/wireshark.sh', name: 'wireshark.sh'
  config.vm.provision 'shell', privileged: false, path: 'provision/nvm.sh', name: 'nvm.sh'
  config.vm.provision 'shell', privileged: false, path: 'provision/node.sh', name: 'node.sh'
  config.vm.provision 'shell', privileged: false, path: 'provision/upgrade.sh', name: 'upgrade.sh'

end
