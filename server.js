//#ef LIBRARIES
var express = require('express');
var app = express();
var path = require('path');
var timesyncServer = require('timesync/server');
var httpServer = require('http').createServer(app);
io = require('socket.io').listen(httpServer);
const fs = require('fs');

//#endef END LIBRARIES

//#ef HTTP SERVER
const PORT = process.env.PORT || 5000
httpServer.listen(PORT, () => console.log(`Listening on ${ PORT }`));
//#endef END HTTP SERVER

//#ef SERVE STATIC FILES THROUGH EXPRESS
app.use(express.static(path.join(__dirname, '/public')));
app.get('/', function(req, res) {
  res.sendFile(path.join(__dirname, '/public/pieces/scjs/scjs.html'));
});
//#endef END SERVER STATIC FILES

//#ef TIMESYNC SERVER
app.use('/timesync', timesyncServer.requestHandler);
//#endef END TIMESYNC SERVER

//#ef OSC.JS
var osc = require("osc");

var udpPort = new osc.UDPPort({
    // This is the port we're listening on.
    localAddress: "127.0.0.1",
    localPort: 57121,

    // This is where sclang is listening for OSC messages.
    remoteAddress: "127.0.0.1",
    remotePort: 57120,
    metadata: true
});

// Open the socket.
udpPort.open();

// Every second, send an OSC message to SuperCollider
setInterval(function() {
    var msg = {
        address: "/hello/from/oscjs",
        args: [
            {
                type: "f",
                value: Math.random()
            },
            {
                type: "f",
                value: Math.random()
            }
        ]
    };

    console.log("Sending message", msg.address, msg.args, "to", udpPort.options.remoteAddress + ":" + udpPort.options.remotePort);
    console.log(msg);
    udpPort.send(msg);
}, 1000);
//#endef OSC.JS


//#ef SOCKET IO
io.on('connection', function(socket) {

  //##ef Stop Broadcast
  socket.on('sf004_stop', function(data) {

    socket.broadcast.emit('sf004_stop_broadcastFromServer', {
      pieceId: pieceId,
    });

    socket.emit('sf004_stop_broadcastFromServer', {
      pieceId: pieceId,
    });

  }); // socket.on('sf004_stop', function(data) END
  //##endef Stop Broadcast

  }); // End Socket IO
//#endef >> END SOCKET IO
