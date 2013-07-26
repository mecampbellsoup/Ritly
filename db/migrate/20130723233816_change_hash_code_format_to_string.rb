class ChangeHashCodeFormatToString < ActiveRecord::Migration
  def change
    change_column :urls, :hash_code, :text
  end
end
