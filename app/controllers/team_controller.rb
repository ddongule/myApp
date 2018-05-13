class TeamController < ApplicationController
  before_action :authenticate_user!
  ## ,except: [:index] 이렇게 예외를 줄 수도 있음

  # before_action :check_user_in_cau, only: [:secret]

  def index
    @teamid = params[:teamid]
    @users = User.where("team_id = ?", params[:teamid])
    @admins = @users.select { |user| user.roles.last.name == 'admin'}
    @students = @users.select { |user| user.roles.last.name == 'student'}
  end

  def admin
    user = current_user
    user.add_role :admin # sets a global role
    redirect_back(fallback_location: root_path)
  end

  def student
    user = current_user
    user.add_role :student # sets a global role
    redirect_back(fallback_location: root_path)
  end

  def secret

  end

  def team_show
    @teamid = params[:teamid]
    @users = User.where("team_id = ?", params[:teamid])
    @admins = @users.select { |user| user.roles.last.name == 'admin'}
    @students = @users.select { |user| user.roles.last.name == 'student'}
  end


  def sec_cau

  end

  def board
  end

  def selectTeam
    @teamnum = params[:teamid]
    current_user.team_id = @teamnum
    current_user.save
    redirect_back(fallback_location: root_path)
  end

  def check_user_in_cau
    if user_signed_in?
      @user_team = current_user.team_id
      if
        ([1,2,3].include? @user_team)
      else
          redirect_back(fallback_location: root_path)
      end
    end
  end

end
