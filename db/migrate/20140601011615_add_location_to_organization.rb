class AddLocationToOrganization< ActiveRecord::Migration
  def change
    add_column :organizations, :latitude, :float
    add_column :organizations, :longitude, :float
  end
end
