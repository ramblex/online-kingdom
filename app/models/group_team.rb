class GroupTeam < ActiveRecord::Base
  belongs_to :team
  belongs_to :group

  def played
    team.matches.reject {|match| match.group_id != group_id or !match.has_happened}.count
  end

  def won
    team.won.reject {|match| match.group_id != group_id}
  end

  def drawn
    team.drawn.reject {|match| match.group_id != group_id}
  end

  def lost
    team.lost.reject {|match| match.group_id != group_id}
  end

  def points
    (won.count * 3) + drawn.count
  end
end
