
# Finish occurrence {finish}

if matches = /^\s*(.*)\s*(-->-)\s*(.*)\s*:\s*(.*)\s*$/.match(line)
    n = [ matches[2], matches[1], matches[3], matches[4] ]

# Return message {return}

elsif matches = /^\s*(.*)\s*(-->)\s*(.*)\s*:\s*(.*)\s*$/.match(line)
    n = [ matches[2], matches[1], matches[3], matches[4] ]
    
# Start occurrence {start}
elsif matches = /^\s*(.*)\s*(->\+)\s*(.*)\s*:\s*(.*)\s*$/.match(line)
    n = [ matches[2], matches[1], matches[3], matches[4] ]

# Object creation message {create}    
elsif matches = /^\s*(.*)\s*(->\*)\s*(.*)\s*:\s*(.*)\s*$/.match(line)
    n = [ matches[2], matches[1], matches[3], matches[4] ]

# (Synchronous) message {call}
elsif matches = /^\s*(.*)\s*(->)\s*(.*)\s*:\s*(.*)\s*$/.match(line)
    n = [ matches[2], matches[1], matches[3], matches[4] ]

elsif matches = /^(destroy)\s+(.*)$/.match(line)
    destroy_node = [ matches[2] ]
    
elsif matches = /^(alt)\s+(.*)$/.match(line)
    alt_node = [ matches[1], matches[2] ]
    
elsif matches = /^(else)\s+(.*)$/.match(line)
    alt_node = [ matches[1], matches[2] ]
    
elsif matches = /^(end)$/.match(line)
    end_node = 1
    
elsif matches = /^(opt)\s+(.*)$/.match(line)
    alt_node = [ matches[1], matches[2] ]

elsif matches = /^(loop)\s+(.*)$/.match(line)
    alt_node = [ matches[1], matches[2] ]
    
end
