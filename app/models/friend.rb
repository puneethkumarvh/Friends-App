
class Friend < ApplicationRecord
    require 'csv'
    belongs_to :user
    
    def self.import(file)
        CSV.foreach(file.path,headers: true) do |row|
            Friend.create! row.to_hash
        end
    end
end
