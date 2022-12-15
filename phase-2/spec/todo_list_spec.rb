=begin
  - adds a todo
  - initializes an empty array

  
=end

require "todo_list"

describe "TodoList Integration" do
  it "constructs with an empty array" do
    todo_list = TodoList.new
    expect(todo_list.incomplete).to eq []
    expect(todo_list.complete).to eq [] 
  end

  it "adds a new todo" do
    todo_list = TodoList.new
    todo1 = Todo.new("Go for a run")
    todo_list.add(todo1)
    expect(todo_list.incomplete).to eq [todo1]
  end

  it "returns only the complete todos" do
    todo_list = TodoList.new
    todo1 = Todo.new("Go for a run")
    todo1.mark_done!
    todo2 = Todo.new("Call Noor")
    todo_list.add(todo1)
    todo_list.add(todo2)
    expect(todo_list.complete).to eq [todo1]
  end

  it "marks all todos as complete" do
    todo_list = TodoList.new
    todo1 = Todo.new("Go for a run")
    todo2 = Todo.new("Call Noor")
    todo_list.add(todo1)
    todo_list.add(todo2)
    todo_list.give_up!
    expect(todo_list.complete).to eq [todo1, todo2]
  end
end

describe TodoList do
  it "constructs" do
    todo_list = TodoList.new
  end
end

describe Todo do
  it "constructs" do
    todo = Todo.new("Go for a run")
    expect(todo.task).to eq "Go for a run"
  end

  it "fails if a string is not provided" do
    expect{ Todo.new({"key": 23}) }.to raise_error "Please provide a string value"
  end

  it "marks the task as done" do
    todo = Todo.new("Go for a run")
    todo.mark_done!
    expect(todo.done?).to eq true
  end
end