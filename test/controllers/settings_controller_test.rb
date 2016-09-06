require 'test_helper'

class SettingsControllerTest < ActionController::TestCase
  setup do
    @setting = settings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:settings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create setting" do
    assert_difference('Setting.count') do
      post :create, setting: { addre: @setting.addre, autoclear: @setting.autoclear, autormerr: @setting.autormerr, closepassword: @setting.closepassword, comment: @setting.comment, contact: @setting.contact, customerserviceQQ: @setting.customerserviceQQ, customerserviceWW: @setting.customerserviceWW, displaytest: @setting.displaytest, driverschoolname: @setting.driverschoolname, driverschoolpicture: @setting.driverschoolpicture, functionalmodule: @setting.functionalmodule, hidedriverlicense: @setting.hidedriverlicense, hidesetting: @setting.hidesetting, introduction: @setting.introduction, learningmodule: @setting.learningmodule, model: @setting.model, password: @setting.password, paymentlink: @setting.paymentlink, poweron: @setting.poweron, prescore: @setting.prescore, province: @setting.province, registrationdisplay: @setting.registrationdisplay, registrationprocess: @setting.registrationprocess, reshuffling: @setting.reshuffling, scrollingtext: @setting.scrollingtext, showerrcount: @setting.showerrcount, shownotification: @setting.shownotification, softwaretitle: @setting.softwaretitle, subjectfourbutton: @setting.subjectfourbutton, subjiectmodule: @setting.subjiectmodule, testbenchnumber: @setting.testbenchnumber, textreplace: @setting.textreplace }
    end

    assert_redirected_to setting_path(assigns(:setting))
  end

  test "should show setting" do
    get :show, id: @setting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @setting
    assert_response :success
  end

  test "should update setting" do
    patch :update, id: @setting, setting: { addre: @setting.addre, autoclear: @setting.autoclear, autormerr: @setting.autormerr, closepassword: @setting.closepassword, comment: @setting.comment, contact: @setting.contact, customerserviceQQ: @setting.customerserviceQQ, customerserviceWW: @setting.customerserviceWW, displaytest: @setting.displaytest, driverschoolname: @setting.driverschoolname, driverschoolpicture: @setting.driverschoolpicture, functionalmodule: @setting.functionalmodule, hidedriverlicense: @setting.hidedriverlicense, hidesetting: @setting.hidesetting, introduction: @setting.introduction, learningmodule: @setting.learningmodule, model: @setting.model, password: @setting.password, paymentlink: @setting.paymentlink, poweron: @setting.poweron, prescore: @setting.prescore, province: @setting.province, registrationdisplay: @setting.registrationdisplay, registrationprocess: @setting.registrationprocess, reshuffling: @setting.reshuffling, scrollingtext: @setting.scrollingtext, showerrcount: @setting.showerrcount, shownotification: @setting.shownotification, softwaretitle: @setting.softwaretitle, subjectfourbutton: @setting.subjectfourbutton, subjiectmodule: @setting.subjiectmodule, testbenchnumber: @setting.testbenchnumber, textreplace: @setting.textreplace }
    assert_redirected_to setting_path(assigns(:setting))
  end

  test "should destroy setting" do
    assert_difference('Setting.count', -1) do
      delete :destroy, id: @setting
    end

    assert_redirected_to settings_path
  end
end
