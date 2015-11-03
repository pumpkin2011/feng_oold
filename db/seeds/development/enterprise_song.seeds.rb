sequence_min = 1
sequence_max = 5

puts "-"*50
puts "创建送人方测试帐号......."
puts "用户名: song@91tbm.com"
puts "密码: password"

enterprise = Enterprise.create(
  name: "送人方",
  email: "song@91tbm.com",
  mobile: "18621248234",
  password: 'password',
  confirmed_at: Time.now
)

# 我的工友
(sequence_min..sequence_max).each do |labor_seq|
  enterprise.labors.create(
    name: "测试工友_#{labor_seq}",
    mobile: "1355402836#{labor_seq}",
    idcard: "42092319900109181#{labor_seq}",
    gender: "male",
    birthday: "1982-11-25",
    state: "yidengji",
    province: "310000",
    city: "310100",
    district: "310115",
    channel: "web"
  )
end
