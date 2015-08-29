node[:deploy].each do |app_name, deploy|
  execute "mysql-create-table" do
    command "/usr/bin/mysql -u#{deploy[:database][:username]} -p#{deploy[:database][:password]} #{deploy[:database][:database]} -e'CREATE TABLE #{node[:phpapp][:dbtable]}(
    session_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    ip_address VARCHAR(63) NOT NULL,
    user_agent VARCHAR(63) NOT NULL,
    last_activity INT(10) UNSIGNED NOT NULL,
    user_agent TEXT NOT NULL,
    PRIMARY KEY (session_id),
    KEY last_activity_idx (last_activity)
  )'"
    not_if "/usr/bin/mysql -u#{deploy[:database][:username]} -p#{deploy[:database][:password]} #{deploy[:database][:database]} -e'SHOW TABLES' | grep #{node[:phpapp][:dbtable]}"
    action :run
  end
end
