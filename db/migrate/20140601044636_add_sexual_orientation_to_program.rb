class AddSexualOrientationToProgram < ActiveRecord::Migration
  def change
    add_column :programs, :sexual_orientation_requirement, :string
  end
end
