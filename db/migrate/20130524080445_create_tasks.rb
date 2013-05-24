class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.boolean :status
      t.date :due_date

      t.timestamps
    end
  end
end
