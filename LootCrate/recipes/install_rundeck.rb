remote_file '/tmp/rundeck.deb' do
  owner 'root'
  group 'root'
  mode '0644'
  source 'http://dl.bintray.com/rundeck/rundeck-deb/rundeck-2.5.3-1-GA.deb'
  action :create
end

package 'rundeck' do
  source '/tmp/rundeck.deb'
  action :install
end
