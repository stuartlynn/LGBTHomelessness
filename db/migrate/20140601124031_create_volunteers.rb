class CreateVolunteers < ActiveRecord::Migration
  def change
    create_table :volunteers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :announcment
      t.string :location
      t.string :program_requirements
      t.string :age
      t.string :skills
      t.string :time
      t.text :available
      t.text :anything_else

      t.timestamps
    end
  end
end
