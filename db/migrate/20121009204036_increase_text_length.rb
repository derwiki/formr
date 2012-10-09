class IncreaseTextLength < ActiveRecord::Migration
  def change
    change_column :answers, :text, :text, :limit => nil
    change_column :questions, :text, :text, :limit => nil
  end
end
