require 'test_helper'

class Api::V2::ExamaobjectmodelsControllerTest < ActionController::TestCase

  def cleanup

    V2::Examaobjectmodel.destroy_all
  end

  setup do
    cleanup

    @examaobjectmodel_relationship_hash = {}
    @examaobjectmodel = V2::Examaobjectmodel.new({:creation_date=>"2014-12-18", :name=>"Paris Bartoletti"}, as: :"System Admin")

    @examaobjectmodel.save

    @examaobjectmodel = V2::Examaobjectmodel.new({:creation_date=>"2014-12-18", :name=>"Clement Skiles"}, as: :"System Admin")

    @examaobjectmodel.save

    @examaobjectmodel = V2::Examaobjectmodel.new({:creation_date=>"2014-12-18", :name=>"Joanna Ryan"}, as: :"System Admin")

    @examaobjectmodel.save




  end

  teardown do
    cleanup

  end





  test "should get index of examaobjectmodels for Unauthenticated Default" do

    get :index, format: :json

    assert_response :success
    assert_not_nil assigns(:examaobjectmodels)

  end

  test "should get new examaobjectmodel for Unauthenticated Default" do

    get :new, format: :json
    assert_response :success
  end

  test "should create examaobjectmodel for Unauthenticated Default" do

    Api::V2::ExamaobjectmodelsController.any_instance.stubs(:scope_for_create_finder).returns(::V2::Examaobjectmodel)


    assert_difference('V2::Examaobjectmodel.count') do
      post :create, examaobjectmodel: {:creation_date=>"2014-12-18", :name=>"Ying Schmeler"}.merge(@examaobjectmodel_relationship_hash), format: :json
    end
    assert_response :success

  end

  test "should show examaobjectmodel for Unauthenticated Default" do

    Api::V2::ExamaobjectmodelsController.any_instance.stubs(:scope_for_read_finder).returns(::V2::Examaobjectmodel)
    get :show, id: @examaobjectmodel.id, format: :json

    assert_response :success

  end

  test "should update examaobjectmodel for Unauthenticated Default" do

    Api::V2::ExamaobjectmodelsController.any_instance.stubs(:scope_for_update_finder).returns(::V2::Examaobjectmodel)
    put :update, id: @examaobjectmodel.id, examaobjectmodel: {:creation_date=>"2014-12-18", :name=>"Sherwood Kovacek"}, format: :json

    assert_response :success

  end

  test "should destroy examaobjectmodel for Unauthenticated Default" do

    Api::V2::ExamaobjectmodelsController.any_instance.stubs(:scope_for_delete_finder).returns(::V2::Examaobjectmodel)

    assert_difference('V2::Examaobjectmodel.count', -1) do
      delete :destroy, id: @examaobjectmodel.id, format: :json
    end
    assert_response :success

  end




end
