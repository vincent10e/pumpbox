class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    if current_user.has_role? :student
      @group = Group.find(params[:id])
      @courses = @group.courses.order(:title).page params[:page]
      @students = @group.students
    end

    if current_user.has_role? :teacher
      @teacher = Teacher.find(params[:teacher_id])
      @group = @teacher.groups.find(params[:id])
      @courses = @group.courses.order(:title).page params[:page]
      @students = @group.students
    end
  end

  # GET /groups/new
  def new
    @teacher = Teacher.find(params[:teacher_id])
    @group = @teacher.groups.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @teacher = Teacher.find(params[:teacher_id])
    @group = @teacher.groups.new(group_params)

    @group.group_code = SecureRandom.hex(2)
    respond_to do |format|
      if @group.save
        format.html { redirect_to teacher_group_path(@teacher, @group), notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_student
    @group = Group.where(group_code: params[:group_id])
    binding.pry
    if @group.count != 0
      @student_group = @group.first.student_groupships.create
      @student_group.student = current_user.student
      @student_group.save
      redirect_to root_path

    else
      redirect_to root_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      # @group = Group.find(params[:id])
      # @courses = @group.courses
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:teacher_id, :name, :group_code)
    end
end
