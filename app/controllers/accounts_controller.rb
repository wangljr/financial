class AccountsController < ApplicationController

  def index
    @accounts = Account.all
  end

  def new
    @account = Account.new
  end

    def create
    @account = Account.new(params[:account])

    if @account.save
      flash[:notice] = 'save_successful'
      redirect_to new_account_path
    else
      render action: "new"
    end
  end

end
