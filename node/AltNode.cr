
require "./Node"

class AltNode < Node
    def initialize(type, message)
        super(type, nil, nil, message)
    end
end
