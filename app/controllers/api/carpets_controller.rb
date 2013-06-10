# Carpet controller for API requests.
# Inherited from api base controller.
class Api::CarpetsController < Api::BaseController

  # Provide index of available carpets in range?
  def index
    if params[:range_id] && !params[:range_id].empty?
      range = CarpetRange.find(params[:range_id])
      @carpets = range.carpets.all
      render :json => {carpets: @carpets.as_json(:except => exceptions)}
    else
      render :status => 406, :json=>{
        :errors => ["No range provided"]
      }
    end
  end

end