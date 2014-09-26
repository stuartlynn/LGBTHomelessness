class AddWebsiteToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :website, :string
  end
end
