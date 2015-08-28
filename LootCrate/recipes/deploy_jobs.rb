user = node['rundeck']['user']

directory "/home/#{user}/jobs" do
  owner user
  group user
  mode '0755'
  action :create
end

cookbook_file "#{node['rundeck-jobs-dir']}/loot_promo.yml" do
  source 'loot_promo.yml'
  owner user
  group user
  mode '0644'
end

cookbook_file "#{node['rundeck-jobs-dir']}/recurly_transactions.yml" do
  source 'recurly_transactions.yml'
  owner user
  group user
  mode '0644'
end

bash 'create jobs' do
  user node['rundeck']['user']
  cwd node['rundeck-jobs-dir']
  code <<-EOH
  for i in *.yml; do rd-jobs load -F yaml --file $i; done
  EOH
end