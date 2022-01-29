class CustomersController < ApplicationController
  before_action :set_customer, only: %i[ destroy ]

  def index
    if params[:order] == 'vehicle_type'
      @customers = Customer.order('vehicle_type')
    elsif params[:order] == 'vehicle_length'
      @customers = Customer.order('vehicle_length') 
    elsif params[:order] == 'full_name'
      @customers = Customer.sort_by_full_name
    elsif params[:search_by_first_name_or_last_name]
      @customers = Customer.search_by_first_name_or_last_name(params[:search_by_first_name_or_last_name])
    elsif params[:search_vehicle_name]
      @customers = Customer.search_by_vehicle_name(params[:search_vehicle_name])
    elsif params[:search_vehicle_type]
      @customers = Customer.search_by_vehicle_type(params[:search_vehicle_type])
    else
      @customers = Customer.order_by_created_at
      respond_to do |format|
        format.html
        format.csv { send_data @customers.to_csv, filename: "customers-#{Date.today}.csv" }
      end  
    end 
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to customer_url(@customer), notice: "Customer was successfully created." }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to customers_url, notice: "Customer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def import
    Customer.import(params[:file])
    redirect_to customers_url, notice: "Customers Imported Successfully"
  end

  private
    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :email, :vehicle_name, :vehicle_type, :vehicle_length)
    end
end
