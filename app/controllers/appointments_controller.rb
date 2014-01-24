class AppointmentsController < ApplicationController
  before_action :get_patient, only: [:show, :update, :new, :create]
  before_action :get_user
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

  def show
  end

  def edit
  end

  def update
    if @patient.appointment.update(appointment_params)
      redirect_to appointments_path  
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

  # def index
  #   start_time = Date.today.at_beginning_of_month
  #   end_time = Date.today.at_end_of_month

  #   #@appointments = Appoinment.where(date: start_time..end_time)

  #   respond_to do |format|
  #     format.html
  #     format.json
  #   end
  # end

  protected

  def appointment_params
    params.require(:appointment).permit(
      :user_id,
      :patient_id,
      :starts_at_date,
      :starts_at_time,
      :first_name,
      :middle_name,
      :last_name,
      :doctor
    )
  end

  def get_patient
    @patient = Patient.find(params[:patient_id])
  end

  def get_user
    @user = current_user.id
  end

  def get_appointment
    @appointment = Appointment.find(params[:id])
  end
end

  

