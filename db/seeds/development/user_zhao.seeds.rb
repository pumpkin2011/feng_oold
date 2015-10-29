sequence_min = 1
sequence_max = 5

puts "-"*50
puts "创建招聘方测试帐号......."
puts "用户名: zhao@91tbm.com"
puts "密码: password"

user = UserZhao.create(
  name: "招聘方",
  email: "zhao@91tbm.com",
  mobile: "18621248234",
  password: 'password',
  confirmed_at: Time.now
)

# 公司
(sequence_min..sequence_max).each do |company_seq|
  user.companies.build(
    name: "淘帮忙_#{company_seq}",
    province: "310000",
    city: "310100",
    district: "310115",
    address: "海外高桥保税区富特北路18号联安大厦5楼",
    introduction: "淘帮忙项目起源地, 希望我们能离梦想更进一步"
  )
  user.save
end
