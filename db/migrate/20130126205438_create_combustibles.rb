class CreateCombustibles < ActiveRecord::Migration
  def change
    create_table :combustibles do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
