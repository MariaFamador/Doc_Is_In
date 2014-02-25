class PrescriptionsController < ApplicationController
  before_action :get_patient, only: [:new, :show, :create] 
  before_action :get_prescription, only: [:show, :destroy, :show]

  def new
    @prescription = @patient.prescriptions.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @prescription = @patient.prescriptions.new(prescription_params)
    respond_to do |format|
      if @prescription.save
        format.html { redirect_to patient_path(@patient, get_tab), notice: "Prescription saved." }
        format.js { @status = "success" }
      else
        format.html { render :new }
      end
    end
  end

  def show
    @prescription = Prescription.find(params[:id])
    @medicines = @prescription.medicines
    @symptoms = @prescription.symptoms

    respond_to do |format|
      format.js
    end
  end

  def destroy
    @patient = @prescription.patient
    respond_to do |format|
      if @prescription.destroy
        format.js { @status == "success" }
      end
    end
  end

  private

  def prescription_params
    params.require(:prescription).permit(
      :diagnosis,
      :patient_id,
      :user_id,
      :patient_name,
      :doctor_name,
      medicine_ids: [],
      symptom_ids: []
    )
  end

  def get_patient
    @patient = Patient.find(params[:patient_id])
  end

  def get_prescription
    @prescription = Prescription.find(params[:id])
  end
end
