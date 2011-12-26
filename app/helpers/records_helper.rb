# -*- coding: utf-8 -*-
module RecordsHelper
  def cate_name category
    if category.category.id==1 || category.category.id==2
      return category.name
    else
      return category.category.name + ' - ' + category.name
    end
  end

  def income record
    cate = record.category
    until cate.category.nil?
      cate = cate.category
    end
    return cate.id==1 ? record.fee : nil
  end

  def outlay record
    cate = record.category
    until cate.category.nil?
      cate = cate.category
    end
    return cate.id==2 ? record.fee : nil
  end

  def defaultDate
    return @record.date.nil? ? Time.now.strftime("%Y-%m-%d") : @record.date
  end

  def cate_list categories
    list = [];
    unless categories.nil? || categories.empty?
      categories.each do |cate|
        list.push cate
        unless cate.categories.empty?
          cate.categories.each do |sub_cate|
            sub_cate.name='&nbsp;&nbsp;&nbsp;'.concat(sub_cate.name).html_safe
            list.push sub_cate
          end
        end
      end
    end
    return list
  end
end
