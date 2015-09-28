class SorceryCore < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email,            :null => false
      t.string :pic_url
      t.string :name,	:null => false, :unique => true
      t.string :favorite
      t.string :crypted_password
      t.string :salt

      t.timestamps
    end

    add_index :users, [:name, :email], unique: true
  end

end