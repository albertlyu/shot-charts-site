function readData(file, heatmap) {
	d3.csv(file, function(plays) {
		rows = plays;
		if (!--remaining) mapCoords();
	});
}

function mapCoords(file, team, heatmap) {
	d3.csv(file, function(plays) {

		var home = file.substring(file.search("_")+1, file.lastIndexOf("_"));
		var away = file.substring(file.lastIndexOf("_")+1, file.search(".csv"));
		var width = heatmap.get("width");
		var height = heatmap.get("height");
		
		for (var i in plays) {
			// Only push plays for which x,y coords exist
			if (plays[i]["x-coord"]!=="" && plays[i]["y-coord"]!=="") {
				var xcoord = (+plays[i]["x-coord"])*width/50+width/2;
				var ycoord = (+plays[i]["y-coord"]+4)*height/94;

				// Change coordinates for team to other half court
				if (plays[i]["player-team-alias-1"].toUpperCase()!==team.toUpperCase()) {
					//xcoord = -xcoord + width;
					ycoord = -ycoord + height;
				}
				xcoord = -xcoord + width;

				if (plays[i]["x-coord"]===0 && plays[i]["y-coord"]===0) {
					heatmap.store.addDataPoint(xcoord, ycoord, [10]);
				} else {
					heatmap.store.addDataPoint(xcoord, ycoord, [10]);
				}
			}
		}
	});
}