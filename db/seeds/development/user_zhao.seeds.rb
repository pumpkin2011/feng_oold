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
  user.companies.create(
    name: "淘帮忙_#{company_seq}",
    province: "310000",
    city: "310100",
    district: "310115",
    address: "海外高桥保税区富特北路18号联安大厦5楼",
    introduction: "淘帮忙项目起源地, 希望我们能离梦想更进一步"
  )
end

# 联系人
(sequence_min..sequence_max).each do |contact_seq|
  user.contacts.create(
    name: "联系人#{contact_seq}号",
    mobile: "1309261890#{contact_seq}",
    gender: "male"
  )
end

# 职位
(sequence_min..sequence_max).each do |job_seq|
  user.jobs.create(
    name: "岗位标题#{job_seq}",
    gender: "unknown",
    age_min: "18",
    age_max: "30",
    salary_min: "2000",
    salary_max: "10000",
    salary_basic: "5000",
    position: Position.take,
    company: Company.take,
    contact: Contact.take
  )

  # 充值
  (sequence_min..sequence_max).each do |seq|
    c = CashIn.create(
      username: UserZhao.first.name,
      user_type: 'UserZhao',
      amount: 10000,
      serial_inner: "00001111#{seq}",
      channel: 'offline',
      note: 'a note for test'
    )
  end
end
