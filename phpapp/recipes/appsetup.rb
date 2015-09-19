node[:deploy].each do |app_name, deploy|

  script "install_composer" do
    interpreter "bash"
    user "root"
    cwd "#{deploy[:deploy_to]}/current"
    code <<-EOH
    curl -sS https://getcomposer.org/installer | php
    php composer.phar install --no-dev
    EOH
  end
  
  template "#{deploy[:deploy_to]}/current/application/config/database.php" do
    source "database.php.erb"
    mode 0660
    group deploy[:group]
    if platform?("ubuntu")
      owner "www-data"
    elsif platform?("amazon")   
      owner "apache"
    end

    variables(
      :host =>     (deploy[:database][:host] rescue nil),
      :user =>     (deploy[:database][:username] rescue nil),
      :password => (deploy[:database][:password] rescue nil),
      :db =>       (deploy[:database][:database] rescue nil)
    )

   only_if do
     File.directory?("#{deploy[:deploy_to]}/current")
   end
 end
 
 
  directory "#{deploy[:deploy_to]}/current/app/etc" do
    group deploy[:group]
    if platform?("ubuntu")
      owner "www-data"
    elsif platform?("amazon")   
      owner "apache"
    mode '0777'
    recursive true
    action :create
  end
end

  directory "#{deploy[:deploy_to]}/current/media" do
    group deploy[:group]
    if platform?("ubuntu")
      owner "www-data"
    elsif platform?("amazon")   
      owner "apache"
    mode '0777'
    recursive true
    action :create
  end
end

directory "#{deploy[:deploy_to]}/current/media/downloadable" do
    group deploy[:group]
    if platform?("ubuntu")
      owner "www-data"
    elsif platform?("amazon")   
      owner "apache"
    mode '0777'
    recursive true
    action :create
  end
end

directory "#{deploy[:deploy_to]}/current/media/customer" do
    group deploy[:group]
    if platform?("ubuntu")
      owner "www-data"
    elsif platform?("amazon")   
      owner "apache"
    mode '0777'
    recursive true
    action :create
  end
end

directory "#{deploy[:deploy_to]}/current/media/xmlconnect" do
    group deploy[:group]
    if platform?("ubuntu")
      owner "www-data"
    elsif platform?("amazon")   
      owner "apache"
    mode '0777'
    recursive true
    action :create
  end
end

directory "#{deploy[:deploy_to]}/current/media/xmlconnect/original" do
    group deploy[:group]
    if platform?("ubuntu")
      owner "www-data"
    elsif platform?("amazon")   
      owner "apache"
    mode '0777'
    recursive true
    action :create
  end
end

directory "#{deploy[:deploy_to]}/current/media/xmlconnect/original/ok.gif" do
    group deploy[:group]
    if platform?("ubuntu")
      owner "www-data"
    elsif platform?("amazon")   
      owner "apache"
    mode '0777'
    recursive true
    action :create
  end
end

directory "#{deploy[:deploy_to]}/current/media/xmlconnect/system" do
    group deploy[:group]
    if platform?("ubuntu")
      owner "www-data"
    elsif platform?("amazon")   
      owner "apache"
    mode '0777'
    recursive true
    action :create
  end
end

directory "#{deploy[:deploy_to]}/current/media/xmlconnect/system/ok.gif" do
    group deploy[:group]
    if platform?("ubuntu")
      owner "www-data"
    elsif platform?("amazon")   
      owner "apache"
    mode '0777'
    recursive true
    action :create
  end
end

directory "#{deploy[:deploy_to]}/current/media/xmlconnect/custom/ok.gif" do
    group deploy[:group]
    if platform?("ubuntu")
      owner "www-data"
    elsif platform?("amazon")   
      owner "apache"
    mode '0777'
    recursive true
    action :create
  end
end

directory "#{deploy[:deploy_to]}/current/media/xmlconnect/custom" do
    group deploy[:group]
    if platform?("ubuntu")
      owner "www-data"
    elsif platform?("amazon")   
      owner "apache"
    mode '0777'
    recursive true
    action :create
  end
end

directory "#{deploy[:deploy_to]}/current/media/dhl" do
    group deploy[:group]
    if platform?("ubuntu")
      owner "www-data"
    elsif platform?("amazon")   
      owner "apache"
    mode '0777'
    recursive true
    action :create
  end
end

directory "#{deploy[:deploy_to]}/current/media/dhl/logo.jpg" do
    group deploy[:group]
    if platform?("ubuntu")
      owner "www-data"
    elsif platform?("amazon")   
      owner "apache"
    mode '0777'
    recursive true
    action :create
  end
end

package 'php-soap' do
  action :install
end

package 'php-mcrypt' do
  action :install
end
  
end
