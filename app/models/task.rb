class Task
  attr_reader :description, :duration

  def initialize(task)
    words = task.split

    if words.last == 'minutos'
      @duration = words.last(2).first.to_i
      words.pop(2)
    else
      @duration = 0
    end

    @description = words.join(' ')
  end
end
