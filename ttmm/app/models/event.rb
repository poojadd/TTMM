class Event < ActiveRecord::Base

  has_many :event_transactions
  has_many :users, :through => :event_transactions

  belongs_to :event_type
  accepts_nested_attributes_for :event_transactions, :allow_destroy => true

  before_save :set_amount
  after_save :set_balance

  def set_balance
    @et = self.event_transactions.where(:attended => true)
    @borrower_users = self.event_transactions.where('debt < ?', 0)
    @lender_users = self.event_transactions.where('debt > ?', 0)
    equal_share = self.amount/@et.count
    @borrower_users.each do |bu|
      chk = bu.debt
      @lender_users.each do |lu|
        p '-------------------------------'
        p lu
        p '-------------------------------'
        if chk != 0
          sum = lu.debt + chk
          @balance = Balance.where(:borrower_id => bu.user_id, :lender_id => lu.user_id)
          if sum == 0
            if @balance.blank?
              Balance.create(:borrower_id => bu.user_id, :lender_id => lu.user_id, :amount => lu.debt)
            else
              @total = @balance.first.amount + lu.debt
              @balance.first.update_attribute(:amount, @total)
            end
            chk = 0
          end
          if sum > 0
            if @balance.blank?
              Balance.create(:borrower_id => bu.user_id, :lender_id => lu.user_id, :amount => bu.debt)
            else
              @total = @balance.first.amount + bu.debt
              @balance.first.update_attribute(:amount,@total)
            end
            chk = chk + (bu.debt * -1)
          end
          if sum < 0
            if @balance.blank?
              Balance.create(:borrower_id => bu.user_id, :lender_id => lu.user_id, :amount => lu.debt)
            else
              @total = @balance.first.amount + lu.debt
              @balance.first.update_attribute(:amount,@total)
            end
            chk = chk + lu.debt
          end
        end
      end
    end
  end

  def set_amount
    amount = 0
    count = 0
    self.event_transactions.each do |t|
      t.paid = 0 if t.paid.nil?
      amount = amount + t.paid if t.attended == true
      count = count + 1 if t.attended == true
      t.paid = 0 if t.attended == false
    end
    self.amount = amount
    equal_share = amount/count
    self.event_transactions.each do |t|
        t.debt = t.paid - equal_share if t.attended == true
        t.debt = 0 if t.attended == false
    end
  end

  def self.total_amount
     self.all.sum(:amount)
  end

  def self.unsettled
    self.where(settled: false)
  end

  def self.settled
    self.where(settled: true)
  end

  def users_count
    self.users.count()
  end



end
