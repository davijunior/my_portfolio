class ProfessionalInfosController < ApplicationController
  def index
    @professional_infos = ProfessionalInfo.all
    render json: @professional_infos
  end

  def show
    @professional_info = ProfessionalInfo.find(params[:id])
    render json: @professional_info
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Professional info not found' }, status: :not_found
  end

  def create
    @professional_info = ProfessionalInfo.new(professional_info_params)
    if @professional_info.save
      render json: @professional_info, status: :created
    else
      render json: @professional_info.errors, status: :unprocessable_entity
    end
  end

  def update
    @professional_info = ProfessionalInfo.find(params[:id])
    if @professional_info.update(professional_info_params)
      render json: @professional_info
    else
      render json: @professional_info.errors, status: :unprocessable_entity
    end
  end

  private

  def professional_info_params
    params.require(:professional_info).permit(:title, :company, :years_experience, :user_id)
  end
end
