private_ip = my_private_ip()
public_ip = my_public_ip()

script 'run_experiment' do
  cwd "/usr/local/ca"
  user node['ca']['user']
  group node['ca']['group']
  interpreter "bash"
  code <<-EOM
    
  EOM
end

