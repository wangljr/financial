class RecordsController < ApplicationController
  respond_to :html, :js

  def index
    @month = Time.now.strftime("%Y-%m")
    @records = Record.find_by_month(@month).paginate(:page => params[:page], :per_page => 15)
  end

  def month
    @month = params[:month] || Time.now.strftime("%Y-%m")
    @records = Record.find_by_month(@month).paginate(:page => params[:page], :per_page => 15)
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
end
