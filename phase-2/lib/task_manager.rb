=begin
  The name of the class.
  - TaskManager

  The design of its initializer and the parameters it takes.
  - can optionally be initialised with a task
  - create instance variable to store the tasks

  The design of its public methods, including:
      Their names and purposes
      - tasks
      - complete_task(task)
      - add_task(task)

      What parameters they take and the data types.
      - all of them take a task as a a string
      What they return and that data type
      - should return a list of tasks as an array
      Any other side effects they might have.
      - ?
=end

class TaskManager
  def initialize(task)
    @tasks = [task]
  end

  def tasks()
    return @tasks
  end

  def complete_task(task)
    @tasks.delete(task)
  end

  def add_task(task)
     @tasks.push(task)
  end
end