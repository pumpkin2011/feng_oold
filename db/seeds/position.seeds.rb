puts "-"*50
puts "创建职位数据......."

puts "生活|服务业"
top = Position.create(name: '生活服务', name_seo: 'shenghuofuwu')
[
  Position.create(name: '餐饮', name_seo: 'zplvyoujiudian') do |position|
    position.children.build([
      {name: '服务员', name_seo: 'cantfwy'},
      {name: '厨师/厨师长', name_seo: 'canguan'},
      {name: '洗碗工', name_seo: 'xiwangong'},
    ])
    position.save
  end,
  Position.create(name: '美容/美发', name_seo: 'meirongjianshen') do |position|
    position.children.build([
      {name: '发型师', name_seo: 'faxingshi'},
      {name: '美发助理/学徒', name_seo: 'meifaxuetu'},
      {name: '洗头工', name_seo: 'xitougong'},
    ])
    position.save
  end,
  Position.create(name: '保健按摩', name_seo: 'zpanmo') do |position|
    position.children.build([
      {name: '按摩师', name_seo: 'zhenjiuzg'},
      {name: '足疗师', name_seo: 'baojiananmozuliao'},
      {name: '搓澡工', name_seo: 'zpcuozao'},
    ])
    position.save
  end
].each do |position|
  position.move_to_child_of(top)
end

puts "生产|物流|质控|汽车"
top = Position.create(name: '生产|物流|质控|汽车', name_seo: 'shengchan')
[
  Position.create(name: '普工/技工', name_seo: 'zpshengchankaifa') do |position|
    position.children.build([
      {name: '普工', name_seo: 'pugong'},
      {name: '综合维修工', name_seo: 'weixiugongchengshi'},
      {name: '制冷/水暖工', name_seo: 'nuantonggong'},
    ])
    position.save
  end,
  Position.create(name: '服装/纺织/食品', name_seo: 'xiaofeipin') do |position|
    position.children.build([
      {name: '服装设计师', name_seo: 'fuzhuangsheji'},
      {name: '纺织品设计师', name_seo: 'fangzhisheji'},
      {name: '服装打样/制版', name_seo: 'fuzhuangdayang'},
    ])
    position.save
  end,
  Position.create(name: '质控/安防', name_seo: 'zhikonganfang') do |position|
    position.children.build([
      {name: '质量管理/测试经理', name_seo: 'zhiliangguanli'},
      {name: '质量检验员/测试员', name_seo: 'zhijianyuan'},
      {name: '测试工程师', name_seo: 'ceshigongchengshi'},
    ])
    position.save
  end
].each do |position|
  position.move_to_child_of(top)
end

puts "人力|行政|管理"
top = Position.create(name: '人力|行政|管理', name_seo: 'guanli')
[
  Position.create(name: '人事/行政/后勤', name_seo: 'renli') do |position|
    position.children.build([
      {name: '文员', name_seo: 'wenziluru'},
      {name: '前台/总机/接待', name_seo: 'qiantai'},
      {name: '人事专员/助理', name_seo: 'zhaopinjingli'},
    ])
    position.save
  end,
  Position.create(name: '司机', name_seo: 'siji') do |position|
    position.children.build([
      {name: '商务司机', name_seo: 'shangwujiaochesiji'},
      {name: '客运司机', name_seo: 'changtukeyuansiji'},
      {name: '货运司机', name_seo: 'sonhuosiji'},
    ])
    position.save
  end,
  Position.create(name: '高级管理', name_seo: 'zpguanli') do |position|
    position.children.build([
      {name: 'CEO/总裁/总经理', name_seo: 'zpzongcai'},
      {name: '首席运营官COO', name_seo: 'shouxiyunying'},
      {name: '首席财务官CFO', name_seo: 'shouxicaiwu'},
    ])
    position.save
  end
].each do |position|
  position.move_to_child_of(top)
end
