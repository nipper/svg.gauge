HTMLWidgets.widget({

  name: 'svggage',

  type: 'output',

  factory: function(el, width, height) {

  var cpuGauge = Gauge(el, {
    max: 100,
    // custom label renderer
    label: function(value) {
      return Math.round(value) + "/" + this.max;
    },
    value: 50,
    // Custom dial colors (Optional)
    color: function(value) {
      if(value < 20) {
        return "#5ee432"; // green
      }else if(value < 40) {
        return "#fffa50"; // yellow
      }else if(value < 60) {
        return "#f7aa38"; // orange
      }else {
        return "#ef4655"; // red
      }
    }
});

    return {

      renderValue: function(x) {

        // TODO: code to render the widget, e.g.
       cpuGauge.setValue(x.value)

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
