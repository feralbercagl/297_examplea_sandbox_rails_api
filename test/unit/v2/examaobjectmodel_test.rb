require 'test_helper'

class V2::ExamaobjectmodelTest < ActiveSupport::TestCase

  def cleanup

    V2::Examaobjectmodel.destroy_all
  end

  setup do
    cleanup

    @examaobjectmodel_relationship_hash = {}
    @examaobjectmodel = V2::Examaobjectmodel.new({:creation_date=>"2014-12-18", :name=>"Bea Daugherty"}, as: :"System Admin")

    @examaobjectmodel.save

    @examaobjectmodel = V2::Examaobjectmodel.new({:creation_date=>"2014-12-18", :name=>"Maricela Upton"}, as: :"System Admin")

    @examaobjectmodel.save

    @examaobjectmodel = V2::Examaobjectmodel.new({:creation_date=>"2014-12-18", :name=>"Les Weber"}, as: :"System Admin")

    @examaobjectmodel.save



  end

  teardown do
    cleanup
  end

  test "validity of create for V2::Examaobjectmodel" do
    # Instantiate and save the model.
    examaobjectmodel = V2::Examaobjectmodel.new( {:creation_date=>"2014-12-18", :name=>"Mariah Prohaska"}, as: :"System Admin" )

    # Test fails if the model if 'true' was not returned.
    assert( examaobjectmodel.save )

    # check the see if the number of models has increased by 1.
    assert( V2::Examaobjectmodel.count == 4 )
  end

  test "validity of read for V2::Examaobjectmodel" do
    assert( V2::Examaobjectmodel.count == 3 )
  end

  test "validity of update for V2::Examaobjectmodel" do
    assert( V2::Examaobjectmodel.first.save )
  end

  test "validity of delete for V2::Examaobjectmodel" do
    examaobjectmodel = V2::Examaobjectmodel.first
    examaobjectmodel.destroy
    assert( V2::Examaobjectmodel.count == 2 )
  end
end
