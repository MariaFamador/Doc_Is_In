class AppointmentsController < ApplicationController

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to @appointment, notice: "Appointment booked."
    else
      render :new, notice: "Unable to book appointment."
    end
  end

  def show
    
  end

  def index
    start_time = Date.today.at_beginning_of_month
    end_time = Date.today.at_end_of_month

    #@appointments = Appoinment.where(date: start_time..end_time)

    respond_to do |format|
      format.html
      format.json
    end
  end

  protected

  def appointment_params
    params.require(:appointment).permit(
      :user_id,
      :patient_id,
      :appointment_date,
      :first_name,
      :middle_name,
      :last_name,
      :doctor
    )
  end
end

  

