function doItNow() {
window.by_epic = {};
window.by_sprint = {};
window.all_sprints = [];
window.epic_colors = {};

$('.js-sprint-container').each(
  function() {
    var $sprint = $(this);
    var sprint_name = $sprint.find('.js-sprint-header .ghx-name').html();
    if (!window.by_sprint[sprint_name]) {
      window.all_sprints.push(sprint_name);
      window.by_sprint[sprint_name] = {};
    }
    $sprint.find('.ghx-label-single').each(
      function() {
        var epic_name = $(this).html();
        window.epic_colors[epic_name] = $(this).css('background-color');
        if(epic_name) {
          if (!window.by_epic[epic_name]) {
            window.by_epic[epic_name] = {};
          }
          if (!window.by_sprint[sprint_name][epic_name]) {
            window.by_sprint[sprint_name][epic_name] = 0;
          }
          if (!window.by_epic[epic_name][sprint_name]) {
            window.by_epic[epic_name][sprint_name] = 0;
          }
          window.by_sprint[sprint_name][epic_name]++;
          window.by_epic[epic_name][sprint_name]++;
        }
      }
    );
  }
);

function buildEpicTable(epics, sprints, epics_by_sprint) {
  var html = "<table border=1 cellpadding=10 cellspacing=0>";
  html += "<tr><td>epic</td>";
  for (var i in sprints) {
    html += "<td>" + sprints[i] + "</td>";
  }
  html += "</tr>";
  for (var epic_name in epics) {
    html += "<tr><td>" + epic_name + "</td>";
    for (var i in sprints) {
      var sprint_name = sprints[i];
	  if (epics_by_sprint[sprint_name][epic_name]) {
        html += "<td style='background-color:" + window.epic_colors[epic_name] + ";'>" + "&nbsp;" + "</td>";
	  } else {
        html += "<td>" + "&nbsp" + "</td>";
	  }
    }
    html += "</tr>";
  }
  html += "</table>";
  return html;
}

window.hack_html = buildEpicTable(window.by_epic, window.all_sprints, window.by_sprint);

window.closeGant = function() {
    $('.hack-gant').hide();
};

$('body').append("<div class='hack-gant' style='padding:10px;position:absolute;z-index:1000;top:10px;left:10px;background-color:white; border: 1px solid black;'><h2><a onClick='window.closeGant();'>close</a></h2>"+window.hack_html+"</div>");
};
doItNow();
