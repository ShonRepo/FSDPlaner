@Project = Project.where("title = 'test1'").first
@Project.todos.create(text:'test',isCompleted: true)
@Project.todos.create(text:'test2',isCompleted: false)
