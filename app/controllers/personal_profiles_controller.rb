class PersonalProfilesController < ApplicationController

  
  def edit
    if current_user.has_role? :student
      @student = Student.find(current_user.student)
    else
      @teacher = Teacher.find(current_user.teacher)
    end
  end

  def update
    if current_user.has_role? :student
      @student = Student.find(params[:id])
      respond_to do |format|
        if @student.update(student_params)
          format.html { redirect_to authenticated_root_path, notice: 'Profile was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    else
      @teacher = Teacher.find(params[:id])
      respond_to do |format|
        if @teacher.update(teacher_params)
          format.html { redirect_to authenticated_root_path, notice: 'Profile was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end
  end

  private
  def teacher_params
    params.require(:teacher).permit(:user_id, :username, :service_unit, :birth, :gender, :suject)
  end

  def student_params
    params.require(:student).permit(:user_id, :username, :birth, :school, :gender, :grade)
  end
end
