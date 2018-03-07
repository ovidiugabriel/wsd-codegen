
require "./Node"

class DestroyNode < Node
    def initialize(to)
        super("destroy", nil, to, "destroy")
    end
end
