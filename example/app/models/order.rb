class Order < ActiveRecord::Base
  attr_accessible :description, :name, :status
  has_many :destinations
  belongs_to :customer
end
