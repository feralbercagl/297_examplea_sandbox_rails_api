require 'test_helper'

class V1::ExamaobjectmodelTest < ActiveSupport::TestCase

  def cleanup

    V1::Examaobjectmodel.destroy_all
  end

  setup do
    cleanup

    @examaobjectmodel_relationship_hash = {}
    @examaobjectmodel = V1::Examaobjectmodel.new({:creation_date=>"2014-12-18", :name=>"Inger Hirthe"}, as: :"System Admin")

    @examaobjectmodel.save

    @examaobjectmodel = V1::Examaobjectmodel.new({:creation_date=>"2014-12-18", :name=>"Donnell Gerlach"}, as: :"System Admin")

    @examaobjectmodel.save

    @examaobjectmodel = V1::Examaobjectmodel.new({:creation_date=>"2014-12-18", :name=>"Rufus Luettgen"}, as: :"System Admin")

    @examaobjectmodel.save



  end

  teardown do
    cleanup
  end

  test "validity of create for V1::Examaobjectmodel" do
    # Instantiate and save the model.
    examaobjectmodel = V1::Examaobjectmodel.new( {:creation_date=>"2014-12-18", :name=>"Tanja Schmidt"}, as: :"System Admin" )

    # Test fails if the model if 'true' was not returned.
    assert( examaobjectmodel.save )

    # check the see if the number of models has increased by 1.
    assert( V1::Examaobjectmodel.count == 4 )
  end

  test "validity of read for V1::Examaobjectmodel" do
    assert( V1::Examaobjectmodel.count == 3 )
  end

  test "validity of update for V1::Examaobjectmodel" do
    assert( V1::Examaobjectmodel.first.save )
  end

  test "validity of delete for V1::Examaobjectmodel" do
    examaobjectmodel = V1::Examaobjectmodel.first
    examaobjectmodel.destroy
    assert( V1::Examaobjectmodel.count == 2 )
  end
end
