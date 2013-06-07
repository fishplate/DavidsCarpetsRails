require 'spec_helper'

describe CarpetRange do
  before(:each) do
    @att = {
      name: "new_range"
    }
  end

  context "Basic Model functuons" do

    it "can create a new Range" do
      c_range = CarpetRange.new(@att)
      c_range.save.should == true
    end

    it "can update an existing range" do
      c_range = CarpetRange.create!(@att)
      c_range.update_attributes(name: "this_range")
      c_range.name.should == "this_range"
    end

    it "can delete a range" do
      c_range = CarpetRange.create!(@att)
      expect { c_range.destroy }.to change(CarpetRange, :count).by(-1)
    end
  end

  context "Relation with Carpets" do
    before(:each) do
      @range = CarpetRange.create!(@att)
      @c_att = {
        name: "new_carpet",
        price: 1.99,
        available_colours: %w( red blue brown)
      }
    end

    it "can create a carpet for range" do
      carpet = @range.carpets.new(@c_att)
      carpet.save.should == true
    end

    it "can delete a carpet for range" do
      carpet = @range.carpets.create!(@c_att)
      expect { carpet.destroy }.to change(Carpet, :count).by(-1)
    end

    it "removes carpet if range is deleted" do
      carpet = @range.carpets.create!(@c_att)
      expect { @range.destroy }.to change(Carpet, :count).by(-1)
    end

  end

end
