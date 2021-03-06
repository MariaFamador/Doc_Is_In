class MedicinesController < ApplicationController

  def new
    @medicine = Medicine.new
  end

  def destroy
    @medicines = Medicine.order(:name)
    @medicine = Medicine.find(params[:id])
    respond_to do |format|
      if @medicine.destroy
        format.html { redirect_to medicines_path, notice: "Medicine deleted." }
        format.js
      end
    end
  end

  def create
    @medicines = Medicine.order(:name)
    @medicine = Medicine.new(medicine_params)
    respond_to do |format|
      if @medicine.save
        format.html { redirect_to medicines_path, notice: "Record saved." }
        format.js { @status = "success" }
      else
        format.html { render :new }
        format.js { render :new }
      end
    end
  end

  def update
    @medicine = Medicine.find(params[:id])
    @medicines = Medicine.all
    respond_to do |format|
      if @medicine.update(medicine_params)
        format.html { redirect_to medicines_path, notice: "Changes saved." }
        format.js { @status = "success" } 
      else
        format.html { render :edit }
        format.js
      end
    end
  end

  def edit
    @medicine = Medicine.find(params[:id])
    @symptoms = Symptom.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  def cabinet
    @medicines = Medicine.order(:name)
    @symptoms = Symptom.all
    @medicine = Medicine.new
  end

  def index
    @medicines = Medicine.order(:name)
    @symptoms = Symptom.all
    @medicine = Medicine.new
    respond_to do |format|
      format.html
      format.js
    end
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
      :name,
      :form,
      symptom_ids: [],
      symptoms_attributes: [
        :name,
        medicine_ids: []
      ]
    )
  end
end
