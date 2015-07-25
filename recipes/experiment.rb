private_ip = my_private_ip()
public_ip = my_public_ip()

script 'run_experiment' do
  cwd "/usr/local/experiment"
  user node['experiment']['user']
  group node['experiment']['group']
  interpreter "bash"
  code <<-EOM
    echo "exp"
  EOM
end

