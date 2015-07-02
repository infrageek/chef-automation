user 'appuser' do
	action :create
	comment "Applicative user on system"
	home "/users/appuser"
	shell "/bin/bash"
end

directory node[:tomcat][:home][:dir] do
	owner "appuser"
	group "appuser"
	mode 00755
	action :create
end


