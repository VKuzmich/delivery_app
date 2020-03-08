# frozen_string_literal: true

class CouriersController < ApplicationController
  before_action :set_courier, only: %i[show edit update destroy]

  def index
    @couriers = Courier.all.order('created_at DESC')
  end

  def show; end

  def new
    @courier = Courier.new
  end

  def create
    @courier = Courier.new(courier_params)

    if @courier.save
      redirect_to @courier
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @courier.update(courier_params)
      redirect_to @courier
    else
      render 'edit'
    end
  end

  def destroy
    @courier.destroy

    redirect_to couriers_path
  end

  private

  def set_courier
    @courier = Courier.find(params[:id])
  end

  def courier_params
    params.require(:courier).permit(:name, :email)
  end
end
