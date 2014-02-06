class AppointmentsController < ApplicationController
  before_action :get_patient, only: [:show, :update, :new, :create]
  before_action :get_appointment, except: [:new, :create, :index]

  def new
    @appointment = @patient.appointments.new
  end

  def create
    @appointment = @patient.appointments.new(appointment_params)
    if @appointment.save 
      redirect_to appointments_path, notice: "Appointment booked."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to appointments_path, notice: "Appointment changed."  
    else
      render :edit, alert: 'Unable to save appointment'
    end
  end

  def index
    @appointments = Appointment.all
  end

  def destroy
    @appointment.destroy
    redirect_to :back, notice: "Appointment cancelled."
  end

  private

  def appointment_params
    params.require(:appointment).permit(
      :user_id,
      :patient_id,
      :starts_at_date,
      :starts_at_time,
      :first_name,
      :middle_name,
      :last_name,
      :doctor,
      :notes,
      :status,
      :starts_at
    )
  end

  def get_patient
    @patient = Patient.find(params[:patient_id])
  end

  def get_appointment
    @appointment = Appointment.find(params[:id])
  end
end
