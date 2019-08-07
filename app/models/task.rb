class Task < ApplicationRecord
	belongs_to :user
	#１対多の紐づけ
  validates :status, presence: true, length:{ maximum: 10}
end
