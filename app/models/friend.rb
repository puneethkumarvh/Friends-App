# frozen_string_literal: true

class Friend < ApplicationRecord
  belongs_to :user
  validates :first_name, length: { minimum: 3 }, presence: true
  validates :phone, numericality: true, length: { is: 10 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
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
