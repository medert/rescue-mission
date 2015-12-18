class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :description, null: false
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
