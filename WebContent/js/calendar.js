$(document).ready(function () {
    /* initialize the external events
            -----------------------------------------------------------------*/

    $('#external-events div.external-event').each(function () {

        // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
        // it doesn't need to have a start or end
        var eventObject = {
            title: $.trim($(this).text()) // use the element's text as the event title
        };

        // store the Event Object in the DOM element so we can get to it later
        $(this).data('eventObject', eventObject);

        // make the event draggable using jQuery UI
        $(this).draggable({
            zIndex: 999,
            revert: true, // will cause the event to go back to its
            revertDuration: 0 //  original position after the drag
        });

    });

    /* initialize the calendar
            -----------------------------------------------------------------*/

    var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();

    $('#calendar').fullCalendar({
        header: {
            left: '',
            center: 'prev title next',
            right: 'today,month,agendaWeek,agendaDay'
        },
        buttonText: {
            prev: "<span class='fa fa-angle-left'></span>",
            next: "<span class='fa fa-angle-right'></span>",
            prevYear: "<span class='fc-text-arrow'>&laquo;</span>",
            nextYear: "<span class='fc-text-arrow'>&raquo;</span>",
            today: 'today',
            month: 'month',
            week: 'week',
            day: 'day'
        },
        editable: true,
        droppable: true,
        drop: function (date, allDay) { // this function is called when something is dropped

            // retrieve the dropped element's stored Event Object
            var originalEventObject = $(this).data('eventObject');

            // we need to copy it, so that multiple events don't have a reference to the same object
            var copiedEventObject = $.extend({}, originalEventObject);

            // assign it the date that was reported
            copiedEventObject.start = date;
            copiedEventObject.allDay = allDay;

            // render the event on the calendar
            // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
            $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);

            // is the "remove after drop" checkbox checked?
            if ($('#drop-remove').is(':checked')) {
                // if so, remove the element from the "Draggable Events" list
                $(this).remove();
            }

        },
        events: [{
            title: 'All Day Event',
            start: new Date(y, m, 1)
                }, {
            title: 'Attend Meeting',
            start: new Date(y, m, d - 5),
            end: new Date(y, m, d - 3)
                }, {
            title: 'Click for Google',
            start: new Date(y, m, 23),
            end: new Date(y, m, 24),
            url: 'http://google.com/'
                }]
    });

});
