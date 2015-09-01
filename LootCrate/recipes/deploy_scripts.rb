include_recipe 'deploy'

node[:deploy].each do |application, deploy|
  Chef::Log.info("#{application}")
  Chef::Log.info("#{deploy[:application_type]}")
  Chef::Log.info("deploy to: #{deploy[:deploy_to]}")
end