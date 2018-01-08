var server = require('./server');
var dataSource = server.dataSources.mysql;
var models = ['Category', 'OrderDetail', 'Order', 'Product'];
dataSource.isActual(models, function(err, actual) {
  if (!actual) {
    dataSource.autoupdate(models, function(err, result) {
      for (var model in models) {
        dataSource.discoverModelProperties(model, function(err, props) {
          console.log(props);
        });
      }
    });
  }
});
