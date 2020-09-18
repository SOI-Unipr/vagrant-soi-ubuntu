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
  config.vm.provision 'shell', privileged: false, path: 'provision/python.sh', name: 'python.sh'
  config.vm.provision 'shell', privileged: false, path: 'provision/docker.sh', name: 'docker.sh'
  config.vm.provision 'shell', privileged: false, path: 'provision/apache.sh', name: 'apache.sh'
  # the `reset` flag makes sure user vagrant has gained privileges set by docker.sh and
  # apache.sh before labs are provisioned (vagrant will re-establish the ssh connection)
  config.vm.provision 'shell', privileged: false, path: 'provision/pre-labs.sh', name: 'pre-labs.sh', reset: true

  # labs
  config.vm.provision 'shell', privileged: false, path: 'provision/lab02.sh', name: 'lab02.sh'
  config.vm.provision 'shell', privileged: false, path: 'provision/lab03.sh', name: 'lab03.sh'
  config.vm.provision 'shell', privileged: false, path: 'provision/lab04.sh', name: 'lab04.sh'
  config.vm.provision 'shell', privileged: false, path: 'provision/lab05.sh', name: 'lab05.sh'
  config.vm.provision 'shell', privileged: false, path: 'provision/lab06.sh', name: 'lab06.sh'

end
