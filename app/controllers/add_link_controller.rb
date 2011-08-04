class AddLinkController < ApplicationController
  unloadable

  def add_index
  end

  def add
    replace_string = params[:replace_data][:replace_string]
    replace_url = params[:replace_data][:replace_url]
    
    if replace_string && replace_url && replace_string.length > 0 && replace_url.length > 0
      data = UrlStores.new
      data.replace_string = replace_string
      data.replace_url = replace_url
      data.save
      @success = true
    end
  end

  def remove_confirm
    id = params[:data_id]
    if id
      @remove_data = UrlStores.find( id )
    end
  end

  def remove
    @id = params[:data_id]
    if @id
      UrlStores.delete(@id)
      @success = true
    end
  end
end
