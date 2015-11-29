class CreateWeathers < ActiveRecord::Migration
  def change
    create_table :weathers do |t|
      t.string :city
      t.integer :temperature
      t.string :value

      t.timestamps null: false
    end
  end
end
