bash 'create jobs' do
  user node['rundeck']['user']
  cwd node['rundeck-jobs-dir']
  code <<-EOH
  for i in *.yml; do rd-jobs load -F yaml --file $i; done
  EOH
end