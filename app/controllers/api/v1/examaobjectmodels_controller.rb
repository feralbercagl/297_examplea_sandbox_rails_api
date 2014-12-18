class Api::V1::ExamaobjectmodelsController < Api::ApiController
  resource_description do
    name 'V1::Examaobjectmodels'
    short 'V1::Examaobjectmodels'
    path '/v1/examaobjectmodels.json'
    version '1'
    formats ['json']
    param :id, String, :desc => "V1::Examaobjectmodel ID", :required => false
    param :examaobjectmodel, Hash, :desc => "V1::Examaobjectmodel parameters for all methods" do

      param :id, String, :required => true,
      :desc => "id"

      param :creation_date, Date, :required => false,
      :desc => "creation_date"

      param :name, String, :required => true,
      :desc => "name"

    end
    description <<-DOC
    V1::Examaobjectmodels
    DOC
  end
  respond_to :json

  protect_from_forgery :except => [:create, :update, :destroy]

  # GET /examaobjectmodels.json
  api :GET, "/v1/examaobjectmodels.json", "Show all examaobjectmodels based on a query scope"
  def index
    scope = params[:scope] || 'all'
    reject_as_unauthorized and return if requires_authentication? and !authenticated?
    reject_as_forbidden and return unless authorized_for_scope?(scope)
    @examaobjectmodels = scope_named(scope)
    respond_with @examaobjectmodels
  end

  # GET /examaobjectmodels/1.json
  api :GET, "/v1/examaobjectmodels/:id.json", "Show examaobjectmodel"
  def show
    reject_as_unauthorized and return if requires_authentication? and !authenticated?
    reject_as_forbidden and return unless can_read?

    @examaobjectmodel = scope_for_read_finder.find(params[:id])

    respond_with @examaobjectmodel
  end

  # GET /examaobjectmodels/new.json
  api :GET, "/v1/examaobjectmodels/new.json", "Instantiate a new examaobjectmodel"
  def new
    @examaobjectmodel = V1::Examaobjectmodel.new
    respond_with @examaobjectmodel
  end

  # POST /examaobjectmodels.json
  api :POST, "/v1/examaobjectmodels.json", "Create a new examaobjectmodel"
  def create
    reject_as_unauthorized and return if requires_authentication? and !authenticated?
    reject_as_forbidden and return unless can_create?
    @examaobjectmodel = scope_for_create_finder.new(params[:examaobjectmodel], as: :"#{current_user_role} on create")
    @examaobjectmodel.save
    respond_with @examaobjectmodel
  end

  # PUT /examaobjectmodels/1.json
  api :PUT, "/v1/examaobjectmodels/:id.json", "Update an existing examaobjectmodel"
  def update
    reject_as_unauthorized and return if requires_authentication? and !authenticated?
    reject_as_forbidden and return unless can_update?

    @examaobjectmodel = scope_for_update_finder.find(params[:id])
    @examaobjectmodel.update_attributes(params[:examaobjectmodel], as: :"#{current_user_role} on update")

    respond_with @examaobjectmodel
  end

  # DELETE /examaobjectmodels/1.json
  api :DELETE, "/v1/examaobjectmodels/:id.json", "Delete an existing examaobjectmodel"
  def destroy
    reject_as_unauthorized and return if requires_authentication? and !authenticated?
    reject_as_forbidden and return unless can_delete?

    @examaobjectmodel = scope_for_delete_finder.find(params[:id])

    @examaobjectmodel.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end

  protected
  def scope_named(name)
    scope = 'all' unless ::V1::Examaobjectmodel.respond_to?(name)
    if name == 'all'

      scope = ::V1::Examaobjectmodel.all
      scope = scope.skip(params[:offset].to_i) if params[:offset]
      scope = scope.limit(params[:limit].to_i) if params[:limit]

    elsif name == 'count'
      scope = ::V1::Examaobjectmodel.count
    else
      query_params = params[:query].is_a?(String) ? ( JSON.parse(params[:query]) rescue nil ) : params[:query]
      scope = ::V1::Examaobjectmodel.send(name, (query_params || {}), {}, params[:offset], params[:limit])
    end
    scope
  end

  # Overriding respond_with to perform field level authorization for reading fields.
  def respond_with(*resources, &block)
    replacement = nil
    resources.each do |resource|
      if resource.respond_to?(:each)
        replacement = []
        resource.each do |instance|
          replacement << scrubbed_instance(instance)
        end
      elsif resource.respond_to?(:attributes)
        replacement = scrubbed_instance(resource)
      else
        replacement = resource
      end
    end

    super(replacement, :location => nil)
  end

  def scrubbed_instance(instance)
    instance.attributes.select{|attribute| ['id', 'creation_date', 'name'].include?(attribute) }.each do |attribute, value|
      instance.send("#{attribute}=", nil) unless authorized_to_read_field?(attribute)
    end
    instance
  end

  def requires_authentication?
    false
  end

  def authenticated?
    requires_authentication? ? current_user_role != "Unauthenticated Default": true
  end


  def can_read?

    case current_user_role

    when "Unauthenticated Default"
      true

    else
      false
    end

  end

  def scope_for_read_finder

    case current_user_role

    when "Unauthenticated Default"

      ::V1::Examaobjectmodel


    else
      ::V1::Examaobjectmodel
    end

  end

  def can_create?

    case current_user_role

    when "Unauthenticated Default"
      true

    else
      false
    end

  end

  def scope_for_create_finder

    case current_user_role

    when "Unauthenticated Default"

      ::V1::Examaobjectmodel


    else
      ::V1::Examaobjectmodel
    end

  end

  def can_update?

    case current_user_role

    when "Unauthenticated Default"
      true

    else
      false
    end

  end

  def scope_for_update_finder

    case current_user_role

    when "Unauthenticated Default"

      ::V1::Examaobjectmodel


    else
      ::V1::Examaobjectmodel
    end

  end

  def can_delete?

    case current_user_role

    when "Unauthenticated Default"
      true

    else
      false
    end

  end

  def scope_for_delete_finder

    case current_user_role

    when "Unauthenticated Default"

      ::V1::Examaobjectmodel


    else
      ::V1::Examaobjectmodel
    end

  end


  def authorized_for_scope?(scope_name)

    case current_user_role

    when "Unauthenticated Default"
      ["all", "exact_match", "count", "count_exact_match"].include?(scope_name)

    else
      false
    end

  end

  def authorized_to_read_field?(field_name)

    case current_user_role

    when "Unauthenticated Default"
      ["id", "creation_date", "name"].include?(field_name.to_s)

    else
      false
    end

  end

  include Api::V1::Custom::ExamaobjectmodelsController
end
