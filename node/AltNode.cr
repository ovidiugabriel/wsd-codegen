
require "./Node"

class AltNode < Node
    def initialize(type : String, message : String)
        super(type, nil, nil, message)
    end
end
