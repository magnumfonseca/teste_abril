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
    if @tasks.last && @tasks.last.duration == 0
      @tasks.insert(@tasks.length - 1,  task)
    else
      @tasks << task
    end

  end

  def add?(task)
    return false if task.duration > @available_time || has_unknow_duration_task?
    true
  end

  def include?(task)
    @tasks.include? task
  end

  def has_unknow_duration_task?
    @tasks.each do |task|
      return true if task.duration == 0
    end
    false
  end
end
