class Task < ApplicationRecord
  validates :content, presence: true
  enum is_finished: { working: false, finished: true}
end
