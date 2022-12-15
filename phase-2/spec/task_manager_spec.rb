require "task_manager"

describe "TaskManager Class" do
  it "initialises with a task when the class is created" do
    task_manager = TaskManager.new('go shopping')
    expect(task_manager.tasks).to eq ['go shopping']
  end

  it "adds tasks to the tasks array" do
    task_manager = TaskManager.new('go shopping')
    task_manager.add_task('eat dinner')
    expect(task_manager.tasks).to eq ['go shopping', 'eat dinner']
  end

  it "returns the list of tasks as an array" do
    task_manager = TaskManager.new('go shopping')
    expect(task_manager.tasks).to eq ['go shopping']
    expect(task_manager.tasks.class).to eq Array
  end

  it "removes a task from the list when it is completed" do
    task_manager = TaskManager.new('go shopping')
    task_manager.add_task('eat dinner')
    task_manager.complete_task('go shopping')
    expect(task_manager.tasks).to eq ['eat dinner']
  end
end