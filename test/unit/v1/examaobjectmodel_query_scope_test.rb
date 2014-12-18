require 'test_helper'

class V1::ExamaobjectmodelQueryScopeTest < ActiveSupport::TestCase

  def cleanup

    V1::Examaobjectmodel.destroy_all
  end

  setup do
    cleanup

    @examaobjectmodel_relationship_hash = {}
    @examaobjectmodel = V1::Examaobjectmodel.new({:creation_date=>"2014-12-18", :name=>"Nidia Mosciski"}, as: :"System Admin")

    @examaobjectmodel.save

    @examaobjectmodel = V1::Examaobjectmodel.new({:creation_date=>"2014-12-18", :name=>"Loree Berge"}, as: :"System Admin")

    @examaobjectmodel.save

    @examaobjectmodel = V1::Examaobjectmodel.new({:creation_date=>"2014-12-18", :name=>"Debbie McLaughlin"}, as: :"System Admin")

    @examaobjectmodel.save




  end

  teardown do
    cleanup
  end



  test "validity of all" do
    value = V1::Examaobjectmodel.all

    assert_not_nil(value.count)

  end



  test "validity of exact_match" do
    value = V1::Examaobjectmodel.exact_match

    assert_not_nil(value.count)

  end



  test "validity of count" do
    value = V1::Examaobjectmodel.count

    assert_not_nil(value)

  end



  test "validity of count_exact_match" do
    value = V1::Examaobjectmodel.count_exact_match

    assert_not_nil(value)

  end


end
