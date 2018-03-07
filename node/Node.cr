
class Node
    TYPE_FINISH = "finish"
    TYPE_RETURN = "return"
    TYPE_START  = "start"
    TYPE_CREATE = "create"
    TYPE_CALL   = "call"

    def initialize(type : String, from : String = nil, to : String = nil, message : String = nil)
        if type
            type_names = {
                "-->-"  =>  TYPE_FINISH,
                "-->"   =>  TYPE_RETURN,
                "->+"   =>  TYPE_START,
                "->*"   =>  TYPE_CREATE,
                "->"    =>  TYPE_CALL
            }
            @type = type_names.has_key?(type) ? type_names[type] : type
        end

        @from = from       if from
        @to = to           if to
        @message = message if message
    end
end
