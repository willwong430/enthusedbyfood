module UsersHelper
  
  # Returns the Gravatar (http:://gravatar.com/) for the given user.
  def gravatar_for(user, options = { size: 50 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
  
  def image_link(user, options = {})
    link = options[:link] || user
    image = options[:image] || :icon
    image_options = { title: user.name, alt: user.name }
    unless options[:image_options].nil?
      image_options.merge!(options[:image_option])
    end
    link_options = { title: user.name }
    unless options[:link_options].nil?
      link_options.merge!(options[:link_options])
    end
    content = image_tag(user.avatar, image_options)
    link_to(content, link, link_options)
  end
end
