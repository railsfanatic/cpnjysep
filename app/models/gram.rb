class Gram < ActiveRecord::Base
  def self.refresh
    access_token = Settings.where(name: "instagram_access_token").first.value
    # user_id = Settings.where(name: "instagram_user_id").first.value
    user_id = '645086162'
    client = Instagram.client(:access_token => access_token)
    media = client.user_recent_media(user_id)
    
    # add new media to cache
    media.each do |media|
      unless exists?(media_id: media.id)
        create!(
          media_id: media.id.to_s,
          media_type: media.type,
          created_at: DateTime.strptime(media.created_time, '%s'),
          link: media.link,
          thumbnail: media.images.thumbnail.url,
          low_res: media.images.low_resolution.url,
          standard_res: media.images.standard_resolution.url,
          caption: media.caption.try(:text)
        )
      end
    end
    
    # remove deleted media from cache
    ids_to_delete = Gram.pluck(:media_id) - media.collect(&:id)
    Gram.where(media_id: ids_to_delete).delete_all
  end
end
