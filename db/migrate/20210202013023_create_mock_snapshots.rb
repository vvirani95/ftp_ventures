class CreateMockSnapshots < ActiveRecord::Migration[6.0]
  def change
    create_table :mock_snapshots do |t|
      t.integer :value
      
      t.timestamps
    end
  end
end
