class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :permitted_parameters, if: :devise_controller?

def permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :father_name, :mother_name, :occupation, :father_occupation, :mother_occupation, :mobile_no, :bank_name, :aadhar_no, :pan, :document, :user_photo, local_address_attributes: [:house_no, :street_no, :area, :city, :state, :country, :pin, :address_proof], permanent_address_attributes: [:house_no, :street_no, :area, :city, :state, :country, :pin, :address_proof]])
  
end


end

