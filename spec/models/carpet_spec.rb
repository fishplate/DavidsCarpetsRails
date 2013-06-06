require 'spec_helper'

describe Carpet do
  before(:each) do
    @att = {
      name: "new_carpet",
      price: 1.99,
      available_colours: %w( red blue brown)
    }
  end

  context "Basic Model functuons" do

    it "can create a new carpet" do
      carpet = Carpet.new(@att)
      carpet.save.should == true
    end

    it "can update an existing carpet" do
      carpet = Carpet.create!(@att)
      carpet.update_attributes(name: "this_carpet")
      carpet.name.should == "this_carpet"
    end

    it "can delete a carpet" do
      carpet = Carpet.create!(@att)
      expect { carpet.destroy }.to change(Carpet, :count).by(-1)
    end
  end

  context "Relation with CarpetRange" do
    before(:each) do
      @range = CarpetRange.create!(name: "range")
    end

    it "find carpet range for carpet" do
      carpet = @range.carpets.create!(@att)
      carpet.carpet_range.name.should == "range"
    end

  end
end
