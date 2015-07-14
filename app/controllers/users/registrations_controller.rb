class Users::RegistrationsController < Devise::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    super
    if params[:from] == "student"
      @user.save!
      @user.add_role :student
      @student = @user.build_student(:username => params[:username], 
                             :school => params[:school],
                             :city => TaiwanCity.get(params[:city]),
                             :district => TaiwanCity.get(params[:district]))
      @student.save!
    else  #teacher
      @user.save!
      @user.add_role :teacher
      @teacher = @user.build_teacher(:username => params[:username], 
                            :service_unit => params[:service_unit])
      @teacher.save!
    end

  end

  # GET /resource/edit
  def edit
    super
    @user = current_user
  end

  # PUT /resource
  def update
    super

    @user = current_user
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  def student_new
    build_resource()
  end

  def teacher_new
    build_resource()
  end

  def student_edit

  end

  def teacher_edit
    
  end

  # protected

  # You can put the params you want to permit in the empty array.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

  # You can put the params you want to permit in the empty array.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    super(resource)
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
