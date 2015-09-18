node['etl_ubuntu_packages'].each do |pkg|
    package pkg do
        :install
    end
end

node['etc_pip_packages'].each do |pkg|
    execute "install-#{pkg}" do
        command "pip install #{pkg}"
        #not_if "[ `pip freeze | grep #{pkg} | cut -d'=' -f3` = '#{version}' ]"
    end
end