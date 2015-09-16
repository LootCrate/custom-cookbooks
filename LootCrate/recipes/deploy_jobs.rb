user = "rundeck"

directory "/home/#{user}/jobs" do
  owner user
  group user
  mode '0755'
  action :create
end

#file "/home/#{user}/git_wrapper.sh" do
#  action :create
#  owner user
#  group user
#  mode '0750'
#  content "#!/bin/sh\nexec /usr/bin/ssh -i /home/#{user}/.ssh/id_rsa \"$@\""
#end
#
#file "/home/#{user}/.ssh/id_rsa" do
#  action :create
#  owner user
#  group user
#  mode '0640'
#  content "#{node['ssh_key']}"
#end


git "/home/#{user}/etl" do
  repository "https://#{node['auth_token']}:x-oauth-basic@github.com/LootCrate/loot-bi-dw.git"
  reference 'master'
  user user
  group user
  action :checkout
end


#cookbook_file "#{node['rundeck-jobs-dir']}/loot_promo.yml" do
#  source 'loot_promo.yml'
#  owner user
#  group user
#  mode '0644'
#end
#
#cookbook_file "#{node['rundeck-jobs-dir']}/recurly_transactions.yml" do
#  source 'recurly_transactions.yml'
#  owner user
#  group user
#  mode '0644'
#end
#
#bash 'create jobs' do
#  user node['rundeck']['user']
#  cwd node['rundeck-jobs-dir']
#  code <<-EOH
#  for i in *.yml; do rd-jobs load -F yaml --file $i; done
#  EOH
#end