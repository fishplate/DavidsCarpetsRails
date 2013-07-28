# Carpet controller for API requests.
# Inherited from api base controller.
class Api::CarpetsController < Api::BaseController

# curl
#  -H "Content-type: application/json"
#  -H "x-api-token: 123456"
# http://localhost:3000/api/ranges/:range_id/carpets.json
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