#
# Cookbook Name:: rails-puma
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "git-core"
package "curl"
package "zlib1g-dev"
package "build-essential"
package "libssl-dev"
package "libreadline-dev"
package "libyaml-dev"
package "libxml2-dev"
package "libxslt1-dev"
package "libcurl4-openssl-dev"
package "python-software-properties"
package "libffi-dev"

# set timezone
bash "set timezone" do
  code <<-EOH
    echo 'US/Pacific-New' > /etc/timezone
    dpkg-reconfigure -f noninteractive tzdata
  EOH
  not_if "date | grep -q 'PDT\|PST'"
end