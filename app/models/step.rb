class Step < ActiveRecord::Base
  attr_accessible :content, :section_id
  belongs_to :section
end
