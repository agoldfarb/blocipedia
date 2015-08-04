class CreateAmounts < ActiveRecord::Migration
  def change
    create_table :amounts do |t|

      t.timestamps null: false
    end
  end
end
