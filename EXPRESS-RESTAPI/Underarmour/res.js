'use strict';

exports.ok = function(requaetPage, values, res) {
  //var data = {
      //'status': 200,
      //'values': values
  //};

  console.log('- '+ requaetPage +' => Status: ' + 200);

  res.json(values);
  res.end();
};