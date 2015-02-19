________

### dnode

does not serialize methods in prototype

dnode works pretty much like this

host side

```javascript
// send object 

obj; // the object you going to send
id = callbacks.local.length // callbacks is per connection
callbacks.local[id] = obj;

```

client side

```javascript

obj = receive() // create a new obj from received message
id // id is the id of obj assigned in host side
callbacks.remote[id] = weak(obj, function(id){
    cull(id)
    // send a cull message to host side to delete the obj from local map
})

```

So, it would not recognize the origin of the object or whether a object is a proxy, so there are more roundtrips than our system.



```javascript
// process B

obj = receiveFrom(C) // the object is from process C

send(obj, processA) // send it to process A

//process A
obj = receiveFrom(B)

obj.doSomething() // it will first send requests to B, then B sends to C, then C -> B -> A

// process C
localobj 
obj = receiveFrom(B) // obj is originally from C's localobj
localobj === obj // evaluates to false
obj.doSomething() // C-> B -> C [acutally ivoke] -> B -> C

```

### network objects

ftp://ftp.hpl.hp.com/gatekeeper/pub/DEC/SRC/research-reports/SRC-116.pdf

only method invocation is supported

```
A client cannot directly read or write the data fields of a network object
to which it holds a reference, it can only invoke its methods. A reference in
the client program actually points to a surrogate object, whose methods perform
remote procedure calls to the owner, where the corresponding method
of the concrete object is invoked. There is at most one surrogate for an
object in a process, and all references in the process point to that surrogate.
```

sequence number is adopted to counter duplicate clean, dirty messages or out of order messages caused by unreliable network

```
Dealing with communication failures requires us to keep further information
on client processes. Even with a reliable transport, failures and
multiple threads may cause calls to be delivered out of order, as described
in section 2.3. To deal with this, a sequence number is attached to each clean
or dirty call. The sequence number must increase with each new operation
from the client. (Some authors use the term \timestamp" to refer to this
sort of sequence number.) Let seqno(O, P) be the largest sequence number
seen at O's owner on a clean or dirty call for object O from process P. An
incoming operation will be performed only if its sequence number exceeds
this value; otherwise it has no effect.
```


Dealing with race condition between a clean call to the last reference and a on-going new reference, the argument is somehow unclear : what if P is sending to multiple clients.

It would be easier to just write dirtySet first

```
To prevent this scenario, we make sure that O.dirtySet remains nonempty
while O is being transmitted. When the sending process P is O's
owner, this is accomplished by putting P into O.dirtySet until an acknowledgment from Q indicates that the reference has been received. S
```

