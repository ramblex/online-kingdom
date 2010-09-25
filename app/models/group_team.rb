class GroupTeam < ActiveRecord::Base
  belongs_to :team
  belongs_to :group

  def played
    team.matches.reject {|match| match.group_id != 19 or !match.has_happened}.count
  end

  def won
    team.matches.collect {|match| match.won}.count
  end
end
