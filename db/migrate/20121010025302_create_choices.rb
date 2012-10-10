class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.integer :question_id
      t.integer :answer_id
      t.integer :response_id

      t.timestamps
    end
  end
end
