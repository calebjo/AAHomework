class Stack
    attr_reader :stack_arr

    def initialize
      @stack_arr = []
    end

    def push(el)
      stack_arr.push(el)
    end

    def pop
        stack_arr.pop
    end

    def peek
        stack_arr.last
    end
end


class Queue
    attr_reader :queue_arr

    def initialize
      @queue_arr = []
    end
  
    def enqueue(el)
      queue_arr.push(el)
      el
    end
  
    def dequeue
      queue_arr.shift
    end
  
    def peek
      queue_arr.first
    end
end

# unfinished
class Map
    attr_reader :map_arr

    def initialize
      @map_arr = []
    end
  
    def set(key, value)
    end
  
    def get(key)
    end
  
    def delete(key)
    end
  
    def show
    end
     
  end