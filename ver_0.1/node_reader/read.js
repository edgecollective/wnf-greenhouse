/*const SerialPort = require('serialport')
const port = new SerialPort('/dev/ttyACM0', function (err) {
  if (err) {
    return console.log('Error: ', err.message)
  }
})

// Read data that is available but keep the stream in "paused mode"
port.on('readable', function () {
  console.log('Data:', port.read())
})
*/
const request = require('request')
const SerialPort = require('serialport')
const Readline = require('@serialport/parser-readline')
const port = new SerialPort('/dev/ttyACM0')

const parser = port.pipe(new Readline({ delimiter: '\r\n' }))
//parser.on('data', console.log)

parser.on('data', function (data) {
  var items = data.split(';');
  //console.log(items);
  var s = items[0];
  var sig = items[1];
  var so = JSON.parse(s);
  //console.log(so.t);
  var sigo = JSON.parse(sig);
  //console.log(sigo.RSSI)
  var temp = so.t;
  var humid = so.h;
  var press = so.p;
  var rssi = sigo.RSSI;
  var ts = Math.round((new Date()).getTime() / 1000);
  console.log(ts, temp,humid,press,rssi);
  //console.log('data received: ' + data)


  //send data to local server
  request.post(
    'http://localhost:8000/api/endpoint',
    {
      json: {
        temperature: temp,
        humidity:humid,
        pressure:press
      }
    },
    (error, res, body) => {
      if (error) {
        console.error(error)
        return
      }
      console.log(`statusCode: ${res.statusCode}`)
      console.log(body)
    }
  )



})


//const lineStream = port.pipe(new Readline())