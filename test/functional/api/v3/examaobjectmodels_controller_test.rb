require 'test_helper'

class Api::V3::ExamaobjectmodelsControllerTest < ActionController::TestCase

  def cleanup

    V3::Examaobjectmodel.destroy_all
  end

  setup do
    cleanup

    @examaobjectmodel_relationship_hash = {}
    @examaobjectmodel = V3::Examaobjectmodel.new({:creation_date=>"2014-12-19", :name=>"Yan Robel"}, as: :"System Admin")

    @examaobjectmodel.save

    @examaobjectmodel = V3::Examaobjectmodel.new({:creation_date=>"2014-12-19", :name=>"Carly Bartoletti"}, as: :"System Admin")

    @examaobjectmodel.save

    @examaobjectmodel = V3::Examaobjectmodel.new({:creation_date=>"2014-12-19", :name=>"Bob Stroman"}, as: :"System Admin")

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

    Api::V3::ExamaobjectmodelsController.any_instance.stubs(:scope_for_create_finder).returns(::V3::Examaobjectmodel)


    assert_difference('V3::Examaobjectmodel.count') do
      post :create, examaobjectmodel: {:creation_date=>"2014-12-19", :name=>"Anthony Gutmann"}.merge(@examaobjectmodel_relationship_hash), format: :json
    end
    assert_response :success

  end

  test "should show examaobjectmodel for Unauthenticated Default" do

    Api::V3::ExamaobjectmodelsController.any_instance.stubs(:scope_for_read_finder).returns(::V3::Examaobjectmodel)
    get :show, id: @examaobjectmodel.id, format: :json

    assert_response :success

  end

  test "should update examaobjectmodel for Unauthenticated Default" do

    Api::V3::ExamaobjectmodelsController.any_instance.stubs(:scope_for_update_finder).returns(::V3::Examaobjectmodel)
    put :update, id: @examaobjectmodel.id, examaobjectmodel: {:creation_date=>"2014-12-19", :name=>"Theresia Wuckert"}, format: :json

    assert_response :success

  end

  test "should destroy examaobjectmodel for Unauthenticated Default" do

    Api::V3::ExamaobjectmodelsController.any_instance.stubs(:scope_for_delete_finder).returns(::V3::Examaobjectmodel)

    assert_difference('V3::Examaobjectmodel.count', -1) do
      delete :destroy, id: @examaobjectmodel.id, format: :json
    end
    assert_response :success

  end




end
