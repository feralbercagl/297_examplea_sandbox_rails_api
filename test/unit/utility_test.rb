require 'test_helper'
require Rails.root.join("lib", "utility.rb")

class UtilityTest < ActiveSupport::TestCase
  test "build nested hash for relations" do
    obj = Object.new
    obj.extend(Utility)
    
    car = Car.new
    car.engine = Engine.new
    car.engine.name = "great engine"
    
    p = Piston.new
    p.name = "piston0"
    car.engine.pistons << p
    
    p = Piston.new
    p.name = "piston1"
    car.engine.pistons << p
    
    t = Tire.new
    t.name = "tire0"
    car.tires << t
    t = Tire.new
    t.name = "tire1"
    car.tires << t
    
    res = Utility.build_serializable_hash_options("engine.name")
    hash = car.serializable_hash(res)
    assert_equal("great engine", hash["engine"]["name"])

    res = Utility.build_serializable_hash_options("engine")
    assert_equal(res, {})

    res = Utility.build_serializable_hash_options("tires.name")
    hash = car.serializable_hash(res)
    assert_equal(["tire0", "tire1"], hash["tires"].map { |m| m['name'] })
    
    res = Utility.build_serializable_hash_options("engine.pistons.name")
    hash = car.serializable_hash(res)
    assert_equal(["piston0", "piston1"], hash["engine"]["pistons"].map { |m| m['name']})
  end
  
  class Car
    include Mongoid::Document
    has_one :engine
    has_many :tires
  end
  
  class Engine
    include Mongoid::Document
    belongs_to :car
    has_many :pistons
    
    field :name, type: String
  end
  
  class Piston
    include Mongoid::Document
    belongs_to :engine
    
    field :name, type: String
  end
  
  class Tire
    include Mongoid::Document
    belongs_to :car
    
    field :name, type: String
  end
  
end



