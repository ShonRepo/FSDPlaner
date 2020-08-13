@Project = Project.where("title = 'testing task'").first
@Project.todos.create(text:'Инициализация API',isCompleted: true)
@Project.todos.create(text:'API для списка задач',isCompleted: true)
@Project.todos.create(text:'фронтенд приложения',isCompleted: true)
@Project.todos.create(text:'фронтенд для списка задач',isCompleted: true)
@Project.todos.create(text:'Собеседование',isCompleted: false)
