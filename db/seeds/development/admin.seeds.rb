puts "-"*50
puts "创建运营方测试帐号......."
puts "用户名: admin@91tbm.com"
puts "密码: password"


Admin.create(
  name: "运营方",
  email: "admin@91tbm.com",
  mobile: "18621248234",
  password: 'password',
  confirmed_at: Time.now
)
