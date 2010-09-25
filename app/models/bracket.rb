class Bracket < ActiveRecord::Base
  has_many :event_teams, :dependent => :destroy
  belongs_to :event
  accepts_nested_attributes_for :event_teams
  after_save :create_matches

private
  def create_matches
    event_teams.group_by(&:round).each do |round, round_teams|
      round_teams.sort_by(&:position).each_slice(2) do |event_team_pair|
        if event_team_pair.size == 2
          # Assume we have just created this pair. Therefore, create a match
          if event_team_pair[0].match.nil?
            match = Match.create({
              :team1_id => event_team_pair[0].team_id,
              :team2_id => event_team_pair[1].team_id,
              :start_date => event.start_date,
              :event_id => event.id,
              :category_id => event.category_id,
              :format_id => event.format_id,
              :user_id => event.user_id
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
