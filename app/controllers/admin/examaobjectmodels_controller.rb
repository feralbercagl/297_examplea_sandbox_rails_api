class Admin::ExamaobjectmodelsController < AdminController

  # Pagination support

  PER_PAGE = 10

  def page_count
    (total_object_count.to_f / PER_PAGE).ceil
  end

  def total_object_count

    V1::Examaobjectmodel.count()

  end

  def available_pages
    (1..page_count).to_a
  end

  helper_method :available_pages

  # GET /examaobjectmodels
  # GET /examaobjectmodels.json
  def index


    page = 0
    page_number = params[:page].nil? ? 1 : params[:page].to_i

    if available_pages.include?(page_number)
      page = page_number - 1
    end


    @examaobjectmodels = V1::Examaobjectmodel.order_by([:id,:asc]).skip(page * PER_PAGE).limit(PER_PAGE)



    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @examaobjectmodels }
    end
  end

  # GET /examaobjectmodels/1
  # GET /examaobjectmodels/1.json
  def show

    @examaobjectmodel = V1::Examaobjectmodel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @examaobjectmodel }
    end
  end

  # GET /examaobjectmodels/new
  # GET /examaobjectmodels/new.json
  def new
    @examaobjectmodel = V1::Examaobjectmodel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @examaobjectmodel }
    end
  end

  # GET /examaobjectmodels/1/edit
  def edit

    @examaobjectmodel = V1::Examaobjectmodel.find(params[:id])

  end

  # POST /examaobjectmodels
  # POST /examaobjectmodels.json
  def create
    @examaobjectmodel = V1::Examaobjectmodel.new(params[:examaobjectmodel], as: :"System Admin")
    respond_to do |format|
      if @examaobjectmodel.save
        format.html { redirect_to admin_examaobjectmodel_url(@examaobjectmodel), notice: 'examaobjectmodel was successfully created.' }
        format.json { render json: @examaobjectmodel, status: :created, location: admin_examaobjectmodel_url(@examaobjectmodel) }
      else
        format.html { render action: "new" }
        format.json { render json: @examaobjectmodel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /examaobjectmodels/1
  # PUT /examaobjectmodels/1.json
  def update

    @examaobjectmodel = V1::Examaobjectmodel.find(params[:id])
    updated = @examaobjectmodel.update_attributes(params[:examaobjectmodel], as: :"System Admin")

    respond_to do |format|
      if updated
        format.html { redirect_to admin_examaobjectmodel_url(@examaobjectmodel), notice: 'examaobjectmodel was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @examaobjectmodel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /examaobjectmodels/1
  # DELETE /examaobjectmodels/1.json
  def destroy

    @examaobjectmodel = V1::Examaobjectmodel.find(params[:id])

    @examaobjectmodel.destroy

    respond_to do |format|

      format.html { redirect_to admin_examaobjectmodels_url }

      format.json { head :no_content }
    end
  end
end
