class RemoveSelfIntroductionFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :self_introduction, :text
  end
end
