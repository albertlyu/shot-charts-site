$(function() {
    $('#shotchart').highcharts({
        chart: {
            type: 'scatter',
            plotBackgroundImage: 'http://dl.dropboxusercontent.com/s/lfd3doj34oa3b3c/court.png'
        },
        title: {
            text: ''
        },
        xAxis: {
            title: {
                enabled: true,
                text: 'x'
            },
            min: -30,
            max: 30,
            startOnTick: true,
            endOnTick: true,
            showLastLabel: true
        },
        yAxis: {
            title: {
                text: 'y'
            },
            min: -1,
            max: 30,
            gridLineWidth: 0,
            lineWidth: 1
        },
        legend: {
            layout: 'vertical',
            align: 'left',
            verticalAlign: 'top',
            x: 55,
            y: 0,
            floating: true,
            backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF',
            borderWidth: 1
        },
        plotOptions: {
            scatter: {
                marker: {
                    radius: 5,
                    states: {
                        hover: {
                            enabled: true,
                            lineColor: 'rgb(100,100,100)'
                        }
                    }
                },
                states: {
                    hover: {
                        marker: {
                            enabled: false
                        }
                    }
                },
                turboThreshold: 2000,
            }
        },
        series: [{
            name: 'Made Shots',
            color: 'rgba(119, 152, 191, .5)',
            data: (function () {

                var madeArray = [];
                $.map(made, function(shot, index){
                    madeArray.push({
                        x: shot.x_coord,
                        y: shot.y_coord,
                        name: shot.details,
                    });
                });
                
                console.log(madeArray);
                return madeArray;
            })()
        }, {
            name: 'Missed Shots',
            color: 'rgba(223, 83, 83, .5)',
            data: (function () {

                var missArray = [];
                $.map(miss, function(shot, index){
                    missArray.push({
                        x: shot.x_coord,
                        y: shot.y_coord,
                        name: shot.details,
                    });
                });
                
                console.log(missArray);
                return missArray;
            })()
        }],
        tooltip: {
            //headerFormat: '<b>{series.name}</b><br>',
            //pointFormat: '({point.x}, {point.y})',
            formatter: function() {
                return this.point.name;
            }
        }
    });
});
