class ChangeRatingToInt < ActiveRecord::Migration[5.0]
  def change
    change_column :reviews, :rating, :integer
  end
end
