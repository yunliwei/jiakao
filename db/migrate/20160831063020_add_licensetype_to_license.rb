class AddLicensetypeToLicense < ActiveRecord::Migration
  def change
    add_column :licenses, :licensetype, :integer
  end
end
