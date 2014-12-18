require 'test_helper'

class V2::ExamaobjectmodelQueryScopeTest < ActiveSupport::TestCase

  def cleanup

    V2::Examaobjectmodel.destroy_all
  end

  setup do
    cleanup

    @examaobjectmodel_relationship_hash = {}
    @examaobjectmodel = V2::Examaobjectmodel.new({:creation_date=>"2014-12-18", :name=>"Imogene Robel"}, as: :"System Admin")

    @examaobjectmodel.save

    @examaobjectmodel = V2::Examaobjectmodel.new({:creation_date=>"2014-12-18", :name=>"Hugh Doyle"}, as: :"System Admin")

    @examaobjectmodel.save

    @examaobjectmodel = V2::Examaobjectmodel.new({:creation_date=>"2014-12-18", :name=>"Andres Lehner"}, as: :"System Admin")

    @examaobjectmodel.save




  end

  teardown do
    cleanup
  end



  test "validity of all" do
    value = V2::Examaobjectmodel.all

    assert_not_nil(value.count)

  end



  test "validity of exact_match" do
    value = V2::Examaobjectmodel.exact_match

    assert_not_nil(value.count)

  end



  test "validity of count" do
    value = V2::Examaobjectmodel.count

    assert_not_nil(value)

  end



  test "validity of count_exact_match" do
    value = V2::Examaobjectmodel.count_exact_match

    assert_not_nil(value)

  end


end
