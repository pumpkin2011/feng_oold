sequence_min = 1
sequence_max = 5

puts "-"*50
puts "创建运营方测试帐号......."
puts "用户名: admin_#{sequence_min}@91tbm.com ~ admin_#{sequence_max}@91tbm.com"
puts "密码: password"

(sequence_min..sequence_max).each do |user_seq|
  UserAdmin.create(
    name: "运营_#{user_seq}",
    email: "admin_#{user_seq}@91tbm.com",
    mobile: "18621248234#{user_seq}",
    password: 'password',
    confirmed_at: Time.now
  )
end
