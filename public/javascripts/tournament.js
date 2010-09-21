var position = 0;
// Add a team to the knockout tree. Return true if another team slot needs to be added
// to the tree in order to make it complete.
// Expects tree to be in #tournament and the code for each team to be in #team-select
// @param round Round number to add a team to
function add_team(round) {
  // div containing matches from current round
  var current = "#round-"+round;
  // HTML to insert for each team
  var team_html = '<div class="team undo">'+$("#team-select").html()+'</div><input id="event_event_teams_attributes__position" name="event[event_teams_attributes][][position]" type="hidden" value="'+position+'">';

  if ($(current).length == 0) {
    $("#tournament").append('<div class="tournament-round undo" id="round-'+round+'"></div>');
  }

  position += 1;
  // Here we may either need to complete a match or start another one.
  if ($(current+' .team').length % 2 != 0) {
    $(current+' .match').last().append(team_html);
    return true;
  } else {
    $(current).append('<div class="match undo">'+team_html+'</div>');
  }
  return false;
}

$("#add-team").click(function() {
  var x = 1;

  // Remove previous add's undo
  $('.undo').removeClass('undo');
  $("#undo").remove();

  while (add_team(x)) {
    x += 1;
  }

  // Add basic undo functionality
  $('#tournament').before('<a href="#" id="undo">Undo</a>');
  $("#undo").click(function() {
    $("#undo").remove();
    $('.undo').remove();
    return false;
  });
  $("#undo").fadeOut(10000);
  return false;
});
