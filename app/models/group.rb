class Group < ActiveRecord::Base
  has_many :group_teams, :dependent => :destroy
  belongs_to :event
  has_many :matches

  accepts_nested_attributes_for :group_teams, :allow_destroy => true,
    :reject_if => proc { |a| a.all? { |k, v| v.blank? }}

  default_scope :order => 'name ASC'

  after_create :create_matches

private
  def create_matches
    t = group_teams.map{ |t| t.team_id }
    t.product(t).reject {|a| a[0].eql? a[1]}.map { |a| a.sort }.uniq.each do |pair|
      Match.create({
        :team1_id => pair[0],
        :team2_id => pair[1],
        :start_date => event.start_date,
        :event_id => event.id,
        :category_id => event.category_id,
        :format_id => event.format_id,
        :user_id => event.user_id,
        :group_id => id
      })
    end
  end
end
