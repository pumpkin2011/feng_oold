sequence_min = 1
sequence_max = 5

puts "-"*50
puts "创建送人方测试帐号......."
puts "用户名: song_#{sequence_min}@91tbm.com ~ song_#{sequence_max}@91tbm.com"
puts "密码: password"

(sequence_min..sequence_max).each do |user_seq|
  UserSong.create(
    name: "送人方_#{user_seq}",
    email: "song_#{user_seq}@91tbm.com",
    mobile: "18621248234#{user_seq}",
    password: 'password',
    confirmed_at: Time.now
  )
end
