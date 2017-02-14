class AddLinkToTopavatar < ActiveRecord::Migration
  def change
    add_column :topavatars, :link, :string
  end
end
