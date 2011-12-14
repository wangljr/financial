module AccountsHelper
  def balance account
    fund = Fund.current(account.id).first
    return fund.amount unless fund.nil?
  end
end
