# File: lib/todo_list.rb
class TodoList
  def initialize
    @todos = []
  end

  def add(todo) # todo is an instance of Todo
    @todos << todo
  end

  def incomplete
    # Returns all non-done todos
    @todos.select do |todo|
      !todo.done?
    end
  end

  def complete
    # Returns all complete todos
    @todos.select do |todo|
      todo.done?
    end
  end

  def give_up!
    # Marks all todos as complete
    c
  end
end

# File: lib/todo.rb
class Todo
  def initialize(task) # task is a string
    raise "Please provide a string value" if task.class != String
    @task = task
    @done = false
  end

  def task
    # Returns the task as a string
    @task
  end

  def mark_done!
    # Marks the todo as done
    # Returns nothing
    @done = true
  end

  def done?
    # Returns true if the task is done
    # Otherwise, false
    @done
  end
end