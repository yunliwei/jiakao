class AddLicensetimeToLicense < ActiveRecord::Migration
  def change
    add_column :licenses, :licensetime, :string
  end
end
