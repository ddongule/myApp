class TeamController < ApplicationController
  before_action :authenticate_user!
  ## ,except: [:index] 이렇게 예외를 줄 수도 있음

  def index
  end

  def sec_cau
  end
end
