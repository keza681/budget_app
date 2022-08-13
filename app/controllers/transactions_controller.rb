class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[show edit update destroy]

  def index
    @category = Category.find(params[:category_id])
    @transactions = @category.transactions.order(created_at: :desc)
    @total_money = @transactions.sum(:amount)
  end

  def show; end

  def new
    @user = current_user
    @category = Category.find(params[:category_id])
    @transaction = Transaction.new
  end

  def edit; end


  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.user_id = current_user.id
    @transaction.category_id = Category.find_by_id(params[:category_id]).id
    respond_to do |format|
      if @transaction.save
        format.html do
          redirect_to category_transactions_path(@transaction.category_id), notice: 'Congratulations, Your Transaction was successfully created.'
        end
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(:user_id, :name, :category_id, :amount)
  end
end
