class EditBussinessTable < ActiveRecord::Migration[5.2]
  def change
    add_column :businesses, :category_id, :integer
  end
end
