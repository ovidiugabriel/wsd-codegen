
# a tab is 4 spaces
TAB = '    '

participants = Array(Node).new()
sections = Hash { 
    "header" => Array(Node).new(), 
    "code"   => Array(Node).new() 
}

def parse_line(line : String)
    node = nil

    # Finish occurrence {finish}

    if match = /^\s*(.*)\s*(-->-)\s*(.*)\s*:\s*(.*)\s*$/.match(line)
        node = new Node( match[2], match[1], match[3], match[4] );

    # Return message {return}

    elsif match = /^\s*(.*)\s*(-->)\s*(.*)\s*:\s*(.*)\s*$/.match(line)
        node = new Node( match[2], match[1], match[3], match[4] )

    # Start occurrence {start}
    elsif match = /^\s*(.*)\s*(->\+)\s*(.*)\s*:\s*(.*)\s*$/.match(line)
        node = new Node( match[2], match[1], match[3], match[4] )

    # Object creation message {create}    
    elsif match = /^\s*(.*)\s*(->\*)\s*(.*)\s*:\s*(.*)\s*$/.match(line)
        node = new Node( match[2], match[1], match[3], match[4] )

    # (Synchronous) message {call}
    elsif match = /^\s*(.*)\s*(->)\s*(.*)\s*:\s*(.*)\s*$/.match(line)
        node = new Node( match[2], match[1], match[3], match[4] )

    elsif match = /^(destroy)\s+(.*)$/.match(line)
        node = new DestroyNode( match[2] )

    elsif match = /^(alt)\s+(.*)$/.match(line)
        node = new AltNode( match[1], match[2] )

    elsif match = /^(else)\s+(.*)$/.match(line)
        node = new AltNode( match[1], match[2] )

    elsif match = /^(end)$/.match(line)
        node = new EndNode();

    elsif match = /^(opt)\s+(.*)$/.match(line)
        node = new AltNode( match[1], match[2] )

    elsif match = /^(loop)\s+(.*)$/.match(line)
        node = new AltNode( match[1], match[2] )

    elsif match = /^(participant)\s+(.*)$/.match(line)
        participant = new Node( matches[1], null, null, matches[2] )
        sections["header"].push(participant)
        participants[matches[2]] = []

    else
        # The line is not recognized by the language

    end

    if node
        participants[node.from].push(node)
    end
end

backend = CppBackend.instance()

# Generate header code

sections["header"].each { |hdr_node|
    puts backend.generate(hdr_node)
}
puts "" # newline
