require 'spec_helper'

describe Api::CarpetsController do
  before(:each) do
    carpet = {
      name: "new_carpet",
      price: 1.99,
      available_colours: %w( red blue brown)
    }
    @range = CarpetRange.create!(name: "test_range")
    @range.carpets.create!(carpet)
  end

  context "with invalid args index" do

    it "should return error if not json request" do
      err_msg = "Sorry the request must be in json"
      get :index, range_id: @range.id
      result = JSON.parse(response.body)["errors"]
      result.first.should == err_msg
    end

    it "should return error if no key is provided" do
      err_msg = "HTTP Token: Access denied."
      get :index, range_id: @range.id, :format => :json
      result = JSON.parse(response.body)["errors"]
      result.first.should == err_msg
    end

  end

  context "with valid args index" do
    before(:each) do
      request.env['HTTP_X_API_TOKEN'] = "123456"
    end

    it "should return list of carpets for given range" do
      get :index, range_id: @range.id, :format => :json
      result = JSON.parse(response.body)["carpets"]
      result.count.should == 1
      result.first["name"].should == "new_carpet"
    end
  end
end