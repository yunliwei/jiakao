json.array!(@settings) do |setting|
  json.extract! setting, :id, :autormerr, :showerrcount, :model, :password, :prescore, :driverschoolname, :contact, :addre, :introduction, :testbenchnumber, :driverschoolpicture, :province, :poweron, :closepassword, :shownotification, :softwaretitle, :hidedriverlicense, :hidesetting, :textreplace, :scrollingtext, :functionalmodule, :subjiectmodule, :learningmodule, :displaytest, :reshuffling, :autoclear, :subjectfourbutton, :registrationprocess, :paymentlink, :customerserviceQQ, :customerserviceWW, :comment, :registrationdisplay
  json.url setting_url(setting, format: :json)
end
