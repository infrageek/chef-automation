service 'tomcat' do
  action :nothing
end

#Creating the directory hierarchy:

directory "#{node['tomcat']['home_dir']}" do
	recursive :true
	action :create
	mode 0755
end

directory "#{node['tomcat']['config_dir']}" do
	recursive :true
	action :create
	mode 0755
end

directory "#{node['tomcat']['log_dir']}" do
	recursive :true
	action :create
	mode 0755
end

remote_file '/tmp/pache-tomcat-7.0.62.tar.gz' do
  source node['tomcat']['package_url']
  action :create
  not_if { ::File.exist?('tmp/pache-tomcat-7.0.62.tar.gz') }
end

tar_extract '/tmp/apache-tomcat-7.0.62.tar.gz' do
	target_dir '#{node['tomcat']['home_dir']}'
	action :extract_local
end

#Startup Script Part:
template "/etc/init.d/tomcat" do
  source "tomcat_init.erb"
  mode  744
  action :create
end

#Tomcat configuration comes here:
template "#{node['tomcat']['config_dir']}/server.xml" do
  source 'httpd.conf.erb'
  action :create
  notifies :restart, 'service[httpd]', :delayed
end

#Service part:
service "httpd" do
  supports :status => :true, :restart => :true, :reload => :true
  action [ :enable ]
end