class PersonalInfosController < ApplicationController
  def index
    @personal_infos = PersonalInfo.all
    render json: @personal_infos
  end

  def show
    @personal_info = PersonalInfo.find(params[:id])
    render json: @personal_info
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Personal info not found' }, status: :not_found
  end

  def create
    @personal_info = PersonalInfo.new(personal_info_params)
    if @personal_info.save
      render json: @personal_info, status: :created
    else
      render json: @personal_info.errors, status: :unprocessable_entity
    end
  end

  def update
    @personal_info = PersonalInfo.find(params[:id])
    if @personal_info.update(personal_info_params)
      render json: @personal_info
    else
      render json: @personal_info.errors, status: :unprocessable_entity
    end
  end

  private

  def personal_info_params
    params.require(:personal_info).permit(:bio, :hobbies, :user_id)
  end
end
