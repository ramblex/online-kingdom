class Event < ActiveRecord::Base
  has_many :matches, :dependent => :destroy
  has_many :event_teams
  belongs_to :category
  belongs_to :user

  has_many :attending_teams, :class_name => 'EventTeam', :select => 'DISTINCT team_id', :conditions => 'team_id IS NOT NULL'

  accepts_nested_attributes_for :event_teams

  has_attached_file :logo, :styles => {:default => '61x24#'}

  after_save :create_matches

  private

  def create_matches
    event_teams.group_by(&:round).each do |round, round_teams|
      round_teams.each_slice(2) do |event_team_pair|
        if event_team_pair.size == 2
          # Assume we have just created this pair. Therefore, create a match
          if event_team_pair[0].match.nil?
            match = Match.create({
              :team1_id => event_team_pair[0].team_id,
              :team2_id => event_team_pair[1].team_id,
              :start_date => self.start_date,
              :event_id => self.id,
              :category_id => self.category_id,
              :format_id => self.format_id,
              :user_id => self.user_id
            })
            event_team_pair[0].update_attributes({:match_id => match.id})
            event_team_pair[1].update_attributes({:match_id => match.id})
          else
            match = Match.find(event_team_pair[0].match_id)
            match.update_attributes({
              :team1_id => event_team_pair[0].team_id,
              :team2_id => event_team_pair[1].team_id
            })
          end
        end
      end
    end
  end
end
