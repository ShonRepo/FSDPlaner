if Project.count.zero?
  puts 'Seeding projects'
  Project.create(title: 'test1')
end
