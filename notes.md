## server centric frameworks
- H. Chen and R. Cheng. ZK: Ajax without the Javascript Framework. Apress, Berkely, CA, USA, 2007.
- J. Ousterhout and E. Stratmann. Managing state for Ajax- driven web components. In Proceedings of the 2010 USENIX conference on Web application development, WebApps’10, page 7, Berkeley, CA, USA, 2010. USENIX Association.


session token rfc
https://www.ietf.org/rfc/rfc2109.txt



### meteor.js

meteor.js  model-> update in mongodb -> sync in view, the view changes only you make the changes via mongo api

meteor has some dirty checking mechanism, if a function changes 'a' property in session, the view value on 'b' property is not re-calculated

meteor has a simulated db implemenation in local, the Metero.methods are executed in local as well as in server side, meteor only pass parameter of the Metero.methods to the server side, because it believes server can simulate client result by parameter only

inside Metero.methods you should not call any code rely on client side environment, like dom manipulation, jquery, random...

https://www.meteor.com/try/10

```
 any real application needs to control permissions for its data. In Meteor, the best way to do this is by declaring methods. Instead of the client code directly calling insert, update, and remove, it will instead call methods that will check if the user is authorized to complete the action and then make any changes to the database on the client's behalf.
 ...
 If the result from the server comes back and is consistent with the simulation on the client, everything remains as is. If the result on the server is different from the result of the simulation on the client, the UI is patched to reflect the actual state of the server.

With Meteor methods and latency compensation, you get the best of both worlds — the security of server code and no round-trip delay.
```


livedata_connection.js:995 

message protocol

https://github.com/meteor/meteor/blob/devel/packages/ddp/DDP.md

```
The client may provide a randomSeed JSON value. If provided, this value is used to seed pseudo-random number generation. By using the same seed with the same algorithm, the same pseudo-random values can be generated on the client and the server. In particular, this is used for generating ids for newly created documents. If randomSeed is not provided, then values generated on the server and the client will not be identical.
```


data push works like this : server sends 'ping', client response 'pong', then data push begins,

if the web socket reconnects because of timeout, the server pushes all the data to client

when the client commit update to server, the server echos the update back with all fields


to make a data structure reative ready, you need to write some boilerplate code

https://atmospherejs.com/meteor/tracker

```javascript
  ///
  /// Reactive user system
  ///
  userId: function () {
    var self = this;
    if (self._userIdDeps)
      self._userIdDeps.depend();
    return self._userId;
  },
```


live query

https://www.meteor.com/livequery

```
Livequery accomplishes this seemingly impossible feat by connecting to the database as a replication slave, or by setting up a set of database triggers, or using whatever native pubsub functionality the database may have, or in the worst case by polling, depending on what a particular database supports.
```


## line counts

```
4 lines of api support
Pan-MacBookPro:chat4 pan$ cloc chatboot.js index.html js/lib/application.js 
       3 text files.
       3 unique files.                              
       0 files ignored.

http://cloc.sourceforge.net v 1.62  T=0.02 s (143.8 files/s, 10880.5 lines/s)
-------------------------------------------------------------------------------
Language                     files          blank        comment           code
-------------------------------------------------------------------------------
Javascript                       2              9              2            164
HTML                             1              5              2             45
-------------------------------------------------------------------------------
SUM:                             3             14              4            209
-------------------------------------------------------------------------------



Pan-MacBookPro:jqueryChat pan$ cloc chatboot.js index.html js/app.js js/template.js 
       4 text files.
       4 unique files.                              
       0 files ignored.

http://cloc.sourceforge.net v 1.62  T=0.02 s (194.6 files/s, 13961.2 lines/s)
-------------------------------------------------------------------------------
Language                     files          blank        comment           code
-------------------------------------------------------------------------------
Javascript                       3             22              3            221
HTML                             1              2              2             37
-------------------------------------------------------------------------------
SUM:                             4             24              5            258
-------------------------------------------------------------------------------

```

## code size
click app 341bytes 
jquery chat 263K

## memory usage

100 clients

https://www.googledrive.com/host/0B_Ym9nC_RdWxVVpaNE53U1U5UGM/dec30/test1180_data/test1180.md

master max heapUsed 51.14

200 clients

https://www.googledrive.com/host/0B_Ym9nC_RdWxVVpaNE53U1U5UGM/dec30/test1185_data/test1185.md

master max heapUsed 55.85

300 clients

https://www.googledrive.com/host/0B_Ym9nC_RdWxVVpaNE53U1U5UGM/jan03/test1295_data/test1295.md

master max heapUsed 56.56

## network

https://www.googledrive.com/host/0B_Ym9nC_RdWxVVpaNE53U1U5UGM/dec30/test1180_data/test1180.md

100 client, 300*100 chat messages
120000 client events,
4 client events per chat message
152900 server side events,
5.0967 server side events per chat message

every chat room got 1500 message, broadcast dom remove event 1400/50 + 1 = 29 times, 29/300 = 0.0967



# MISC

http://www.tablesgenerator.com/
