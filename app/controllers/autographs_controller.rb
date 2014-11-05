class AutographsController < ApplicationController
  before_action :set_autograph, only: [:show, :edit, :update, :destroy, :image]

  include Kinukake
  
  # GET /autographs
  # GET /autographs.json
  def index
    @autographs = Autograph.all
  end

  # GET /autographs/1
  # GET /autographs/1.json
  def show
  end

  # GET /autographs/new
  def new
    @autograph = Autograph.new
  end

  # GET /autographs/1/edit
  def edit
  end

  # POST /autographs
  # POST /autographs.json
  def create
    @autograph = Autograph.new()
    @autograph.name = params[:autograph][:name]
    @autograph.image = Base64.decode64(params[:sign].sub('data:image/png;base64,', ''))

    respond_to do |format|
      if @autograph.save
        format.html { redirect_to @autograph, notice: 'Autograph was successfully created.' }
        format.json { render action: 'show', status: :created, location: @autograph }
      else
        format.html { render action: 'new' }
        format.json { render json: @autograph.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /autographs/1
  # PATCH/PUT /autographs/1.json
  def update
    respond_to do |format|
    @autograph.image = Base64.decode64(params[:sign].sub('data:image/png;base64,', ''))
      if @autograph.update(autograph_params)
        format.html { redirect_to @autograph, notice: 'Autograph was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @autograph.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /autographs/1
  # DELETE /autographs/1.json
  def destroy
    @autograph.destroy
    respond_to do |format|
      format.html { redirect_to autographs_url }
      format.json { head :no_content }
    end
  end

  # IMAGE /autographs/1/image
  def image
    send_data(@autograph.image, type: 'image/png, disposition: :inline')
  end

  def index_by_shell
    
    # require "open3"

    command = 'SHELL/MAKE_LIST'
        
    @data_by_shell = run(command).html_safe
    # send_data res, :type => :text, :disposition => 'inline'
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_autograph
      @autograph = Autograph.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def autograph_params
      params.require(:autograph).permit(:name, :sign)
    end
end
