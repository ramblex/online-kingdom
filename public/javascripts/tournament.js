var attributes = 'bracket_event_teams_attributes_';
var position = $(".team").size();

function team_input(id, col, value) {
  return '<input id="'+attributes+id+'_position" name="bracket[event_teams_attributes]['+id+']['+col+']" type="hidden" value="'+value+'">';
}

// Add a team to the knockout tree. Return true if another team slot needs to be added
// to the tree in order to make it complete.
// Expects tree to be in #tournament and the code for each team to be in #team-select
// @param round Round number to add a team to
function add_team() {
  var round = 1;
  while (true) {
    // div containing matches from current round
    var current = "#round-"+round;
    // Generate a large unique ID for the event team
    var id = Math.random().toString().split(".")[1];
    // HTML to insert for each team
    var team_html = '<div class="team undo"><select id="'+attributes+id+'" name="bracket[event_teams_attributes]['+id+'][team_id]">'+
      $("#team-select select").html()+
      '</select></div>'
      +team_input(id, 'round', round)
      +team_input(id, 'position', position);

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
