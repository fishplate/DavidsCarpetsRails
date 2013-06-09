# Carpet will contain details of all carpets
# and id of the range it belongs to
class Carpet < ActiveRecord::Base
  attr_accessible :name, :price, :available_colours
  belongs_to :carpet_range
  # serialize in order to use array
  serialize :available_colours
end