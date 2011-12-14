module RecordsHelper
  def income record
    return record.category.category.id==1 ? record.fee : nil
  end

  def outlay record
    return record.category.category.id==2 ? record.fee : nil
  end

  def defaultDate
    Time.now.strftime("%Y-%m-%d")
  end

end
