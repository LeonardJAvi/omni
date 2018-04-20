# GoogleAnayticsTrack Model
class Script < ActiveRecord::Base
 include ActivityHistory

 before_save :split_url

 def self.get_script(url)
   url = url.split('//').last.split('/').join('/').split('www.').last
   find_by_url(url)
 end

 def split_url
   self.url = self.url.split('//').last.split('/').join('/').split('www.').last
 end

 def self.search_field
   :name_or_script_cont
 end
end
