class CreateSnapshots < ActiveRecord::Migration[6.0]
  def change
    create_table :snapshots do |t|
      t.integer :user_id
      t.integer :value

      t.timestamps
    end
  end
end
