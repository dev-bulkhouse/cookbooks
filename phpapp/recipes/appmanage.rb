node[:deploy].each do |app_name, deploy| 
directory '#{deploy[:deploy_to]}/current/app/etc' do
    group deploy[:group]
    
    if platform?("ubuntu")
      owner "www-data"
    elsif platform?("amazon")   
      owner "apache"
    mode '0777'
    action :create
    recursive true
  end

  directory '#{deploy[:deploy_to]}/current/media' do
    group deploy[:group]
    
    if platform?("ubuntu")
      owner "www-data"
    elsif platform?("amazon")   
      owner "apache"
    mode '0777'
    action :create
    recursive true
  end
end
