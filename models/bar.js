// Generated by CoffeeScript 1.8.0
(function() {
  var Bar, mongoose;

  mongoose = require('mongoose');

  Bar = new mongoose.Schema({
    name: String,
    rating: Number,
    address: String,
    latitude: Number,
    longitude: Number,
    hours: {
      monday: String,
      tuesday: String,
      wednesday: String,
      thursday: String,
      friday: String,
      saturday: String,
      sunday: String
    },
    menu: {
      item: {
        name: String,
        cost: Number
      }
    },
    typeification: {
      chill: Number,
      dance: Number,
      date: Number
    }
  });

  module.exports = mongoose.model('Bar', Bar);

}).call(this);

//# sourceMappingURL=bar.js.map
