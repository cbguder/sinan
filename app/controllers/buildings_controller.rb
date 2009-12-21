class BuildingsController < AuthenticatedController
  # GET /buildings
  # GET /buildings.xml
  def index
    @buildings = Building.all(:order => :name)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @buildings }
    end
  end

  # GET /buildings/1
  # GET /buildings/1.xml
  def show
    @building = Building.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @building }
    end
  end

  # GET /buildings/new
  # GET /buildings/new.xml
  def new
    @building = Building.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @building }
    end
  end

  # GET /buildings/1/edit
  def edit
    @building = Building.find(params[:id])
  end

  # POST /buildings
  # POST /buildings.xml
  def create
    @building = Building.new(params[:building])

    respond_to do |format|
      if @building.save
        flash[:notice] = 'Eser başarıyla yaratıldı.'
        format.html { redirect_to(@building) }
        format.xml  { render :xml => @building, :status => :created, :location => @building }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @building.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /buildings/1
  # PUT /buildings/1.xml
  def update
    @building = Building.find(params[:id])

    respond_to do |format|
      if @building.update_attributes(params[:building])
        flash[:notice] = 'Eser başarıyla güncellendi.'
        format.html { redirect_to(@building) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @building.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /buildings/1
  # DELETE /buildings/1.xml
  def destroy
    @building = Building.find(params[:id])
    @building.destroy

    respond_to do |format|
      format.html { redirect_to(buildings_url) }
      format.xml  { head :ok }
    end
  end

  # POST /buildings/search
  # POST /buildings/search.xml
  def search
    conditions = []
    variables = []
    @city = nil

    if params[:name] != nil and params[:name] != ""
      conditions.push("name LIKE ?")
      variables.push('%' + params[:name] + '%')
    end

    if params[:start].to_i != 0
      conditions.push("year >= ?")
      variables.push(params[:start])
    end

    if params[:end].to_i != 0
      conditions.push("year <= ?")
      variables.push(params[:end])
    end

    if params[:city].to_i != 0
      distance = params[:distance].to_f

      if distance == 0.0
        conditions.push("city_id = ?")
        variables.push(params[:city])
      else
        @city = City.find(params[:city])
        lats = [@city.find_destination(distance, 0)[0], @city.find_destination(distance, 180)[0]]
        lons = [@city.find_destination(distance, 90)[1], @city.find_destination(distance, 270)[1]]

        @min_lat = lats.min
        @max_lat = lats.max
        @min_lon = lons.min
        @max_lon = lons.max

        conditions.push("latitude >= ? AND latitude <= ? AND longitude >= ? AND longitude <= ?")
        variables.push(@min_lat, @max_lat, @min_lon, @max_lon)
      end
    end

    if conditions.empty?
      @buildings = []
    else
      q = [conditions.join(" AND ")] + variables
      @buildings = Building.find(:all, :conditions => q, :order => :name)
    end

    respond_to do |format|
      format.html # search.html.erb
      format.xml  { render :xml => @buildings }
    end
  end
end
