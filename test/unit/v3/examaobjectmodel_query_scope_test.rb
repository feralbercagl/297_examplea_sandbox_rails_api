require 'test_helper'

class V3::ExamaobjectmodelQueryScopeTest < ActiveSupport::TestCase

  def cleanup

    V3::Examaobjectmodel.destroy_all
  end

  setup do
    cleanup

    @examaobjectmodel_relationship_hash = {}
    @examaobjectmodel = V3::Examaobjectmodel.new({:creation_date=>"2014-12-19", :name=>"Dennis Hilll"}, as: :"System Admin")

    @examaobjectmodel.save

    @examaobjectmodel = V3::Examaobjectmodel.new({:creation_date=>"2014-12-19", :name=>"Florencio Stark"}, as: :"System Admin")

    @examaobjectmodel.save

    @examaobjectmodel = V3::Examaobjectmodel.new({:creation_date=>"2014-12-19", :name=>"Adelina Gerhold"}, as: :"System Admin")

    @examaobjectmodel.save




  end

  teardown do
    cleanup
  end



  test "validity of all" do
    value = V3::Examaobjectmodel.all

    assert_not_nil(value.count)

  end



  test "validity of exact_match" do
    value = V3::Examaobjectmodel.exact_match

    assert_not_nil(value.count)

  end



  test "validity of count" do
    value = V3::Examaobjectmodel.count

    assert_not_nil(value)

  end



  test "validity of count_exact_match" do
    value = V3::Examaobjectmodel.count_exact_match

    assert_not_nil(value)

  end


end
