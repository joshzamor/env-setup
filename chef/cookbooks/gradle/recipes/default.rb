#
# Cookbook Name:: gradle
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

script "Gradle Installation" do
  interpreter "bash"
  user "openlmis"
  cwd node[:webapp][:home]
  code <<-EOH
  cd #{node[:webapp][:home]} 
  wget http://services.gradle.org/distributions/gradle-1.3-all.zip
  unzip -o #{node[:webapp][:home]}/gradle-1.3-all.zip
  EOH
  not_if "gradle -v | grep Gradle"
  notifies :run, "execute[Set gradle home]", :immediately
end

execute "Set gradle home" do
  command "export PATH=#{node[:webapp][:home]}/gradle-1.3/bin:$PATH"
  action :nothing
end
