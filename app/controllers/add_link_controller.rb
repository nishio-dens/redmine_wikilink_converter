class AddLinkController < ApplicationController
  unloadable

  def add_index
  end

  def add
    replace_string = params[:replace_data][:replace_string]
    replace_url = params[:replace_data][:replace_url]
    
    if replace_string && replace_url
      data = UrlStores.new
      data.replace_string = replace_string
      data.replace_url = replace_url
      data.save
      @success = true
    end
    
  end
end
