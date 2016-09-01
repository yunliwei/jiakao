class CreateCpuids < ActiveRecord::Migration
  def change
    create_table :cpuids do |t|
      t.string :cpuid

      t.timestamps null: false
    end
  end
end
