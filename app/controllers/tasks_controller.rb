class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.json
  
  def index
    #@tasks = Task.all
    @tasks = Task.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new

    #@project = project
    #@myid = id
    #@task = Project.tasks.find(params[:id])
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    
     @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create   
   
    @project = Project.find(params[:project_id])
    @task = @project.tasks.create(params[:task])
    redirect_to project_path(@project)

    # respond_to do |format|
    #   if @task.save
    #     #puts @myid
    #     #@task.update_attributes(:project_id => @myid)
    #     format.html { redirect_to project_tasks_path, notice:  'Task was successfully created.' }
    #     format.json { render json: @task, status: :created, location: @task }
    #   else
    #     format.html { render action: "new" }
    #     format.json { render json: @task.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
   def destroy
    @project = Project.find(params[:task_id])
    @task = @project.tasks.find(params[:id])
    @task.destroy
    redirect_to project_path(@project)
  end
end
