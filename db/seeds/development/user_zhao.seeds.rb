sequence_min = 1
sequence_max = 5

puts "-"*50
puts "创建招聘方测试帐号......."
puts "用户名: zhao_#{sequence_min}@91tbm.com ~ zhao_#{sequence_max}@91tbm.com"
puts "密码: password"

(sequence_min..sequence_max).each do |user_seq|
  UserZhao.create(
    name: "招聘方_#{user_seq}",
    email: "zhao_#{user_seq}@91tbm.com",
    mobile: "18621248234#{user_seq}",
    password: 'password',
    confirmed_at: Time.now
  )
end
