# Ranges controller for api requests.
class Api::RangesController < Api::BaseController

  # Method to return list of ranges
  def index
    @ranges = CarpetRange.all
    render :json => {range: @ranges.as_json(:except => [:id])}
  end
end