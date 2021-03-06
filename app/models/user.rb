class User < ActiveRecord::Base
  # When adding roles, be sure to add them to the end of this array
  ROLES = %w[admin news_writer insider events_admin]

  named_scope :search, lambda {|q| {:conditions => ["username like ?", "%#{q}%" || '']}}

  validates_length_of :username, :within => 3..20
  validates_presence_of :username, :email, :country, :birthdate
  validates_uniqueness_of :username
  validates_format_of :username, :with => /^\w+$/i, :message => "can only contain letters and numbers."

  has_friendly_id :username, :use_slug => true

  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :confirmable, :lockable, :timeoutable and :activatable
  devise :registerable, :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable, :confirmable,
         :authentication_keys => [:username]

  has_many :articles
  has_many :blogs
  has_many :teams
  has_many :matches
  has_many :players
  has_many :albums
  has_many :received_messages, :class_name => 'Message', :foreign_key => 'receiver_id'
  has_many :sent_messages, :class_name => 'Message', :foreign_key => 'from_id'

  has_attached_file :avatar, :styles => {
    :default => "50x50#",
    :profile => "128x128"
  },
    :default_url => '/images/small-default-user.png',
    :default_style => :default

  def age
    (Time.now.year - birthdate.year) - (turned_older? ? 0 : 1) rescue 0
  end

  def turned_older?
    (birthdate.to_time.change(:year => Time.now.year) <= Time.now)
  end

  def fullname
    "#{firstname} '#{username}' #{surname}"
  end

  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end

  def roles
    ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero? }
  end

  def is?(role)
    roles.include? role.to_s
  end
end
