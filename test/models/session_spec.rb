require 'rails_helper'

describe 'session' do
  it 'fails if the session length is not a integer' do
    expect { Session.new 'xxx' }.to raise_error \
      'session must be an integer'
  end

  it 'can add a task to a session' do
    session = Session.new 100
    task = Task.new 'a task 25 minutos'

    session.add task

    expect(session).to include task
  end

  it 'add? returns true if task length < available time in session' do
    session = Session.new 20
    task1 = Task.new 'a task 10 minutos'

    expect(session.add? task1).to eq true
  end

  it 'add? returns true if task length = available time in session' do
    session = Session.new 20
    task1 = Task.new 'a task 20 minutos'

    expect(session.add? task1).to eq true
  end

  it 'add? returns false if task length > available time in session' do
    session = Session.new 20
    task1 = Task.new 'a task 30 minutos'

    expect(session.add? task1).to eq false
  end

  it 'will not add a task if there is not enough time in a session' do
    session = Session.new 20
    task = Task.new 'a too long task 25 minutos'

    expect { session.add task }.to raise_error 'task is too long for session'
  end

  it 'will not add a second task if the total time is too long' do
    session = Session.new 20
    task1 = Task.new 'a task 10 minutos'
    task2 = Task.new 'a too long task 15 minutos'

    session.add task1
    expect(session).to include task1

    expect { session.add task2 }.to raise_error 'task is too long for session'
  end

  it 'avaliable time is zero when all time is used up' do
    session = Session.new 20
    task1 = Task.new 'a task 10 minutos'
    task2 = Task.new 'an ok task 10 minutos'

    session.add task1
    session.add task2

    expect(session).to include task1
    expect(session).to include task2
    expect(session.available_time).to eq 0
  end

  it 'avaliable time is correct when tasks are added' do
    session = Session.new 20
    task1 = Task.new 'a task 10 minutos'
    task2 = Task.new 'an ok task 5 minutos'

    session.add task1
    session.add task2

    expect(session).to include task1
    expect(session).to include task2
    expect(session.available_time).to eq 5
  end
end
