class V1::Examaobjectmodel
  include Mongoid::Document

  # Include modules for extensions.


  store_in collection: :'Examaobjectmodel'





  # Field definitions

  field :id, type: String

  field :creation_date, type: Date

  field :name, type: String


  # Relationship definitions




  # Simple validations

  validates_presence_of :id

  validates_presence_of :name


  # Default scopes for System Admin
  attr_accessible :creation_date, :name, as: :"System Admin"
  # Authorization for mass-assignment

  attr_accessible :id, :creation_date, :name, as: :"Unauthenticated Default on create"
  attr_accessible :id, :creation_date, :name, as: :"Unauthenticated Default on update"



  # Scopes for data access
  class << self
    def exact_match(attributes={}, user_attributes={}, offset = nil, limit = nil)
      scope = self.all

      attributes.each_pair do |name, value|
        scope = scope.where(name => value)
      end

      scope = scope.order_by("id ASC")

      scope = scope.offset(offset.to_i) if offset
      scope = scope.limit(limit.to_i) if limit

      scope
    end

    def count(attributes={}, user_attributes={}, offset = nil, limit = nil)
      scope = self.all

      attributes.each_pair do |name, value|
        scope = scope.where(name => value)
      end

      scope = scope.count

      scope
    end

    def count_exact_match(attributes={}, user_attributes={}, offset = nil, limit = nil)
      scope = self.all

      attributes.each_pair do |name, value|
        scope = scope.where(name => value)
      end

      scope = scope.count

      scope
    end
  end




  def serializable_hash(options={})
    super(options.merge(only: [:id, :creation_date, :name], methods: []))
  end

  # Add lifecycle hook methods to model lifecycle
  # model type: mongoid

  # Define lifecycle hook methods





  def self.backing_storage
    :mongoid
  end

  include V1::Custom::Examaobjectmodel
end
