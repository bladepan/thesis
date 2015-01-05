## server centric frameworks
- H. Chen and R. Cheng. ZK: Ajax without the Javascript Framework. Apress, Berkely, CA, USA, 2007.
- J. Ousterhout and E. Stratmann. Managing state for Ajax- driven web components. In Proceedings of the 2010 USENIX conference on Web application development, WebApps’10, page 7, Berkeley, CA, USA, 2010. USENIX Association.


session token rfc
https://www.ietf.org/rfc/rfc2109.txt



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
