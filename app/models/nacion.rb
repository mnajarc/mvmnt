class Nacion < ActiveRecord::Base
  has_many :estados, dependent: :destroy
  accepts_nested_attributes_for :estados, allow_destroy: true
end
