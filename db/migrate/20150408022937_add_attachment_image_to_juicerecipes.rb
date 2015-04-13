class AddAttachmentImageToJuicerecipes < ActiveRecord::Migration
  def self.up
    change_table :juicerecipes do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :juicerecipes, :image
  end
end
