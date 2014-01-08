class PatientsController < ApplicationController
  before_action :get_patient, except: [:new, :create, :index]


  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to patient_path(@patient.id), notice: "Record saved."
    else
      redirect_to new_patient_path, alert: "Record not created."
    end
  end

  def show
  end

  def index
    @patients = current_user.patients
  end

  def edit  
  end

  def update
    if @patient.update(patient_params)
      redirect_to patient_path(@patient.id), notice: "Changes saved."
    else
      redirect_to patient_path(@patient.id), alert: "Error in changes."
    end
  end

  def destroy
    @patient.destroy
    redirect_to patients_path
  end


  protected

  def patient_params
    params.require(:patient).permit(
      :first_name,
      :middle_name, 
      :last_name, 
      :gender,
      :dob, 
      :age,
      :address,
      :phone_number, 
      :doctor,
      :user_id)
  end

  def get_patient
    @patient = Patient.find(params[:id])
  end
end
