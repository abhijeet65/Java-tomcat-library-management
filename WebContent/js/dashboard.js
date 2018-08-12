$(document).ready(function () {

    

    var skycons = new Skycons({
        "color": "#444444"
    });

    var skyconsYellow = new Skycons({
        "color": "#ffb244"
    });

    skycons.set("icon1", Skycons.FOG);
    skycons.set("icon2", Skycons.PARTLY_CLOUDY_DAY);
    skyconsYellow.set("icon3", Skycons.CLEAR_DAY);
    skycons.set("icon4", Skycons.WIND);
    skycons.set("icon5", Skycons.SLEET);
    skycons.set("icon6", Skycons.SNOW);
    skycons.set("icon7", Skycons.WIND);

    skycons.play();
    skyconsYellow.play();

    var green = document.querySelector('.js-switch');
    var switchery = new Switchery(green, {
        color: '#2dcb73'
    });

    window.onload = function () {
        date();
    },
    setInterval(function () {
        date();
    }, 1000);

    function date() {
        var now = moment().format('hh:mm');
        $('.timer').html('<b>' + now + '</b>');
    }

    var today = moment();

    $('.date').text(today.format('ddd, D MMMM YYYY'));

    line = Morris.Area({
        element: 'line',
        data: [
            {
                period: '2000',
                received: 4691,
                sent: 2346
                },
            {
                period: '2001',
                received: 8403,
                sent: 7116
                },
            {
                period: '2002',
                received: 15574,
                sent: 11356
                },
            {
                period: '2003',
                received: 18211,
                sent: 14875
                },
            {
                period: '2004',
                received: 19427,
                sent: 15966
                },
            {
                period: '2005',
                received: 16486,
                sent: 12086
                },
            {
                period: '2006',
                received: 14737,
                sent: 10916
                },
            {
                period: '2007',
                received: 5838,
                sent: 4507
                },
            {
                period: '2008',
                received: 5542,
                sent: 4202
                },
            {
                period: '2009',
                received: 15560,
                sent: 11523
                },
            {
                period: '2010',
                received: 18940,
                sent: 14431
                },
            {
                period: '2011',
                received: 11970,
                sent: 10599
            },
            {
                period: '2012',
                received: 17580,
                sent: 13094
            },
            {
                period: '2013',
                received: 17511,
                sent: 13234
            },
            {
                period: '2014',
                received: 12601,
                sent: 5213
            },
            {
                period: '2014',
                received: 13158,
                sent: 4806
            }
                ],
        xkey: 'period',
        ykeys: ['received', 'sent'],
        hideHover: 'auto',
        labels: ['received', 'sent'],
        fillOpacity: 0.1,
        grid: false,
        axes: false,
        pointSize: 1.5,
        ymin: -8000,
        resize: true,
        lineColors: ['#20aae5', '#bdc3c7'],
        lineWidth: '1'
    });

    function redrawLine () {
        setTimeout(function(){
          line.redraw();
        }, 100);
    }

    $(document).on("click", ".toggle-sidebar", function () {
        redrawLine();
    });

    $(document).on("click", ".site-overlay", function () {
        $(".app").removeClass("small-sidebar");
        redrawLine();
    });

    var phases = [
            [5, 'offline-ui offline-ui-down offline-ui-down-5s', '', ''],
            [3, 'offline-ui offline-ui-down offline-ui-connecting offline-ui-waiting', '5 seconds', '5s'],
            [1, 'offline-ui offline-ui-down offline-ui-connecting offline-ui-waiting', '4 seconds', '4s'],
            [1, 'offline-ui offline-ui-down offline-ui-connecting offline-ui-waiting', '3 seconds', '3s'],
            [1, 'offline-ui offline-ui-down offline-ui-connecting offline-ui-waiting', '2 seconds', '2s'],
            [1, 'offline-ui offline-ui-down offline-ui-connecting offline-ui-waiting', '1 seconds', '1s'],
            [1, 'offline-ui offline-ui-up offline-ui-up-5s', '', '']
        ];

    var nextPhase = function () {
        var phase;


        var offline = $('.offline-ui'),
            content = offline.find('.offline-ui-content');

        phase = parseInt(offline.attr('data-phase'), 10);

        offline.get(0).className = phases[phase][1];
        content.attr('data-retry-in', phases[phase][2]);
        content.attr('data-retry-in-abbr', phases[phase][3]);

        phase = (phase + 1) % phases.length;
        offline.attr('data-phase', phase);

        if (phase === 0) {
            return false;
        }


        setTimeout(function () {
            nextPhase();
        }, phases[phase][0] * 1000);
    };

    nextPhase();
});
