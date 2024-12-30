class RenameTypeToFeedbackType < ActiveRecord::Migration[8.0]
  def change
    rename_column :feedback_items, :type, :feedback_type
  end
end
