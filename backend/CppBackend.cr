
class CppBackend
    TAB = "    "

    def generate_create_instance(class_name : String, object_name : String = nil) : String
        object_name = class_name.downcase() if !object_name
        return "#{class_name}* #{object_name} = new #{class_name}()"
    end
    
    def generate_main_method(method : String) : String       
        main_participant, main_func = method.split("::")
        
        output = "int #{method}() {\n"
        @@participants[main_participant].each { |node|
            output += TAB + generate(node)
        }
        output += "}\n\n"
    end

    def create_entry_point(method : String) : String
        output = "int main(int argc, char* argv[]) {\n"
        output += TAB + "return #{method}();\n"
        output += "}\n\n"
    end

    def generate(node : Node) : String
        case @type
            when "call"
                msg = node.message
                m = msg.chars()
                msg += "()" if ")" != m[ m.size()-1 ] && msg.index("(") === nil
                return node.to.downcase() + "->" + msg + ";\n"

            when "create"
                generate_create_instance(node.to) + ";\n"

            when "participant"
                "#include \"#{node.message}.h\"\n"
        end
    end
end