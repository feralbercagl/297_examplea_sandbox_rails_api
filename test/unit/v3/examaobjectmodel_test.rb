require 'test_helper'

class V3::ExamaobjectmodelTest < ActiveSupport::TestCase

  def cleanup

    V3::Examaobjectmodel.destroy_all
  end

  setup do
    cleanup

    @examaobjectmodel_relationship_hash = {}
    @examaobjectmodel = V3::Examaobjectmodel.new({:creation_date=>"2014-12-19", :name=>"Izola Botsford"}, as: :"System Admin")

    @examaobjectmodel.save

    @examaobjectmodel = V3::Examaobjectmodel.new({:creation_date=>"2014-12-19", :name=>"Kyong Ziemann"}, as: :"System Admin")

    @examaobjectmodel.save

    @examaobjectmodel = V3::Examaobjectmodel.new({:creation_date=>"2014-12-19", :name=>"Gino Hahn"}, as: :"System Admin")

    @examaobjectmodel.save



  end

  teardown do
    cleanup
  end

  test "validity of create for V3::Examaobjectmodel" do
    # Instantiate and save the model.
    examaobjectmodel = V3::Examaobjectmodel.new( {:creation_date=>"2014-12-19", :name=>"Abdul Raynor"}, as: :"System Admin" )

    # Test fails if the model if 'true' was not returned.
    assert( examaobjectmodel.save )

    # check the see if the number of models has increased by 1.
    assert( V3::Examaobjectmodel.count == 4 )
  end

  test "validity of read for V3::Examaobjectmodel" do
    assert( V3::Examaobjectmodel.count == 3 )
  end

  test "validity of update for V3::Examaobjectmodel" do
    assert( V3::Examaobjectmodel.first.save )
  end

  test "validity of delete for V3::Examaobjectmodel" do
    examaobjectmodel = V3::Examaobjectmodel.first
    examaobjectmodel.destroy
    assert( V3::Examaobjectmodel.count == 2 )
  end
end
