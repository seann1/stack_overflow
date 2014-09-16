class ChangeUserChoice < ActiveRecord::Migration
  def change
    change_column :answers, :user_choice, :boolean, default: false
  end
end
