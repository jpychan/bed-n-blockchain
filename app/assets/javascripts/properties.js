jQuery(document).ready(function($) {

  var start, end, bookedDates;

  var dateFormat = "mm-dd-yy";

  $.ajax('/properties/1/bookings/dates/', {
    success: function(data) {
      bookedDates = data;
      start = $("#start_date_datepicker").datepicker({
        dateFormat: dateFormat,
        beforeShowDay: disableBookedDates}).on( "change", function() {
        startDate = getDate(this);
        maxEndDate = calculateMaxEndDate(startDate);
        end.datepicker( "option", "minDate", getDate(this));
        end.datepicker("option", "maxDate", maxEndDate)
      });
      end = $( "#end_date_datepicker" ).datepicker({
        dateFormat: dateFormat,
        beforeShowDay: disableBookedDates
      }).on( "change", function() {
        endDate = getDate(this);
        minStartDate = calculateMinStartDate(endDate);
        start.datepicker( "option", "maxDate", endDate);
        start.datepicker( "option", "minDate", minStartDate);
      });
    }
  });

  function calculateMinStartDate(date){
    // look at the bookedDates, do any of them fall before the end date?
    var bookedBeforeEndDate = false;
    var lastBookedDateBeforeEndDate;

    var today = new Date();

    for (var i = 0; i < bookedDates.length; i++) {
      bookedDate = new Date(bookedDates[i]);
      if (bookedDate < date) {
        bookedBeforeEndDate = true;
        if (!lastBookedDateBeforeEndDate) {
          lastBookedDateBeforeEndDate = bookedDate;
        }
        else if (lastBookedDateBeforeEndDate < bookedDate) {
          lastBookedDateBeforeEndDate = bookedDate;
        }
      }
    }

    if (bookedBeforeEndDate) {
      return lastBookedDateBeforeEndDate;
    }
    else {
      return today;
    }
  }

  function calculateMaxEndDate(date) {
    // look at the bookedDates, do any of them fall after the start date?
    var bookedAfterStartDate = false;
    var nextBookedDate;
    var today = new Date();

    for (var i = 0; i < bookedDates.length; i++) {
      bookedDate = new Date(bookedDates[i]);
      if (bookedDate > date) {
        bookedAfterStartDate = true;
        if (!nextBookedDate) {
          nextBookedDate = bookedDate;
        }
        else if (nextBookedDate < bookedDate) {
          nextBookedDate = bookedDate;
        }
      }
    }

    if (bookedAfterStartDate) {
      return nextBookedDate;
    }
    else {
      var day = today.getDate();
      var month = today.getMonth(); //Be careful! January is 0 not 1
      var year = today.getFullYear();

      return new Date(year + 1, month, day)
    }
  }

  function checkDateRange(date, datePicker) {
    if (start.val() == '' ||  end.val() == '') {
      return;
    }
    else {

    }
  }

  function getDate( element ) {
    var date;
    try {
      date = $.datepicker.parseDate( dateFormat, element.value );
    } catch( error ) {
      date = null;
    }

    return date;
  }

  function disableBookedDates (date) {
    var dateString = jQuery.datepicker.formatDate('yy-mm-dd', date);
    return [bookedDates.indexOf(dateString) == -1];
  }
});