class AddUserIdToGif < ActiveRecord::Migration[6.0]
  def change
    add_reference :gifs, :user, index: true
  end
end
