class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :content, null: false 
      t.boolean :is_finished, null: false, default: false
      t.timestamps
    end
  end
end
