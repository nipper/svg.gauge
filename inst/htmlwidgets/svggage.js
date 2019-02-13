HTMLWidgets.widget({

  name: 'svggage',

  type: 'output',

  factory: function (el, width, height) {



    return {

      renderValue: function (x) {
        
        var gauge = Gauge(el, {
          max: x.max,
          // custom label renderer
          label: function (value) {
            return Math.round(value) + "/" + this.max;
          },
          value: x.value,
          // Custom dial colors (Optional)
          color: function (value) {
            if (value < 20) {
              return "#5ee432"; // green
            } else if (value < 40) {
              return "#fffa50"; // yellow
            } else if (value < 60) {
              return "#f7aa38"; // orange
            } else {
              return "#ef4655"; // red
            }
          }
        });

      },

      resize: function (width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});