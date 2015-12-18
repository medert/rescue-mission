class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.integer :creator_id 

      t.timestamps null: false
    end
  end
end
