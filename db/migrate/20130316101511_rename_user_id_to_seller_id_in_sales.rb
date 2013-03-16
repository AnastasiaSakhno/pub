class RenameUserIdToSellerIdInSales < ActiveRecord::Migration
  def up
    rename_column :sales, :user_id, :seller_id
  end

  def down
    rename_column :sales, :seller_id, :user_id
  end
end
