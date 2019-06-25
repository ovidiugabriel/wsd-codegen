
class CppBackend {
    private static inline var TAB = "    ";
    public var participants : Map<String, Array<Node>>;

    public function new() {
        this.participants = new Map<String, Array<Node>>();
    }

    /** 
        Returns a line that creates a named instance of the given class:
        class_name* object_name = new class_name()
     */
    private function generateCreateInstance(className : String, ?objectName : String = null) : String { 
        if (null == objectName) {
            objectName = className.toLowerCase();
        }
        return '${className}* ${objectName} = new ${className}()';
    }

    /** 
        Generates a named method with the following signature:
        int method()
        and creates body code for interactions with the main participant
     */
    private function generateMainMethod(method : String) : String {
        // TODO: add destructuring mac/ro
        
        var a : Array<String> = method.split("::");
        var mainParticipant = a[0];
        var mainFunc        = a[1];

        var output = "int ${method}() {\n";
        for (node in this.participants[mainParticipant]) {
             output += TAB + this.generate(node);
        }        
        return output + "}\n\n";
    }

    /**
        Generates the entry point of the program, 
        wrapping a call to the main method in the default entry point.
    */
    private function generateEntryPoint(method : String) {
        return "int main(int argc, char* argv[]) {\n" +
                TAB  +  "return ${method}();\n" +
               "}\n\n";
    }

    static public function hasCallParens(s : String) : Bool {
        return ")" == s.charAt(s.length - 1) && s.indexOf("(") != -1;
    }

    public function generate(node : Node) : String {
        return switch (node.type) {
            case "call":
                var msg = if (hasCallParens(node.message)) {
                    node.message;
                } else {
                    node.message + "()";            
                };
            
                node.to.toLowerCase() + '->${msg};\n';

            case "create": 
                generateCreateInstance(node.to) + ";\n";

            case "participant": 
                '#include "${node.message}.h"\n';

            case _: "";
                // throw "Unknown type";
        }
    }
}
