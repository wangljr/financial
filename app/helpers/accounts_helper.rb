module AccountsHelper
  def balance account
    fund = Fund.current(account.id).first
    return fund.amount unless fund.nil?
  end

  def sum accounts
    sum = 0
    accounts.each do |account|
      sum += balance account unless balance(account).nil?
    end
    return sum
  end
end
