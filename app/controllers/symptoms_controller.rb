class SymptomsController < ApplicationController
  def new
    @symptom = Symptom.new
  end

  def create
    @symptom = Symptom.new(symptom_params)
    if @symptom.save
      redirect_to :new, notice: "Record saved."
    else
      render :new, alert: "Unable to save record."
    end
  end

  def update
    @symptom = Symptom.find(params[:id])
    if @symptom.update
      redirect_to :edit, notice: "Changes saved."
    else
      redirect_to :edit, alert: "Error in changes"
    end
  end

  def edit
    @symptom = Symptom.find(params[:id])
  end

  def index
    @symptoms = Symptom.all
  end

  def symptom_params
    params.require(:symptom).permit(
      :prescription_id,
      :dosage,
      :name,
      medicine_ids: []
      )
  end
end
