require 'rails_helper'

describe 'task' do
  it 'populates description and length correctly with length specified'\
    ' in minutes' do
    task = Task.new('this is a task 45 minutos')

    expect(task.description).to eq('this is a task')
    expect(task.duration). to eq(45)
  end
end
