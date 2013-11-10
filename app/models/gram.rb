class Gram < ActiveRecord::Base
  def self.pull_grams
    access_token = Settings.where(name: "instagram_access_token").first.value
    # user_id = Settings.where(name: "instagram_user_id").first.value
    user_id = '645086162'
    client = Instagram.client(:access_token => access_token)
    client.user_recent_media(user_id).each do |media|
      unless exists?(media_id: media.id)
        create!(
          media_id: media.id.to_s,
          media_type: media.type,
          created_at: DateTime.strptime(media.created_time, '%s'),
          link: media.link,
          low_res: media.images.low_resolution.url,
          standard_res: media.images.standard_resolution.url,
          caption: media.caption.text
        )
      end
    end
  end
end
