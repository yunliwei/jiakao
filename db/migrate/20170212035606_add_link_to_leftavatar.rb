class AddLinkToLeftavatar < ActiveRecord::Migration
  def change
    add_column :leftavatars, :link, :string
  end
end
