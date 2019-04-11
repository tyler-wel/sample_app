class Board < ApplicationRecord

  validates :name, presence: true, length: { maximum: 40 }

  has_and_belongs_to_many :users, -> { distinct }
  has_many :task_lists, dependent: :destroy
end
