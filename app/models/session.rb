class Session
  attr_reader :tasks, :available_time

  def initialize(duration)
    fail 'session must be an integer' unless duration.is_a? Integer
    @tasks = []
    @available_time = duration
  end

  def add(task)
    fail 'task is too long for session' unless add? task
    @available_time -= task.duration
    @tasks << task
  end

  def add?(task)
    return false if task.duration > @available_time
    true
  end

  def include?(task)
    @tasks.include? task
  end
end
