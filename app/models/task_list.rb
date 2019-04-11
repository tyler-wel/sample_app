class TaskList < ApplicationRecord
  belongs_to :board
  has_many :tasks, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }

end
