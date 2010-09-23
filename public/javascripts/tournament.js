var position = 0;
// Add a team to the knockout tree. Return true if another team slot needs to be added
// to the tree in order to make it complete.
// Expects tree to be in #tournament and the code for each team to be in #team-select
// @param round Round number to add a team to
function add_team() {
  var round = 1;
  while (true) {
    // div containing matches from current round
    var current = "#round-"+round;
    // HTML to insert for each team
    var team_html = '<div class="team undo">'+$("#team-select").html()+'</div><input id="event_event_teams_attributes__position" name="event[event_teams_attributes][][position]" type="hidden" value="'+position+'"><input id="event_event_teams_attributes__position" name="event[event_teams_attributes][][round]" type="hidden" value="'+round+'">';

    if ($(current).length == 0) {
      $("#tournament").append('<div class="tournament-round undo" id="round-'+round+'"></div>');
    }

    position += 1;
    // Here we may either need to complete a match or start another one.
    if ($(current+' .team').length % 2 != 0) {
      $(current+' .match').last().append(team_html);
    } else {
      $(current).append('<div class="match undo">'+team_html+'</div>');
      break;
    }
    round += 1;
  }
}

$('#add-match').click(function() {
  add_team();
  add_team();
  return false;
});
