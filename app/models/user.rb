# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  location_id     :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  age             :integer
#  fav_language    :string
#  password_digest :string           not null
#  session_token   :string           not null
#
class User < ApplicationRecord

  # F I G V A P E R

  #V
  validates :username, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  # there only be few time that user will pass raw password. Other cases(exisitng users), we will have password_digest then we will not have any value for password section
  # validates :location_id, presence: true
  # presence:true == null:false in db constraint

  after_initialize :ensure_session_token #A
  # After initialize will invoke methods we give it after initializing a new object (when .new is called)
  # == before_validation :ensure_session_token => will invoke methods we give it before running validations (when .save is called).

  def self.find_by_credentials(username, password) #F
    user = User.find_by(username: username)

    if user && user.is_password?(password) #if we found the user and the pasword is correct -> return user
      user
    else
      nil
    end
  end

  def self.generate_session_token #G
    SecureRandom.urlsafe_base64
    # == SecureRandom::urlsafe_base64
  end

  def is_password?(password) #I
    password_obj = BCrypt::Password.new(self.password_digest) #how we convert string that is already existing in the db(password_digest) to BCrypt obj
    password_obj.is_password?(password) #BCrypt built in instance method != line 36(User #instance method)
  end

  def password=(password) #P
    @password = password
    self.password_digest = BCrypt::Password.create(password) #when we pass in raw string password -> create new(non exisitng) hash password using salt
    # ^password_digest must be explicitly called on self. if not it will create local var 'password_digest'
  end

  # getter is only for the validation
  def password #A with attr_reader
    @password
  end

  def ensure_session_token #E
    self.session_token ||= User.generate_session_token #initialize session tkn for a NEW USER
  end

  def reset_session_token! #R #reset session token for existing user
    self.session_token = User.generate_session_token #generating new hash sesion_token
    self.save! #password will be nil we only have pw_digest at this point => allow_nil: true will let us pass the validation and save new data in db
    self.session_token #return the new session_token
  end

  # belongs_to will automatically validate presence:true
  belongs_to :location,
             primary_key: :id,
             foreign_key: :location_id,
             class_name: :Location

  has_many :sips,
           primary_key: :id,
           foreign_key: :author_id,
           class_name: :Sip

  has_many :likes,
           primary_key: :id,
           foreign_key: :liker_id,
           class_name: :Like

  has_many :liked_sips,
           through: :likes,
           source: :sip

  #PART 1

  # #Get first user record, use first
  #     User.first
  # #Get last user record, use last
  #     User.last
  # #Find a user that exists by id, use find
  #     # User.find(3)
  # #Find a user that doesn't exist by id, use find
  #     User.find(200)
  # #Find a user by username, use find_by
  #     User.find_by(username: "instructors_rock")
  # #Find a user by username that does not exist, use find_by
  #     User.find_by(username: "fishes")

  #PART 2

  #Find all users between the ages of 10 and 20 inclusive. Show their username, and favorite language.
  # User.select("username", "fav_language", "id").where("age BETWEEN 10 AND 20")
  User.select("username", "fav_language", "id").where(age: 10..20)
  #Find all users not younger than the age of 11. Use `where.not`
  User.where.not("age <= ?", 11)
  #Find all users who has a favorite language in this list and order by ascending by username
  languages = ["Ruby", "SQL"]
  User.where(fav_language: languages).order("username ASC")
end
