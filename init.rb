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
      value.length.times do |i|
        url.gsub!( "\[#{i}\]", value[i].strip)
      end
      return url
    end
  end

  def get_tag(args)
    if args.size < 2
      return nil
    end
    link_key = args[0].to_s.strip
    link_value = args
    tag = get_url(link_key, link_value)

    if tag
      link = "<a href=#{tag}> "
      link_value.each do | d |
        link = link + d.strip + " "
      end
      link = link + "</a>"
      return link
    end
    return "Error: Link not found"
  end
end

Redmine::Plugin.register :redmine_wikilink_converter do
  name 'Redmine Wikilink Converter plugin'
  author 'Shinsuke Nishio'
  description 'wiki内でリンクを簡単に作成するためのプラグイン'
  version '0.0.1'

  settings :partial => 'settings/wikilink_settings'
  
  Redmine::WikiFormatting::Macros.register do
    desc "nothing"
    macro :wikilink do |obj, args|
      h = LinkConvertHelper.new
      h.get_tag(args)
    end
  end
end

