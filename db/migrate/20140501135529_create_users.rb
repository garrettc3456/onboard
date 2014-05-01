class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

    	t.string :name
    	t.string :username
    	t.string :email
    	# to make passwrods secure in our database, we put:
    	t.string :password_digest



# if you wnated to create differnet types of users (business/regular),
# you weould put 
  
  

      t.timestamps
    end
  end
end
