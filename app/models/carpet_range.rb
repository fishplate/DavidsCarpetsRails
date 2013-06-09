# Carpet Range will contain names of all ranges available
class CarpetRange < ActiveRecord::Base
  attr_accessible :name
  has_many :carpets, :dependent => :destroy
end
