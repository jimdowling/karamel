#
# DO NOT EDIT THIS FILE DIRECTLY - UNLESS YOU KNOW WHAT YOU ARE DOING
#

user node[:karamel][:user] do
  action :create
  system true
  shell "/bin/bash"
  not_if "getent passwd #{node[:karamel]['user']}"
end

group node[:karamel][:group] do
  action :modify
  members ["#{node[:karamel][:user]}"]
  append true
end


# See ark resource here: https://github.com/burtlo/ark
# It will: fetch it to to /var/cache/chef/
# unpack it to the default path (/usr/local/XXX-1.2.3)
# create a symlink for :home_dir (/usr/local/XXX) 
# add /user/local/XXX/bin to the enviroment PATH variable
 ark 'karamel' do
   url node[:karamel][:url]
   version node[:karamel][:version]
   path node[:karamel][:version_dir]
   home_dir node[:karamel][:home_dir]
   
   append_env_path true
   owner node[:karamel][:user]
 end

bash "karamel_install_bash" do
    user "root"
    code <<-EOF

# Do something here...

touch #{node[:karamel][:version_dir]}/.installed
EOF
  not_if { ::File.exists?( "#{node[:karamel][:version_dir]}/.installed" ) }
end

my_private_ip= my_private_ip()
my_public_ip= my_public_ip()



# Pre-Experiment Code


# Configuration Files


