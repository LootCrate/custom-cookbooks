package 'nginx' do
  action :install
end

template '/etc/nginx/sites-available/default' do
  source 'rundeck-nginx.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

service 'nginx' do
  supports :status => true, :restart => true, :reload => true
  action [:start, :enable]
end