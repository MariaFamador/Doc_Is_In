class AppointmentsController < ApplicationController
  before_action :get_patient, only: [:update, :new, :create]
  before_action :get_appointment, except: [:new, :create, :index, :calendar, :show]

  def new
    @appointment = @patient.appointments.new
  end

  def create
    @appointment = @patient.appointments.new(appointment_params)
    respond_to do |format|
      if @appointment.save 
        format.html { redirect_to patient_path(@patient, get_tab), notice: "Appointment booked." }
        format.js { @status = "success" }
      else
        format.html { render :new }
        format.js { render :new }
      end
    end
  end

  def edit
    @patient = @appointment.patient
  end

  def update
    respond_to do |format|
      if @appointment.update(appointment_params) 
        patient = @appointment.patient
        format.html { redirect_to patient_path(patient, get_tab), notice: "Appointment changed." } 
        format.js { @status = "success" }
      else
        format.html { render :edit }
        format.js { render :edit }
      end
    end
  end

  def index
    @appointments = Appointment.all
    @appointments.order(:starts_at)
  end

  def calendar
    @appointments = Appointment.all

    respond_to do |format|
      format.json
      format.html
    end
  end

  def show
    
  end

  def cancel
    patient = @appointment.patient
    @appointment.kancel
    redirect_to patient_path(patient, get_tab), notice: "Appointment cancelled."
  end

  def destroy
    patient = @appointment.patient
    @appointment.destroy
    redirect_to patient_path(patient, get_tab), notice: "Appointment deleted."
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
      :notes,
      :starts_at,
      :status,
      :cancel,
      :form
    )
  end

  def get_patient
    @patient = Patient.find(params[:patient_id])
  end

  def get_appointment
    @appointment = Appointment.find(params[:id])
  end
end
