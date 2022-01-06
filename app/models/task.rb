class Task < ApplicationRecord
  validates :title,presence: true
  validates :start_day,presence: true
  validates :end_day,presence: true
  validate :date_before_start
  validate :date_before_end

  def date_before_start
    return if start_day.blank?
    errors.add(:start_day, "は今日以降の日付で選択してください") if start_day < Date.today
  end

  def date_before_end
    return if end_day.blank?
    errors.add(:end_day, "は開始日以降の日付で選択してください") if end_day < start_day
  end
end
