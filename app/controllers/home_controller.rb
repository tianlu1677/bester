class HomeController < ApplicationController

  def index
  end

  def test
    render json: { status: 'ok', params: params}
  end
end
