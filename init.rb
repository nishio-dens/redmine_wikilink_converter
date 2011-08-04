# -*- coding: utf-8 -*-
require 'redmine'

class LinkConvertHelper
  @@url_list = { 
    "infosys" => "https://etrack.timedia.co.jp/EasyTracker/board/IssueView.aspx?board_id=B_0006&issue_id=B_0006_" ,
    "業務" => "https://etrack.timedia.co.jp/EasyTracker/board/IssueView.aspx?board_id=B_0234&issue_id=B_0234_"
  }
  
  def initialize
  end

  def get_url(key, value)
    url = @@url_list[key]
    if url
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
  name 'Redmine Wikilink Converter plugin'
  author 'Shinsuke Nishio'
  description 'wiki link converter'
  version '0.0.1'
  
  Redmine::WikiFormatting::Macros.register do
    desc "nothing"
    macro :eviden do |obj, args|
      h = LinkConvertHelper.new
      h.get_tag(args)
    end
  end
end

