# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  liker_id   :integer          not null
#  sip_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Like < ApplicationRecord
    validates :liker_id, :sip_id, presence: true
    validates :liker_id, uniqueness: {scope: :sip_id}
    # liker_id must in unique in the scope of sip_id
    # liker_id and sip_id can be swapped

    belongs_to :liker, #it's just method name. you can name whatever you want!
        primary_key: :id,
        foreign_key: :liker_id,
        class_name: :User
    
    belongs_to :sip,
        primary_key: :id,
        foreign_key: :sip_id,
        class_name: :Sip
    # belongs to => I(likes table) hold foreign key(sip_id)
end
