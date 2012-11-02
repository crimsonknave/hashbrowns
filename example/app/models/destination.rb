class Destination < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :phone, :state, :zip
  belongs_to :order
end
