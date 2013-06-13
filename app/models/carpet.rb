# Carpet will contain details of all carpets
# and id of the range it belongs to
class Carpet < ActiveRecord::Base
  attr_accessible :name, :price, :available_colours, :carpet_range_id
  belongs_to :carpet_range
  # serialize in order to use array
  serialize :available_colours, Array

  # added for activeadmin
  attr_accessible   :available_colours_raw

  def available_colours_raw
    self.available_colours.join(" ") unless self.available_colours.nil?
  end

  def available_colours_raw=(values)
    self.available_colours = []
    self.available_colours=values.split(" ")
  end
end