class ChangeUserChoice < ActiveRecord::Migration
  def change
    add_column :answers, :user_choice, :boolean, default: false
  end
end
