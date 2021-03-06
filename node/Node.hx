@:enum
abstract NodeType(String) {
    var TYPE_FINISH = "finish";
    var TYPE_RETURN = "return";
    var TYPE_START  = "start";
    var TYPE_CREATE = "create";
    var TYPE_CALL   = "call";
}

class Node {
    
    public var type    : String = null;
    public var from    : String;
    public var to      : String;
    public var message : String;

    public function new(?arrowType : String = null, ?from : String = null, ?to : String = null, 
                        ?message : String = null) 
    {
        if (arrowType != null) {
            var typeNames = {
                "-->-"  :  TYPE_FINISH,
                "-->"   :  TYPE_RETURN,
                "->+"   :  TYPE_START,
                "->*"   :  TYPE_CREATE,
                "->"    :  TYPE_CALL
            };            
            this.type = if (Reflect.hasField(typeNames, arrowType)) {
                Reflect.field(typeNames, arrowType);    
            } else {
                arrowType;
            };
        }

        this.from = from;
        this.to = to;
        this.message = message;
    }
}
