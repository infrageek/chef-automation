user 'webuser' do
	action :create
	comment "Web Server user on system"
	home "/users/webuser"
	shell "/bin/bash"
end

directory node[:apache][:home][:dir] do
	owner "webuser"
	group "webuser"
	mode 00755
	action :create
end
