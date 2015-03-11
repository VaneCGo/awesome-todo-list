class TodoItem < ActiveRecord::Base
  belongs_to :todo_list

  validates :content, presence: true, length: { minimum: 2 }

  # Two different ways to write the same thing
  scope :complete, -> { where('completed_at is not null') } #where clause in the  database
  scope :incomplete, -> { where(completed_at: nil) } #rails

  def completed?
  	!completed_at.blank?
  end
end