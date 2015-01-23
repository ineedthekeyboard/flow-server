###Needed Assets###
express = require('express')
mongoose = require('mongoose')
bodyParser = require('body-parser')
js2xmlparser = require('js2xmlparser')
Bar = require('./models/bar')

app = express()

mongoose.connect('mongodb://localhost:27017/bars');

app.use(bodyParser.urlencoded({
  extended: true
}));

port = process.env.PORT || 8080

###define router and routes###
router = express.Router()
barsRoute = router.route('/bars')
barRoute = router.route('/bars/:bar_id')

###dummy route###
router.get('/', (req,res) ->
  res.json({message: 'Server is working properly'}))

###Bar Routes###

###Add a new bar###
barsRoute.post((req,res)->
  bar = Bar()
  bar.name = "Unicorn"
  bar.rating = 9
  bar.address = "Hidden avenue 119 seattle wa"
  bar.latitude = 94.523
  bar.longitude = 65.233
  bar.hours.monday = "8am"
  bar.hours.tuesday = "8am"
  bar.hours.wednesday = "8am"
  bar.hours.thursday = "8am"
  bar.hours.friday = "8am"
  bar.hours.saturday = "8am"
  bar.hours.sunday = "8am"
  bar.menu.item.name = "Holy Tacos"
  bar.menu.item.cost = 9999.99
  bar.typeification.chill = 9
  bar.typeification.dance = 9
  bar.typeification.date = 9

  bar.save((er)->
    res.send(er) if er
    res.json({message: 'A New Bar was added', data:bar})))

###Get All Bars###
barsRoute.get((req,res)->
  Bar.find((err,bars)->
    res.send(err) if (err)
    ###res.json(bars)###
    res.set('Content-Type', 'text/xml')
    res.send(js2xmlparser("Bar", JSON.stringify(bars)))))

###Get a specific bar###
###barRoute.get((req,res)->
  Bar.findById(req.params.bar_id,(err,bar)->
    res.send(err) if err
    res.json(bar)))###


app.use('/api',router)
app.listen(port)
console.log('Flow Server Started on port: ' + port)