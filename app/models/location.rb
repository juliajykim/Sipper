# == Schema Information
#
# Table name: locations
#
#  id         :bigint           not null, primary key
#  city       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Location < ApplicationRecord
    validates :city, presence: true, uniqueness: true

    has_many :users,
        primary_key: :id,
        foreign_key: :location_id, #foreign key in Users table 
        class_name: :User
end
