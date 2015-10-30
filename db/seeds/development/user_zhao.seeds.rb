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

# 联系人
(sequence_min..sequence_max).each do |contact_seq|
  user.contacts.build(
    name: "联系人#{contact_seq}号",
    mobile: "1309261890#{contact_seq}",
    gender: "male"
  )
  user.save
end
