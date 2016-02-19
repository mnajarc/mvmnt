class Estado < ActiveRecord::Base
  belongs_to :nacion
  has_many :localidads, dependent: :destroy
  accepts_nested_attributes_for :localidads, allow_destroy: true
end
