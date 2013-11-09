class Activity < ActiveRecord::Base
  extend TimeSplitter::Accessors
  split_accessor :starts_at, format: "%F"
  validates :title, presence: true
  
  def duration
    if length_in_minutes < 60
      "#{length_in_minutes} minutes"
    else
      if length_in_minutes % 60 == 0
        "#{length_in_minutes / 60} hours"
      else
        "#{length_in_minutes / 60} hours, #{length_in_minutes % 60} minutes"
      end
    end
  end
end
