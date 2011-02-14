class GroupTeam < ActiveRecord::Base
  belongs_to :team
  belongs_to :group

  def played
    Match.count(:conditions => ["(team1_id=? OR team2_id=?) AND group_id=? AND start_date < ?", 
        team.id, team.id, group.id, DateTime.now])
  end

  def won
    Match.count(:conditions => ["( (team1_id=? AND team1_score > team2_score) OR (team2_id=? AND team1_score < team2_score)) AND group_id=? AND start_date < ?",
        team.id, team.id, group.id, DateTime.now])
  end

  def drawn
    Match.count(:conditions => ["( (team1_id=? AND team1_score = team2_score) OR (team2_id=? AND team1_score = team2_score)) AND group_id=? AND start_date < ?",
        team.id, team.id, group.id, DateTime.now])
  end

  def lost
    Match.count(:conditions => ["( (team1_id=? AND team1_score < team2_score) OR (team2_id=? AND team1_score > team2_score)) AND group_id=? AND start_date < ?",
        team.id, team.id, group.id, DateTime.now])
  end

  def points
    (won * 3) + drawn
  end
end
