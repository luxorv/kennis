class CreateArchivements < ActiveRecord::Migration
  def change
    create_table :archivements do |t|
      t.references :user, index: true
      t.references :badge, index: true

      t.timestamps
    end
  end
end
