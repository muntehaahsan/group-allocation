class GroupStudent < ActiveRecord::Base
 belongs_to :group
 belongs_to :student
 accepts_nested_attributes_for :student
end
