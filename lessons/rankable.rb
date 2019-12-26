module Rankable
    def thumbs_up
        # @rank = @rank + 1
        self.rank += 1
    end
    
    def thumbs_down
        self.rank -= 1
    end

    def hit?
        true
    end

    #this overrides the default method for this function
    def <=> (other)
        self.rank <=> @rank  
        end
end