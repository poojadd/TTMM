class Event < ActiveRecord::Base

  has_many :event_transactions
  has_many :users, :through => :event_transactions

  belongs_to :event_type
  accepts_nested_attributes_for :event_transactions, :allow_destroy => true

  before_save :set_amount

  def set_amount
    amount = 0
    self.event_transactions.each do |t|
      amount = amount + t.paid
    end
    self.amount = amount
  end
  def total_amount
     self.event_transactions.sum(:paid)
  end

  def users_count
    self.users.count()
  end

  def equal_share
    total_amount/users_count
  end

end
