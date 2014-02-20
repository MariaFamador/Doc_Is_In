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
    if @medicine.update
      redirect_to :edit, notice: "Changes saved."
    else
      redirect_to :edit, alert: "Error in changes"
    end
  end

  def edit
    @medicine = Medicine.find(params[:id])
  end

  def index
    @medicines = Medicine.all
  end

  def medicine_params
    params.require(:medicine).permit(
      :prescription_id,
      :dosage,
      :symptom_id,
      :symptom_name,
      :medicine_name
      )
  end
end
