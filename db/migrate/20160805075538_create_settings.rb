class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :autormerr
      t.string :showerrcount
      t.string :model
      t.string :password
      t.string :prescore
      t.string :driverschoolname
      t.string :contact
      t.string :addre
      t.string :introduction
      t.integer :testbenchnumber
      t.string :driverschoolpicture
      t.string :province
      t.string :poweron
      t.string :closepassword
      t.string :shownotification
      t.string :softwaretitle
      t.string :hidedriverlicense
      t.string :hidesetting
      t.string :textreplace
      t.string :scrollingtext
      t.string :functionalmodule
      t.string :subjiectmodule
      t.string :learningmodule
      t.string :displaytest
      t.string :reshuffling
      t.string :autoclear
      t.string :subjectfourbutton
      t.string :registrationprocess
      t.string :paymentlink
      t.string :customerserviceQQ
      t.string :customerserviceWW
      t.string :comment
      t.string :registrationdisplay

      t.timestamps null: false
    end
  end
end
