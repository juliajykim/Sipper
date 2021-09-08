# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  body       :string           not null
#
class Sip < ApplicationRecord
    validates :body, :author_id, presence: true

    belongs_to :author,
        primary_key: :id,
        foreign_key: :author_id,
        class_name: :User

    has_many :likes,
        primary_key: :id,
        foreign_key: :sip_id,
        class_name: :Like

    has_many :likers,
        through: :likes, #in line 19
        source: :liker #association in Like class

    #ASSOCIATIONS AND JOINS 

    #Find all sips for a particular user
        Sip.joins(:author).where("username = 'instructors_rock'")
       
    #Find all sips liked by people whose favorite language is Ruby
        Sip.joins(:likers).where("fav_language = ?", "Ruby")
    #Find all sips with no likes
        # Post.left_outer_joins(:likes).where("likes.id IS NULL")
        Sip.left_outer_joins(:likes).where(likes: {id: nil})
    #Find how many likes each sip has
        Sip.joins(:likes).group("sips.id").count("sips.id")
        Sip.select(:id, :body, "COUNT(*) as num_likes").joins(:likes).group("sips.id")
    #Find sips with at least 3 likes 
    #Use pluck for this one! We just want the sip body
        Sip.select(:id, :body, "COUNT(*) as num_likes").joins(:likes).group("sips.id").having("count(*) > 3").pluck("sips.body")


    # INCLUDES #

    def self.see_sip_authors_n_plus_one
        # the "+1"
        sips = Sip.all

        # the "N"
        sips.each do |sip|
            puts sip.author.username
        end

    end

    def self.see_sips_optimized
        # pre-fetches data
        sips = Sip.includes(:author).all

        sips.each do |sip| 
        # uses pre-fetched data 
            puts sip.author.username
        end
    end

    # JOINS #

    def self.see_sip_num_likes_n_plus_one
        posts = Sip.all

        posts.each do |post|
            puts post.likes.length
        end
    end

    def self.see_sip_num_likes_optimized
        sips_with_likes = Sip
            .select("sips.*, COUNT(*) AS num_likes")
            .joins(:likes)
            .group(:id)
    
        sips_with_likes.each do |sip|
            puts sip.num_likes
        end
    end
 end


