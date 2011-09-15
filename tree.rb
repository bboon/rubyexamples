class Tree
   
    # define attibutes accessor means getter and setter 
    attr_accessor :children, :node_name, :node_value
    
    def initialize (name, value, children=[]) 
       @children = children
       @node_name = name
       @node_value = value   
    end

    def visit_all(&block)
       # call visit for the block itself
       visit &block
       # also loop through children (recursive part)
       children.each {|c| c.visit_all &block} 
    end
    
    def visit(&block)
	# call given block code on this node        
	block.call self 
    end   

end


ruby_tree = Tree.new("Ruby", 23, [Tree.new("Reia", 100), Tree.new("McRuby", 1000)])

puts "visiting a node"
ruby_tree.visit{ |node| puts node.node_name, node.node_value }

puts
puts
puts "visiting node plus children"
ruby_tree.visit_all{ |node| puts node.node_name, node.node_value }


ruby_tree_deep = Tree.new("Ruby", 23, [Tree.new("Reia", 100), Tree.new("McRuby", 1000, [Tree.new("MacRubyDeep1", 1001), Tree.new("MacRubyDeep2", 1002)])])

puts
puts
puts "visiting deep tree plus children"
ruby_tree_deep.visit_all{ |node| puts node.node_name, node.node_value }    

    
