var remote_select2 = function (el, url, opts = {}) {
  // var maxSize, url, placeholder;
  // url = $(el).data('url');
  // maxSize = $(el).data('maximumselectionsize') || 5;
  return $(el).select2({
    theme: "bootstrap",
    ajax: {
      url: url,
      delay: 250,
      minimumInputLength: 1,

      data: function (params) {
        console.log('params', params)
        var query = {
          name: params.term,
          q: params.term,
        };
        return query
      },

      processResults: function (data) {
        // Tranforms the top-level key of the response object from 'items' to 'results'
        return {
          results: data
        };
      },

      templateResult: function (data) {
        return data.text;
      }
    }
  });

}

