project = node['rundeck-project']

cmd = <<-EOH.to_s
    rd-project -p #{project} -a create \
    --resources.source.1.config.file=/var/rundeck/projects/LootCrate/etc/resources.yml \
    --resources.source.1.config.format=resourceyaml \
    --resources.source.1.config.generateFileAutomatically=true \
    --resources.source.1.config.includeServerNode=true \
    --resources.source.1.config.requireFileExists=false \
    --resources.source.1.type=file
    EOH

bash "check-project-#{project}" do
  user 'rundeck'
  code cmd
  not_if do
    File.exist?("#{node['rundeck']['datadir']}/projects/#{project}/etc/project.properties")
  end
end