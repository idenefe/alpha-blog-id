module ApplicationHelper
  def gravatar_for(user, options = {size: 80}) # default size of 80 unless size specified in call
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase) # md5 encrypt email
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}" # url of image on gravatar
    # return an imagetag (or username if no image found for user)
    image_tag(gravatar_url, alt: user.username, class: "img-circle") 
  end
end
