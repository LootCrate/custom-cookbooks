bash 'create jobs' do
  user node['rundeck']['user']
  cwd node['rundeck-jobs-dir']
  code <<-EOH
  find . -name "*.yml" | xargs rd-jobs load -F yaml --file
  EOH
end