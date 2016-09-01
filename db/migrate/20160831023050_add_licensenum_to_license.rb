class AddLicensenumToLicense < ActiveRecord::Migration
  def change
    add_column :licenses, :licensenum, :integer
  end
end
