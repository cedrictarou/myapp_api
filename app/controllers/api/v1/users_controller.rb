class Api::V1::UsersController < ApplicationController # rubocop:disable Style/ClassAndModuleChildren
  def index
    users = User.all
    render json: users.as_json(only: %i[id name email created_at])
  end
end
