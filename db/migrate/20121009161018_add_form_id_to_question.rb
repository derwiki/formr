class AddFormIdToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :form_id, :integer
  end
end
