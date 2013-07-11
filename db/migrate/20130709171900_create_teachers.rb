require_relative '../config'

class CreateTeachers < ActiveRecord::Migration
  def change
    # HINT: checkout ActiveRecord::Migration.create_table
    create_table :teachers do |t|
      t.string :name
      t.string :email
      t.string :phone
    end
  end
end
