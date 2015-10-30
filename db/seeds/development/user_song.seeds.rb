sequence_min = 1
sequence_max = 5

puts "-"*50
puts "创建送人方测试帐号......."
puts "用户名: song_#{sequence_min}@91tbm.com ~ song_#{sequence_max}@91tbm.com"
puts "密码: password"

(sequence_min..sequence_max).each do |user_seq|
  usersong = UserSong.create(
    name: "送人方_#{user_seq}",
    email: "song_#{user_seq}@91tbm.com",
    mobile: "18621248234#{user_seq}",
    password: 'password',
    confirmed_at: Time.now
  )

  # 我的工友
  usersong.labors.build(
    name: "测试工友_#{user_seq}",
    mobile: "1355402836#{user_seq}",
    idcard: "42092319900109181#{user_seq}",
    gender: "male",
    birthday: "1982-11-25",
    state: "yidengji",
    province: "310000",
    city: "310100",
    district: "310115",
    channel: "web"
  )
  usersong.save
end
puts "-"*50
puts "创建测试工友..."
puts "用户名: 测试工友_#{sequence_min} ~ 测试工友_#{sequence_max}"
