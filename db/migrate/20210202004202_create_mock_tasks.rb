class CreateMockTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :mock_tasks do |t|
      t.string :task_title
      t.string :task_description
      t.boolean :task_complete?, default: false

      t.timestamps
    end
  end
end
