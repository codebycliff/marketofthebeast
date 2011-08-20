module ApplicationHelper

  # Return a title on a per-page basis.
  def title
    base_title = "Market of the Beast"
    if @title.nil?
      base_title
    else 
      "#{base_title} | #{@title}"
    end
  end

  def logo_image
    image_tag("newspaper-title.png", :alt => "The Market of the Beast")
  end

  def link_artist_image(artist)
    filename = "artists/#{artist.name.downcase.gsub(/ /, '_')}.jpg"
    #if !File.exist?(filename)
      #filename = "users/#{artist.user.id}.jpg"
    #end
    link_to image_tag(filename, :alt => artist.name, :width => "230px", :height => "200px", :style => 'float: left; clear: left; margin: 0.75em;'), artist
  end


end
