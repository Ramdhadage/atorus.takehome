HTMLWidgets.widget({

  name: 'hotwidget',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {

        // TODO: code to render the widget, e.g.
        currentData = HTMLWidgets.dataframeToD3(x.data);
        const originalColHeaders = x.colHeaders || Object.keys(currentData[0] || {});
        const colHeaders = originalColHeaders.map((header) => header.toUpperCase());
        const colTypes = x.colTypes || {};
        el.innerText = "";
        hotInstance = new Handsontable(el, {
          data: currentData,
          colHeaders: colHeaders,
          rowHeaders: false,
          columnSorting: true,
          contextMenu: ['undo', 'redo'],
          licenseKey: 'non-commercial-and-evaluation',
        })

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
