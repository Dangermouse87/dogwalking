class BookingsController < ApplicationController
  before_action :set_booking, only: [:update, :destroy]

  def index
    @bookings = Booking.all
  end

  def create
    @booking = Booking.new(booking_params)
    @dogsitting = Dogsitting.find(params[:dogsitting_id])
    @booking.dogsitting = @dogsitting
    if @booking.save
      redirect_to bookings_path
    else
      render 'dogsittings/show'
    end
  end

  def update
    @booking.update(booking_params)
    redirect_to bookings_path
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:starts_at, :ends_at)
  end

  def set_booking
    @bookings = Booking.find(params[:id])
  end
end
