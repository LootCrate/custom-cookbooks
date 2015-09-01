include_recipe 'deploy'

node[:deploy].each do |application, deploy|
  Chef::Log.info("#{application}")
  Chef::Log.info("#{deploy[:application_type]}")
  Chef::Log.info("deploy to: #{deploy[:deploy_to]}")

  opsworks_deploy_dir do
    user deploy[:user]
    group deploy[:group]
    path deploy[:deploy_to]
  end

  opsworks_deploy do
    deploy_data deploy
    app application
  end
  
end