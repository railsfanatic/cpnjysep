class Settings < ActiveRecord::Base
  def self.assign(hash)
    hash.each do |key, value|
      setting = Settings.find_or_create_by(name: key)
      unless setting.value == value
        setting.update(value: value)
      end
    end
  end
end
