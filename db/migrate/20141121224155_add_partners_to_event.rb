class AddPartnersToEvent < ActiveRecord::Migration
  def change
    add_column :events, :partner_one, :string
    add_column :events, :partner_two, :string
  end
end
