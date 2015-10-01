class Planner
  def plan(tasks, session_lenghts)
    sessions = setup_sessions(session_lenghts)
    iterate_over_sessions(sessions, tasks)
  end

  def setup_sessions(session_lenghts)
    sessions = [] 

    session_lenghts.each do |session_lenght|
      sessions.push(Session.new(session_lenght))
    end

    sessions
  end

  def iterate_over_sessions(sessions, tasks)
    tasks_processed = Array.new(tasks.length, false)

    sessions.each do |session|
      iterate_over_tasks(session, tasks, tasks_processed)
    end
    sessions
  end

  def iterate_over_tasks(session, tasks, tasks_processed)
    tasks.each_with_index do |task, index|
      next if tasks_processed[index]
      if session.add?(task)
        session.add(task)
        tasks_processed[index] = true
      end
    end
  end

  private :setup_sessions, :iterate_over_sessions, :iterate_over_tasks
end
