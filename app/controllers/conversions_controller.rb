class ConversionsController < ApplicationController
  def index
    @conversions = Conversion.all
    @fetch_time = Conversion.first.try(:fetch_time)
    @error_message = session[:error_message]
    session[:error_message] = nil
  end

  def new
    redirect_to conversions_path
  end

  def create
    @conversion = Conversion.new(conversion_params)
    begin
      @conversion.save
    rescue ActiveRecord::RecordNotUnique
      error_message = "Error saving #{@conversion.convert_from} - #{@conversion.convert_to}. Conversion pair already existing."
      session[:error_message] = error_message
    end
    redirect_to conversions_path
  end

  def show
    redirect_to conversions_path
  end

  def destroy
    @conversion = Conversion.find(params[:id])
    @conversion.destroy
    redirect_to conversions_path
  end

  private
    def conversion_params
      params.require(:conversion).permit(:convert_from, :convert_to)
    end
end

