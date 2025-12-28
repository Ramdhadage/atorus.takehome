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
        console.log('Column types:', colTypes);
        el.innerText = "";
        hotInstance = new Handsontable(el, {
          data: currentData,
          colHeaders: colHeaders,
           className: 'htCenter',
          rowHeaders: false,
          columnSorting: true,
          contextMenu: ['undo', 'redo'],
          manualColumnResize: true,
          stretchH: 'all',
           columns: originalColHeaders.map((colName) => {
            const colType = colTypes[colName];
            const config = { data: colName };

            if (colName === 'MODEL') {
              config.readOnly = true;
            }
            switch(colType) {
              case 'numeric':
                config.type = 'numeric';
                config.numericFormat = {
                  pattern: '0,0.00'
                };
                break;

              case 'integer':
                config.type = 'numeric';
                config.numericFormat = {
                  pattern: '0,0'
                };
                break;

              case 'character':
                config.type = 'text';
                break;

             case 'logical':
                config.type = 'checkbox';
                break;
             case 'factor':
                config.type = 'select';
                config.selectOptions = [...new Set(x.data[colName])];
                break;
            default:
                config.type = 'text';
            }
            return config;
          }),
          licenseKey: 'non-commercial-and-evaluation',
        })

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
