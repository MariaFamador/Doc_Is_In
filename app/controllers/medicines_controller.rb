class MedicinesController < ApplicationController

  def new
    @medicine = Medicine.new
  end

  def create
    @medicine = Medicine.new(medicine_params)
    if @medicine.save
      redirect_to :new, notice: "Record saved."
    else
      render :new, alert: "Unable to save record."
    end
  end

  def update
    @medicine = Medicine.find(params[:id])
    if @medicine.update(medicine_params)
      redirect_to :edit, notice: "Changes saved."
    else
      redirect_to :edit, alert: "Error in changes"
    end
  end

  def edit
    @medicine = Medicine.find(params[:id])
    @symptoms = Symptom.all
  end

  def index
    @medicines = Medicine.all
    @symptoms = Symptom.all
    @medicine = Medicine.new
  end

  def search
    if params[:query].present?
      @medicines = Medicine.search(
        params[:query],
        partial: true,
        fields: [ { name: :word_start} ]
        )
    else
      @medicines = Medicine.order(:name)
    end
  end

  def medicine_params
    params.require(:medicine).permit(
      :prescription_id,
      :dosage,
      :medicine_name,
      symptom_ids: [],
      symptoms_attributes: [
        :symptom_name,
        medicine_ids: []
      ]
    )
  end
end
