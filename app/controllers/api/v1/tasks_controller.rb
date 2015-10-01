class Api::V1::TasksController < ApplicationController

  def show
    render json: {teste: '132'}
  end

  def create
    if params[:teste]
      render json: {status: ok}
    end
  end

end
