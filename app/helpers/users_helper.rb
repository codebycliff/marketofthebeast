module UsersHelper

  def gravatar_for(user, options = { :size => 96 })
    gravatar_image_tag(user.email.downcase, :alt => user.name, :class => 'gravatar', :gravatar => options)
  end

end
