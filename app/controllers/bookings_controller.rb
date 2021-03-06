class BookingsController < ApplicationController
    def show
        booking = Booking.find(params[:id])
        render json: booking, include: [:guest, :property]
    end

    def index
        bookings = Booking.all
        render json: bookings
    end

    def new
        @booking = Booking.new
    end
  
    def create
        @guest = params[:guest_id]
        @property = params[:property_id]
        @startDate = params[:startDate]
        @endDate = params[:endDate]
        @booking = Booking.create(guest_id: @guest , property_id: @property , startDate: @startDate, endDate: @endDate, confirmed: false)
        render json: @booking
    end

    def update
        @booking = Booking.find(params[:id])
        @booking.update(confirmed: params[:confirmed])
        render json: @booking, include: [:guest, :property]
    end

    def destroy
        @booking = Booking.find(params[:id])
        @booking.destroy
    end
end
