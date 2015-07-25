name             'karamel'
maintainer       "karamel"
maintainer_email "jdowling@kth.se"
license          "Apache v2.0"
description      'Installs/Configures/Runs karamel'
version          "0.1"

recipe            "karamel::install", "Experiment setup for karamel"
recipe            "karamel::experiment",  "configFile=; This experiment's name is experiment"
recipe            "karamel::ca",  "configFile=; This experiment's name is ca"




%w{ ubuntu debian rhel centos }.each do |os|
  supports os
end

attribute "karamel/version",
:description => "Version of karamel",
:type => 'string',
:default => "0.1"


attribute "karamel/url",
:description => "Url to download binaries for karamel",
:type => 'string',
:default => ""

attribute "karamel/user",
:description => "Run karamel as this user",
:type => 'string',
:default => "karamel"


