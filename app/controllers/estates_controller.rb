class EstatesController < ApplicationController
  before_action :set_estate, only: [:show, :edit, :update, :destroy,]
  before_filter :authenticate_user!, :only => [:index, :new, :home]
  # GET /estates
  # GET /estates.json
  def index
    @page = 'index_page'
    @estates = Estate.all
    @back_url = session[:my_previous_url]
  end

  # GET /estates/1
  # GET /estates/1.json
  def welcome
      @page = 'welcome_page'
      @rem_ip = remote_ipp
      puts @rem_ip
      puts @location = Geocoder.search("#{@rem_ip}")
      if @location[0].present? && @location[0].latitude.present?
        mr = 20 ;
        radius = mr*1000;
        @estates =  Estate.within_radius(@location[0].latitude,@location[0].longitude, radius)

      else
        @estates = Estate.all  
      end

     @estates.each do |st| 
      puts st.address
     end 


      @res = '';
      @back_url = session[:my_previous_url]

  end
 

  def search
  puts params
  @page = params[:req_page]
    if params[:address].present?
  puts    @ptype = params[:select]
      results = Geocoder.search(params[:address])
      if results[0].present?
        puts @res_address = results[0].formatted_address;
        @plat = params[:p_lat];
        @plng = params[:p_lng]; 
#        params[:welcome][:address]
        mr = 10 ;
        radius = mr*1000;
        @estates =  Estate.within_radius(@plat, @plng, radius).where(ptype:@ptype) unless @ptype == 'all_prop'
        @estates =  Estate.within_radius(@plat, @plng, radius) if @ptype == 'all_prop'
        
        if @estates.size > 1
          puts @res = "#{@estates.size} results found in #{@res_address} "
        else
          puts @res = "#{@estates.size} result found in #{params[:address]} "
        end
      else
        @estates = Estate.all  
      end
## test
     @estates.each do |st| 
      puts st.address
     end 
## test_end
#       @estates = Estate.take(2)

    else
        @estates = Estate.all
        @res ="please select valid city"
    end

    puts params[:req_page]+'request page .......'
  if params[:req_page] == 'index_page'
      render 'index'
  
  else
    render 'welcome'
  end

  end




  def show
  
    @pictures = @estate.pictures.all
    @back_url = session[:my_previous_url]
  end


  def home
    @estates = current_user.estates
    @back_url = session[:my_previous_url]
  end

  # GET /estates/new
  def new
    @estate = current_user.estates.build
    @picture = @estate.pictures.build
    @rem_ip = remote_ipp
    puts @location = Geocoder.search("#{@rem_ip}")
puts    @c_lat = @location[0].latitude if @location[0].present?
puts    @c_lng = @location[0].longitude if @location[0].present?
    @back_url = session[:my_previous_url]
  end

  # GET /estates/1/edit
  def edit
    @type = @estate.ptype
    @back_url = session[:my_previous_url]
  end

  # POST /estates
  # POST /estates.json
  def create
    @back_url = session[:my_previous_url]
    @estate = current_user.estates.new(estate_params)
        respond_to do |format|
      if @estate.save
         params[:pictures]['avatar'].each do |a|
          @picture = @estate.pictures.create!(:avatar => a)
       end
        format.html { redirect_to estate_path(@estate), 'data-no-turbolink' => true , notice: 'your property was successfully posted.' }
        format.json { render :show, status: :created, location: @estate }
      else
        format.html { render :new }
        format.json { render json: @estate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estates/1
  # PATCH/PUT /estates/1.json
  def update
    @back_url = session[:my_previous_url]
    respond_to do |format|
      if @estate.update(estate_params)
        if @estate.pictures.present?
      @estate.pictures.each do |pic|
        pic.destroy
      end
    end

        params[:pictures]['avatar'].each do |a|
          @picture = @estate.pictures.create(:avatar => a)
          
       end
        format.html { redirect_to @estate, notice: 'property detail updated.' }
        format.json { render :show, status: :ok, location: @estate }
      else
        format.html { render :edit }
        format.json { render json: @estate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estates/1
  # DELETE /estates/1.json
  def destroy
    @back_url = session[:my_previous_url]
    @estate.destroy
    respond_to do |format|
      format.html { redirect_to action: 'index', notice: 'Estate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end




  def remote_ipp
    if request.remote_ip.nil? || request.remote_ip == '127.0.0.1'
     '103.9.12.150'
    else
     request.remote_ip
    end
  end
 
  
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estate
      @estate = Estate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estate_params
      params.require(:estate).permit(:ptype, :stype, :levels, :area, :bedroom, :hall, :bathroom, :built, :feature, :price, :user_id, :address, :latitude, :longitude, :avatar)
    end

end