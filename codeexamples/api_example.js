// constructor of an API class 
function APIClass(internalObj){
    // 1. hide internal object from application code
    // 2. weak reference to the internal object
    var _internalObj = weak(internalObj);
    // define API methods
    this.someMethod = function(){
        // permission checking code
        checkPermission(currentUser, 'someMethod');
        //3. proxy method invocation
        _internalObj.someMethod();
    };
}