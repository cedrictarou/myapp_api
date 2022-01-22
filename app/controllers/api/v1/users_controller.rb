class Api::V1::UsersController < ApplicationController # rubocop:disable Style/ClassAndModuleChildren
  before_action :authenticate_active_user

  def index
    # users = User.all
    render json: current_user.as_json(only: %i[id name email created_at])
  end
end
