remote_file '/tmp/rundeck.deb' do
  owner 'root'
  group 'root'
  mode '0644'
  source 'http://dl.bintray.com/rundeck/rundeck-deb/rundeck-2.5.3-1-GA.deb'
  action :create
end

dpkg_package 'rundeck' do
  source '/tmp/rundeck.deb'
  action :install
end

service 'rundeckd' do
  supports :status => true, :restart => true
  action [:start, :enable]
end

template '/etc/rundeck/rundeck-configure.properties' do
  source 'rundeck-configure.properties.erb'
  owner 'rundeck'
  group 'rundeck'
  mode '0640'
end
