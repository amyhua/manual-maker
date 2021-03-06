class ManualsController < ApplicationController
  # GET /manuals
  # GET /manuals.json
  def index
    @manuals = Manual.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @manuals }
    end
  end

  # GET /manuals/1
  # GET /manuals/1.json
  def show
    @manual = Manual.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @manual }
    end
  end

  # GET /manuals/new
  # GET /manuals/new.json
  def new
    @manual = Manual.new
    3.times do
      section = @manual.sections.build
      2.times do
        section.steps.build
      end
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @manual }
    end
  end

  # GET /manuals/1/edit
  def edit
    @manual = Manual.find(params[:id])
  end

  # POST /manuals
  # POST /manuals.json
  def create
    @manual = Manual.new(params[:manual])
    if @manual.save
      flash[:notice] = "Your manual has been created."
      redirect_to @manual
    else
      flash[:alert] = 'Your manual has not been created.'
      render :action => "new"        
    end
  end

  # PUT /manuals/1
  # PUT /manuals/1.json
  def update
    @manual = Manual.find(params[:id])

    respond_to do |format|
      if @manual.update_attributes(params[:manual])
        format.html { redirect_to @manual, notice: 'Manual was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @manual.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manuals/1
  # DELETE /manuals/1.json
  def destroy
    @manual = Manual.find(params[:id])
    @manual.destroy

    respond_to do |format|
      format.html { redirect_to manuals_url }
      format.json { head :no_content }
    end
  end
end
