class Balance < ActiveRecord::Base

  has_many :user, :foreign_key => 'borrower_id', :class_name => "User"
  has_many :user, :foreign_key => 'lender_id', :class_name => "User"
end
