class AddParamsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :birth_date, :datetime
    add_column :users, :bio, :text
    add_column :users, :picture, :string
    add_column :users, :is_admin, :boolean, default: false
  end
end
