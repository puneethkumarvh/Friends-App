# frozen_string_literal: true

class Friend < ApplicationRecord
  belongs_to :user
  validates :first_name, length: { minimum: 3 }, presence: true
  validates :phone, numericality: true, length: { is: 10 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
end
