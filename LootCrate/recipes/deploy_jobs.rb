user = node['rundeck']['user']

include_recipe 'LootCrate::etl_deps'

remote_directory "/home/#{user}/jobs" do
  source 'jobs'
  files_owner user
  files_group user
  files_mode '0644'
  owner user
  group user
  mode '0755'
  action :create
end

git "/home/#{user}/etl" do
  repository "https://#{node['auth_token']}:x-oauth-basic@github.com/LootCrate/loot-bi-dw.git"
  reference 'master'
  user user
  group user
  action :checkout
end

bash 'create jobs' do
  user node['rundeck']['user']
  cwd node['rundeck-jobs-dir']
  code <<-EOH
  for i in *.yml; do rd-jobs load -F yaml --file $i; done
  EOH
end