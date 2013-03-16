class AddClientNameInSales < ActiveRecord::Migration
  def up
    add_column :sales, :client_name, :string
  end

  def down
    remove_column :sales, :client_name
  end
end
