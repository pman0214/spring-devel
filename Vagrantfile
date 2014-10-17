# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  #----------------------------------------------------------------------
  # base box
  config.vm.box = "debian-jessie-a1-x11"
  config.vm.box_url = "http://www.f.ait.kyushu-u.ac.jp/~ishida/vagrant-box/debian-jessie-a1-x11_x86-64_jp.box"

  #----------------------------------------------------------------------
  # network
  #----------------------------------------------------------------------
  #------------------------------
  # forwarding
  #------------------------------
  # tomcat
  config.vm.network :forwarded_port, guest:8080, host:8080

  # mosquitto
  config.vm.network :forwarded_port, guest:1883, host:1883

  #----------------------------------------------------------------------
  # vm specific config
  #----------------------------------------------------------------------
  config.vm.provider "virtualbox" do |vb|
    # Boot with headless mode
    vb.gui = false
    vb.customize ["modifyvm", :id, "--memory",  "4096"]
    vb.customize ["modifyvm", :id, "--cpus",    "2"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "off"]
  end

  #----------------------------------------------------------------------
  # provisioning
  #----------------------------------------------------------------------
  # chef auto install
  config.omnibus.chef_version = :latest
  config.vm.provision "chef_solo" do |chef|
    chef.cookbooks_path = "cookbooks"
    # chef.log_level = :debug
    chef.json = {
      "java" => {
        "install_flavor" => "oracle",
        "jdk_version" => "7",
        "oracle" => {
          "accept_oracle_download_terms" => false
        }
      },
      "maven" => {
        "version" => "3"
      },
      "eclipse" => {
        "version" => "kepler",
        "plugins" =>
        [
         {"http://download.eclipse.org/releases/kepler" => "org.eclipse.egit.feature.group"},
         {"http://download.eclipse.org/technology/m2e/releases/1.4" => "org.eclipse.m2e.feature.feature.group"},
         # Itemize tools that you want to install in
         # http://dist.springsource.com/release/TOOLS/update/3.6.0.RELEASE/e4.3/content.jar
         # accessed from http://dist.springsource.com/release/TOOLS/update/e4.3/compositeContent.xml
         {"http://dist.springsource.com/release/TOOLS/update/e4.3" => "org.springsource.ide.eclipse.commons.quicksearch.feature.feature.group"},
         {"http://dist.springsource.com/release/TOOLS/update/e4.3" => "com.vmware.vfabric.ide.eclipse.tcserver.feature.group"},
         {"http://dist.springsource.com/release/TOOLS/update/e4.3" => "com.vmware.vfabric.ide.eclipse.tcserver.insight.feature.group"},
         {"http://dist.springsource.com/release/TOOLS/update/e4.3" => "org.springsource.ide.eclipse.dashboard.feature.group"},
         {"http://dist.springsource.com/release/TOOLS/update/e4.3" => "org.springframework.ide.eclipse.ajdt.feature.feature.group"},
         {"http://dist.springsource.com/release/TOOLS/update/e4.3" => "org.springframework.ide.eclipse.aop.feature.feature.group"},
         {"http://dist.springsource.com/release/TOOLS/update/e4.3" => "org.springframework.ide.eclipse.autowire.feature.feature.group"},
         {"http://dist.springsource.com/release/TOOLS/update/e4.3" => "org.springframework.ide.eclipse.batch.feature.feature.group"},
         {"http://dist.springsource.com/release/TOOLS/update/e4.3" => "org.springframework.ide.eclipse.core"},
         {"http://dist.springsource.com/release/TOOLS/update/e4.3" => "org.springframework.ide.eclipse.integration.feature.feature.group"},
         {"http://dist.springsource.com/release/TOOLS/update/e4.3" => "org.springframework.ide.eclipse.maven.feature.feature.group"},
         {"http://dist.springsource.com/release/TOOLS/update/e4.3" => "org.springframework.ide.eclipse.mylyn.feature.feature.group"},
         {"http://dist.springsource.com/release/TOOLS/update/e4.3" => "org.springframework.ide.eclipse.security.feature.feature.group"},
         {"http://dist.springsource.com/release/TOOLS/update/e4.3" => "org.springframework.ide.eclipse.data.feature.feature.group"},
         {"http://dist.springsource.com/release/TOOLS/update/e4.3" => "org.springframework.ide.eclipse.webflow.feature.feature.group"},
         {"http://dist.springsource.com/release/TOOLS/update/e4.3" => "org.springframework.ide.eclipse.uaa.feature.feature.group"}
        ]
      },
      "mosquitto" => {
        "listeners" =>
        [
         {port: 1883, addr: "0.0.0.0"}
        ],
        "persistence" => false
      }
    }

    chef.add_recipe "apt"
    chef.add_recipe "git"
    chef.add_recipe "java::default"
    chef.add_recipe "maven"
    chef.add_recipe "eclipse"
    chef.add_recipe "mosquitto::default"
  end

  config.vm.provision "shell" do |s|
    s.path = "create_eclipse_shortcut.sh"
  end
end
