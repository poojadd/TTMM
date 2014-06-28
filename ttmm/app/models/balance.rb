class Balance < ActiveRecord::Base

  belongs_to :borrower_user, :foreign_key => 'borrower_id', :class_name => "User"
  belongs_to :lender_user, :foreign_key => 'lender_id', :class_name => "User"

  #has_many :user, :foreign_key => 'borrower_id', :class_name => "User"
  #has_many :user, :foreign_key => 'lender_id', :class_name => "User"
end
