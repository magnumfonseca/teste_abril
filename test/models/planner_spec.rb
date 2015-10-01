require 'spec_helper'

describe 'planner' do
  it 'can add tasks to a session when there is enough time' do
    list = []

    task1 = Task.new 'task one 10 minutos'
    task2 = Task.new 'task two 20 minutos'
    list << task1 << task2

    planner = Planner.new

    result = planner.plan list, [30]

    expect(result[0].tasks.length).to eq 2
    expect(result[0].tasks[0]).to eq task1
    expect(result[0].tasks[1]).to eq task2
  end

  it 'can go to a second session when the first is full' do
    list = []

    task1 = Task.new 'task one 10 minutos'
    task2 = Task.new 'task two 20 minutos'
    task3 = Task.new 'task three 20 minutos'
    list << task1 << task2 << task3

    planner = Planner.new

    result = planner.plan list, [30, 30]

    expect(result.length).to eq 2
    expect(result[0].tasks.length).to eq 2
    expect(result[0].tasks[0]).to eq task1
    expect(result[0].tasks[1]).to eq task2
    expect(result[1].tasks.length).to eq 1
    expect(result[1].tasks[0]).to eq task3
  end

  it 'it splits four tasks across two sessions' do
    list = []

    task1 = Task.new 'task one 20 minutos'
    task2 = Task.new 'task two 20 minutos'
    task3 = Task.new 'task three 10 minutos'
    task4 = Task.new 'task four 10 minutos'
    list << task1 << task2 << task3 << task4

    planner = Planner.new

    result = planner.plan list, [30, 30]

    expect(result.length).to eq 2
    expect(result[0].tasks.length).to eq 2
    expect(result[0].tasks[0]).to eq task1
    expect(result[0].tasks[1]).to eq task3
    expect(result[1].tasks.length).to eq 2
    expect(result[1].tasks[0]).to eq task2
    expect(result[1].tasks[1]).to eq task4
  end
end
