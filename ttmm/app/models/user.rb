class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :event_transactions
  has_many :events, :through => :event_transactions

  def total_event_share(event_id)
    self.events.where(id: event_id).first.event_transactions.sum(:paid)
  end

  def event_debt(event_id)
    total_event_share(event_id) - equal_share
  end

end
