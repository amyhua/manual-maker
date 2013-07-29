class Section < ActiveRecord::Base
  attr_accessible :description, :manual_id, :name, :steps_attributes
  belongs_to :manual
  has_many :steps, :dependent => :destroy
  accepts_nested_attributes_for :steps, :reject_if => lambda { |s| s[:content].blank? }, :allow_destroy => true  
  

end
