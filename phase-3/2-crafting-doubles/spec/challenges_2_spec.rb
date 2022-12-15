RSpec.describe "doubles challenge" do
  it "creates a sophisticated double" do
    task = double(:task)
    task_list = double(:task_list, list: [task], clear: :success, count: 1)
    allow(task_list).to receive(:add).with(task)


    # Don't edit below
    task_list.add(task)
    expect(task_list.list).to eq [task]
    expect(task_list.count).to eq 1
    expect(task_list.clear).to eq :success
  end
end