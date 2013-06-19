# Carpet controller for API requests.
# Inherited from api base controller.
class Api::CarpetsController < Api::BaseController

  # Provide index of available carpets in range?
  def index
    range = CarpetRange.find_by_id(params[:range_id].to_i)
    if range
      @carpets = range.carpets.all
      render :json => {carpets: @carpets.as_json(:except => exceptions)}
    else
      render :status => 406, :json=>{
        :errors => ["No range found"]
      }
    end
  end

end