class Transfer

  attr_accessor :status
  attr_reader :sender, :amount, :receiver
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      receiver.balance += amount
      sender.balance -= amount
      self.status = "complete"
    else
      reject
    end
  end


def reverse_transfer
  if valid? && receiver.balance > amount && self.status == "complete"
    sender.balance += amount
    receiver.balance -= amount
    self.status = "reversed"
  else
    reject
  end
end
  def reject
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
end
end
