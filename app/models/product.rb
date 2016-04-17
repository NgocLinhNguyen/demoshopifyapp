class Product < ActiveRecord::Base
  belongs_to :account
  has_many :variants
end
