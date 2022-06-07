
class Friend < ApplicationRecord
  

    require 'csv'
    belongs_to :user
    
    def self.import(file)
    
        CSV.foreach(file.path,headers: true) do |row|
            each_friend = Friend.new
            each_friend.first_name = row[0]
            each_friend.last_name = row[1]
            each_friend.email = row[2]
            each_friend.phone = row[3]
            each_friend.twitter = row[4]
            each_friend.save
            
        end
    end
end
