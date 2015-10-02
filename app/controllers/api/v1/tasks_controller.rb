class Api::V1::TasksController < ApplicationController

  def show
    formated_tasks = []
    unless @@tasks.blank?
      planner = Planner.new
      result = planner.plan(@@tasks, [180,240])
      result.each_with_index do |res, res_index|
        puts "Session #{res_index}"
        time = DateTime.new(2014, 12, 24, 9, 0, 0, -1) if res_index == 0
        time = DateTime.new(2014, 12, 24, 13, 0, 0, -1) if res_index == 1
        res.tasks.each do |task|
          format = format('%02d:%02d %s', time.hour, time.minute, task.description)
          puts format
          formated_tasks << format
          newtime = time + Rational(task.duration, 1440)
          time = newtime
        end
      end
    end
    render json: {tasks: formated_tasks}
  end

  def create
    render_bad_request unless params[:task]
    @@tasks << Task.new(params[:task])

    p @@tasks
    render json: {status: 'ok'}
  end

end
