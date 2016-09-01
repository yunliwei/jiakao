class CreateLicenses < ActiveRecord::Migration
  def change
    create_table :licenses do |t|
      t.string :license
      t.integer :cpuid_id

      t.timestamps null: false
    end
  end
end
