# @patients = Patient.where("first_name LIKE ? AND last_name LIKE ?", 
    #                           "#{params[:first_name]}%",
    #                           "#{params[:last_name]}%")
    # @patients = params[:dob].blank? ? @patients : @patients.where(dob: params[:dob]) #alternative code if not using elasticsearch