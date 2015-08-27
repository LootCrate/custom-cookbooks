execute "selinux_apache_network_bool" do
  command "/usr/sbin/setsebool httpd_can_network_connect true"
end