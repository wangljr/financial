class RecordsController < ApplicationController
  respond_to :html, :js

  def index
    @month = Time.now.strftime("%Y-%m")
    @records = Record.find_by_month(@month).paginate(:page => params[:page], :per_page => 15)
    records = Record.find_by_month(@month)
    @income_sum = income_sum records
    @outlay_sum = outlay_sum records
  end

  def month
    @month = params[:month] || Time.now.strftime("%Y-%m")
    @records = Record.find_by_month(@month).paginate(:page => params[:page], :per_page => 15)
    records = Record.find_by_month(@month)
    @income_sum = income_sum records
    @outlay_sum = outlay_sum records
  end

  def category
    @records = Record.all
  end

  def show
    @record = Record.find(params[:id])
  end

  def new
    @record = Record.new
  end

  def edit
    @record = Record.find(params[:id])
  end

  def create
    @record = Record.new(params[:record])

    if @record.save
      flash[:notice] = 'save_successful'
      redirect_to new_record_path
    else
      render action: "new"
    end
  end

  # PUT /records/1
  # PUT /records/1.json
  def update
    @record = Record.find(params[:id])

    if @record.update_attributes(params[:record])
      redirect_to edit_record_path(@record), notice: 'Record was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @record = Record.find(params[:id])
    @record.destroy
    redirect_to(records_path)
  end

  private
  def income_sum records
    sum = 0
    unless records.nil? || records.empty?
      records.each do |record|
        sum += income record unless income(record).nil?
      end
    end
    return sum
  end

  private
  def outlay_sum records
    sum = 0
    unless records.nil? || records.empty?
      records.each do |record|
        sum += outlay record unless outlay(record).nil?
      end
    end
    return sum
  end

  private
  def income record
    cate = record.category
    until cate.category.nil?
      cate = cate.category
    end
    return cate.id==1 ? record.fee : nil
  end

  private
  def outlay record
    cate = record.category
    until cate.category.nil?
      cate = cate.category
    end
    return cate.id==2 ? record.fee : nil
  end
end
