# -*- coding: utf-8 -*-
require 'redmine'

class LinkConvertHelper
  @@url_list = {}
  
  def initialize
    db = UrlStores.all
    if db
      db.each do | data |
        @@url_list[ data.replace_string ] = data.replace_url
      end
    end
  end

  def get_url(key, value)
    url = @@url_list[key]
    if url
      url.strip!
      return url + value
    end
  end

  def get_tag(args)
    if args.size < 2
      return nil
    end
    
    link_key = args[0].to_s.strip
    link_value = args[1].to_s.strip

    tag = get_url(link_key, link_value)
    if tag
      return "<a href=#{tag}>#{link_key} #{link_value}</a>"
    end
    return "Error: Link not found"
  end
end

Redmine::Plugin.register :redmine_wikilink_converter do
  name 'Redmine Eviden Wikilink Converter plugin'
  author 'Shinsuke Nishio'
  description 'evidenへのリンクを作成するwikiプラグイン'
  version '0.0.1'

  settings :default => {
    'replace_string' => 'key',
    'replace_address' => 'testurl'
  }, :partial => 'settings/eviden_settings'
  
  Redmine::WikiFormatting::Macros.register do
    desc "nothing"
    macro :eviden do |obj, args|
      h = LinkConvertHelper.new
      h.get_tag(args)
    end
  end
end

