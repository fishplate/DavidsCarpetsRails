# Ranges controller for api requests.
class Api::RangesController < Api::BaseController

# curl
#  -H "Content-type: application/json"
#  -H "x-api-token: 123456"
# http://localhost:3000/api/ranges.json
  def index
    @ranges = CarpetRange.all
    render :json => {range: @ranges.as_json(:except => exceptions)}
  end

end