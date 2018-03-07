
require "./Node"

class DestroyNode < Node
    def initialize(to : String)
        super("destroy", nil, to, "destroy")
    end
end
