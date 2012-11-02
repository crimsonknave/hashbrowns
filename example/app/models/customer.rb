class Customer < ActiveRecord::Base
  attr_accessible :email_address, :first_name, :last_name, :phone

  has_many :orders
end
