yum_repository 'rundeck' do
  description "Rundeck - Release"
  baseurl "https://dl.bintray.com/rundeck/rundeck-rpm"
  gpgkey 'http://rundeck.org/keys/BUILD-GPG-KEY-Rundeck.org.key'
  action :create
end

package 'rundeck'

service 'rundeck' do
  service_name 'rundeckd'
  action :enable
end