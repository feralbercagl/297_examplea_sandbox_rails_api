require 'test_helper'

class Api::V1::ExamaobjectmodelsControllerTest < ActionController::TestCase

  def cleanup

    V1::Examaobjectmodel.destroy_all
  end

  setup do
    cleanup

    @examaobjectmodel_relationship_hash = {}
    @examaobjectmodel = V1::Examaobjectmodel.new({:creation_date=>"2014-12-18", :name=>"Armando Jaskolski"}, as: :"System Admin")

    @examaobjectmodel.save

    @examaobjectmodel = V1::Examaobjectmodel.new({:creation_date=>"2014-12-18", :name=>"Leonel Wunsch"}, as: :"System Admin")

    @examaobjectmodel.save

    @examaobjectmodel = V1::Examaobjectmodel.new({:creation_date=>"2014-12-18", :name=>"Lydia Mohr"}, as: :"System Admin")

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

    Api::V1::ExamaobjectmodelsController.any_instance.stubs(:scope_for_create_finder).returns(::V1::Examaobjectmodel)


    assert_difference('V1::Examaobjectmodel.count') do
      post :create, examaobjectmodel: {:creation_date=>"2014-12-18", :name=>"Kesha Feeney"}.merge(@examaobjectmodel_relationship_hash), format: :json
    end
    assert_response :success

  end

  test "should show examaobjectmodel for Unauthenticated Default" do

    Api::V1::ExamaobjectmodelsController.any_instance.stubs(:scope_for_read_finder).returns(::V1::Examaobjectmodel)
    get :show, id: @examaobjectmodel.id, format: :json

    assert_response :success

  end

  test "should update examaobjectmodel for Unauthenticated Default" do

    Api::V1::ExamaobjectmodelsController.any_instance.stubs(:scope_for_update_finder).returns(::V1::Examaobjectmodel)
    put :update, id: @examaobjectmodel.id, examaobjectmodel: {:creation_date=>"2014-12-18", :name=>"Dovie Kuhic"}, format: :json

    assert_response :success

  end

  test "should destroy examaobjectmodel for Unauthenticated Default" do

    Api::V1::ExamaobjectmodelsController.any_instance.stubs(:scope_for_delete_finder).returns(::V1::Examaobjectmodel)

    assert_difference('V1::Examaobjectmodel.count', -1) do
      delete :destroy, id: @examaobjectmodel.id, format: :json
    end
    assert_response :success

  end




end
