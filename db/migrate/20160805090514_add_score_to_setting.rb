class AddScoreToSetting < ActiveRecord::Migration
  def change
    add_column :settings, :score, :string
  end
end
