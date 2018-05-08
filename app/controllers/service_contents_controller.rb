class ServiceContentsController < ApplicationController
  before_action :set_service_content, only: [:show, :edit, :update, :destroy]

  # GET /service_contents
  # GET /service_contents.json
  def index
    @service_contents = ServiceContent.all
  end

  # GET /service_contents/1
  # GET /service_contents/1.json
  def show
  end

  # GET /service_contents/new
  def new
    @service_content = ServiceContent.new
  end

  # GET /service_contents/1/edit
  def edit
  end

  # POST /service_contents
  # POST /service_contents.json
  def create
    @service_content = ServiceContent.new(service_content_params)

    respond_to do |format|
      if @service_content.save
        format.html { redirect_to @service_content, notice: 'Service content was successfully created.' }
        format.json { render :show, status: :created, location: @service_content }
      else
        format.html { render :new }
        format.json { render json: @service_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /service_contents/1
  # PATCH/PUT /service_contents/1.json
  def update
    respond_to do |format|
      if @service_content.update(service_content_params)
        format.html { redirect_to @service_content, notice: 'Service content was successfully updated.' }
        format.json { render :show, status: :ok, location: @service_content }
      else
        format.html { render :edit }
        format.json { render json: @service_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_contents/1
  # DELETE /service_contents/1.json
  def destroy
    @service_content.destroy
    respond_to do |format|
      format.html { redirect_to service_contents_url, notice: 'Service content was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_content
      @service_content = ServiceContent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_content_params
      params.require(:service_content).permit(:service_id, :text1, :text2, :text3)
    end
end
