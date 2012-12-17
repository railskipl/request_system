class RequestsController < ApplicationController
     before_filter :authenticate_user!

  # GET /requests
  # GET /requests.json
  def index
    if current_user.has_role? :admin
    @requests =  Request.find(:all)
    else
    @requests =  current_user.requests.find(:all)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @requests }
    end
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
    @request = Request.find(params[:id])
    if current_user.has_role? :admin 
    @request.update_column(:status , "pending")
    end
    if (@request.user.id == current_user.id)  || (current_user.has_role? :admin)
      respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @request }
      end
    else
      redirect_to "/"
     
    end
  end

  # GET /requests/new
  # GET /requests/new.json
  def new
    @request = Request.new
     1.times do
      request_photo = @request.request_photos.build
    end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @request }
    end
  end

  # GET /requests/1/edit
  def edit
    @request = Request.find(params[:id])
    if current_user.has_role? :admin 
    else
      redirect_to "/"
    end
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(params[:request])

    respond_to do |format|
      if @request.save
        format.html { redirect_to  user_requests_path, notice: 'Request was successfully created.' }
        format.json { render json: @request, status: :created, location: @request }
      else
        format.html { render action: "new" }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /requests/1
  # PUT /requests/1.json
  def update
    @request = Request.find(params[:id])

    respond_to do |format|
     if current_user.has_role? :admin   
          if @request.update_attributes(params[:request])
            format.html { redirect_to request_info_user_requests_path(current_user.id), notice: 'Request was successfully updated.' }
            format.json { head :no_content }
          else
            format.html { render action: "edit" }
            format.json { render json: @request.errors, status: :unprocessable_entity }
          end
     else
         if @request.update_attributes(params[:request])
            format.html { redirect_to user_requests_path(current_user.id), notice: 'Request was successfully updated.' }
            format.json { head :no_content }
          else
            format.html { render action: "edit" }
            format.json { render json: @request.errors, status: :unprocessable_entity }
          end
    end
  end
 end
  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request = Request.find(params[:id])
    @request.destroy

    respond_to do |format|
      format.html { redirect_to requests_url }
      format.json { head :no_content }
    end
  end
  
  #method for displaying request to admin
  def request_info
    @requests =  Request.find(:all)
  end
  
end
