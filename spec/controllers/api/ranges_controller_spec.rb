require 'spec_helper'

describe Api::RangesController do

  context "with invalid args index" do

    it "should return error if not json request" do
      err_msg = "Sorry the request must be in json"
      get :index
      result = JSON.parse(response.body)["errors"]
      result.first.should == err_msg
    end

    it "should return error if no key is provided" do
      err_msg = "HTTP Token: Access denied."
      get :index, :format => :json
      result = JSON.parse(response.body)["errors"]
      result.first.should == err_msg
    end

  end

  context "with valid args index" do
    before(:each) do
      request.env['HTTP_X_API_TOKEN'] = "123456"
      6.times do |n|
        CarpetRange.create!(name: "range#{n}")
      end
    end

    it "should return list of ranges" do
      get :index, :format => :json
      result = JSON.parse(response.body)
      result["range"].count.should == 6
    end

  end
end