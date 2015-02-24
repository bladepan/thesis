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

needs to protect against failed dirty calls and out of order clean calls.
a failed dirty call could add the client on dirty set even the client failed to create a surrogate, to protect this, sequence number and strong clean calls are used

### Pyro4
https://github.com/irmen/Pyro4/tree/master/examples/autoproxy

needs register as remote object before return
```python
class Factory(object):
    def createSomething(self, number):
        # create a new item
        thing = Thingy(number)
        # connect it to the Pyro daemon to make it a Pyro object
        self._pyroDaemon.register(thing)
        # Return it. Pyro's autoproxy feature turns it into a proxy automatically.
        # If that feature is disabled, the object itself (a copy) is returned,
        # and the client won't be able to interact with the actual Pyro object here.
        return thing
```


support attribute manipulation
https://github.com/irmen/Pyro4/tree/master/examples/attributes

no distribute garbage collection. confirmed by test, *no proper garbage collection*
http://sourceforge.net/p/pyro/mailman/message/3542174/

remote stubs of the same object got the same identity. remote references needs to be registered

https://pythonhosted.org/Pyro4/clientcode.html
```
By default (when not using the pickle serialization protocol), custom classes are serialized into a dict. They are not deserialized back into instances of your custom class. This avoids possible security issues. An exception to this however are certain classes in the Pyro4 package itself (such as the URI and Proxy classes). They are deserialized back into objects of that certain class, because they are critical for Pyro to function correctly.
```


### Druby -- drb

need to define object explicitly using druby when you want it to be created as remote object at the other end in return statement or as method parameters
http://ruby-doc.org/stdlib-1.9.3/libdoc/drb/rdoc/DRb.html
```
Any type of object can be passed as an argument to a dRuby call or returned as its return value. By default, such objects are dumped or marshalled at the local end, then loaded or unmarshalled at the remote end. The remote end therefore receives a copy of the local object, not a distributed reference to it; methods invoked upon this copy are executed entirely in the remote process, not passed on to the local original. This has semantics similar to pass-by-value.

However, if an object cannot be marshalled, a dRuby reference to it is passed or returned instead. This will turn up at the remote end as a DRbObject instance. All methods invoked upon this remote proxy are forwarded to the local object, as described in the discussion of DRbObjects. This has semantics similar to the normal Ruby pass-by-reference.

The easiest way to signal that we want an otherwise marshallable object to be passed or returned as a DRbObject reference, rather than marshalled and sent as a copy, is to include the DRb::DRbUndumped mixin module.
```

needs the programmer to hold reference to objects to prevent them from prematurely garbage collected


### Dbus

http://dbus.freedesktop.org/doc/dbus-specification.html#type-system

http://www.rubydoc.info/gems/ruby-dbus/0.11.0/frames

object name is required for method invocation ?????


### weborb

http://www.themidnightcoders.com/products/weborb-for-rails/faqs.html

calling ruby class from FLEX




