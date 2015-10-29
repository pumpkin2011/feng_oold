puts "-"*50
puts "创建导航菜单......."

# 招聘方
Node.create(name: '招聘管理', icon: 'fa-link', uri: '#', domain: 'zhao')
Node.create(name: '工友管理', icon: 'fa-road', uri: '#', domain: 'zhao')
Node.create(name: '公司管理', icon: 'fa-road', uri: '#', domain: 'zhao')
Node.create(name: '联系人管理', icon: 'fa-road', uri: '#', domain: 'zhao')
Node.create(name: '财务管理', icon: 'fa-road', uri: '#', domain: 'zhao')
Node.create(name: '我的评价', icon: 'fa-road', uri: '#', domain: 'zhao')

# 送人方
Node.create(name: '工友登记', icon: 'fa-road', uri: '#', domain: 'song')
Node.create(name: '我的工友', icon: 'fa-link', uri: '#', domain: 'song')
Node.create(name: '报名信息', icon: 'fa-link', uri: '#', domain: 'song')
Node.create(name: '招聘信息', icon: 'fa-link', uri: '#', domain: 'song')
Node.create(name: '财务管理', icon: 'fa-link', uri: '#', domain: 'song')
Node.create(name: '我的评价', icon: 'fa-link', uri: '#', domain: 'song')

# 运营方
Node.create(name: '用户管理', icon: 'fa-road', uri: '#', domain: 'admin')
Node.create(name: '工友管理', icon: 'fa-link', uri: '#', domain: 'admin')
Node.create(name: '招聘管理', icon: 'fa-link', uri: '#', domain: 'admin')
Node.create(name: '财务管理', icon: 'fa-link', uri: '#', domain: 'admin')
Node.create(name: '报名管理', icon: 'fa-link', uri: '#', domain: 'admin')
Node.create(name: '数据统计', icon: 'fa-link', uri: '#', domain: 'admin')

Node.all.each{ |node| node.mark_as_published! }
