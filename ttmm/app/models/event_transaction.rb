class EventTransaction < ActiveRecord::Base

  attr_accessor :present

  belongs_to :event
  belongs_to :user
  validates :paid,:numericality => true, allow_blank: true
end