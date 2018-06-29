class AddsSpecialsToComedian < ActiveRecord::Migration[5.2]
  def change
      add_column :comedians, :specials, :string
  end
end
