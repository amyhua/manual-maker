class Manual < ActiveRecord::Base
  attr_accessible :name, :sections_attributes
  has_many :sections, :dependent => :destroy
  accepts_nested_attributes_for :sections, :reject_if => lambda { |s| s[:name].blank? }, :allow_destroy => true
  validates :name, :presence => true
end
