class PatientsController < ApplicationController
  before_action :get_patient, except: [:new, :create, :index, :search]

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
    @medical_history = @patient.medical_history || @patient.build_medical_history
    @allergies = MedicalHistory::ALLERGIES
    @previous_diseases = MedicalHistory::PREVIOUS_DISEASES
    @medication_and_supplements = @medical_history.medication_and_supplements
    @surgery_and_hospitalization = @medical_history.surgery_and_hospitalization
    @family_history = @medical_history.family_history
    @appointments = @patient.appointments.order(:starts_at)
  end

  def index
    @patients = current_user.patients.order(:last_name, :first_name)
  end

  def edit
    @patient = Patient.find(params[:id])
    respond_to do |format|
      format.js
      format.html
    end
  end

  def update
    if @patient.update(patient_params)
      redirect_to patient_path(@patient, get_tab), notice: "Changes saved."
        format.html { redirect_to patient_path(@patient, get_tab), notice: "Changes saved." }
        format.js { @status = "success"}
    else
      render :show
    end
  end

  def destroy
    @patient.destroy
    redirect_to patients_path, notice: "Record deleted."
  end

  def search
    if params[:query].present?
      @patients = Patient.search(
        params[:query], 
        where: { user_id: current_user.id }, 
        partial: true,
        fields: [{first_name: :word_start}, {middle_name: :word_start}, {last_name: :word_start}]
      )
    else
      @patients = current_user.patients.order(:last_name, :first_name)
    end
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
      :user_id,
      medical_history_attributes: [
        :patient_id,
        :id,
        :medication_and_supplements,
        :surgery_and_hospitalization,
        :family_history,
        allergies: [],
        previous_diseases: []
      ],
      appointments_attributes: [
        :notes,
        :id
      ]
    )
  end

  def get_patient
    @patient = Patient.find(params[:id])
  end
end
