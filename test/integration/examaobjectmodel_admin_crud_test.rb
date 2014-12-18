require 'test_helper'

class V2::ExamaobjectmodelAdminCRUDTest < ActionDispatch::IntegrationTest


  def cleanup

    V2::Examaobjectmodel.destroy_all
  end

  setup do
    cleanup

    @examaobjectmodel_relationship_hash = {}
    @examaobjectmodel = V2::Examaobjectmodel.new({:creation_date=>"2014-12-18", :name=>"Karena Hilpert"}, as: :"System Admin")

    @examaobjectmodel.save

    @examaobjectmodel = V2::Examaobjectmodel.new({:creation_date=>"2014-12-18", :name=>"Erik O'Conner"}, as: :"System Admin")

    @examaobjectmodel.save


  end

  teardown do
    cleanup
  end



  test "should be able to create instance of examaobjectmodel" do
    login_to_admin
    click_link('Examaobjectmodels')
    click_link('New')


    fill_in "examaobjectmodel_name", :with => "Isreal Durgan"


    click_button('Submit')
    assert page.has_link?('Edit') || page.has_selector?('.fa-pencil', count: 3)

  end

  test "should be able to delete instance of examaobjectmodel" do
    login_to_admin
    visit('/admin/examaobjectmodels')
    assert(has_xpath?("//tbody/tr/td/a[@data-method='delete' and @href='/admin/examaobjectmodels/#{URI::encode(@examaobjectmodel.id.to_s)}']"))
    first(:xpath, "//tbody/tr/td/a[@data-method='delete' and @href='/admin/examaobjectmodels/#{URI::encode(@examaobjectmodel.id.to_s)}']").click
    assert(has_no_xpath?("//tbody/tr/td/a[@data-method='delete' and @href='/admin/examaobjectmodels/#{URI::encode(@examaobjectmodel.id.to_s)}']"))
  end

  test "should be able to edit instance of examaobjectmodel" do
    login_to_admin
    edit_instance_uri = "/admin/examaobjectmodels/#{@examaobjectmodel.id}"
    visit(edit_instance_uri)
    click_link('Edit')

    old_value = @examaobjectmodel.creation_date
    new_value = "2014-12-18"

    fill_in "examaobjectmodel_creation_date", with: new_value
    click_button('Submit')



    visit(edit_instance_uri)
    click_link('Edit')

    updated_value = find_field("examaobjectmodel_creation_date").value

    assert_not_equal(updated_value, old_value)

  end
end
