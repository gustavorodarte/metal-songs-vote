class AddTokensToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :tokens, :json
  end
end
