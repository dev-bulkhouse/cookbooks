node[:deploy].each do |app_name, deploy|
  execute "mysql-create-table" do
    command "/usr/bin/mysql -u#{deploy[:database][:username]} -p#{deploy[:database][:password]} #{deploy[:database][:database]} -e'CREATE TABLE #{node[:phpapp][:dbtable]}(
    session_id VARCHAR(40) NOT NULL DEFAULT '0',
    ip_address VARCHAR(45) NOT NULL DEFAULT '0',
    user_agent VARCHAR(120) NOT NULL,
    last_activity INT(10) UNSIGNED NOT NULL DEFAULT '0',
    user_data TEXT NOT NULL,
    PRIMARY KEY (session_id),
    KEY last_activity_idx (last_activity)
  )'"
    not_if "/usr/bin/mysql -u#{deploy[:database][:username]} -p#{deploy[:database][:password]} #{deploy[:database][:database]} -e'SHOW TABLES' | grep #{node[:phpapp][:dbtable]}"
    action :run
  end
end
