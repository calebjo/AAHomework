class LRUCache
    def initialize(size)
        @size = size
        @underlying_array = []
    end

    def count
        @underlying_array.length
    end

    def add(el)
        # adds element to cache according to LRU principle
        if @underlying_array.include?(el)                   # delete duplicate element and add again   
            @underlying_array.delete(el)
            @underlying_array << el
        elsif self.full?                                    # remove oldest element if full, then add el
            @underlying_array.shift
            @underlying_array << el
        else                                                # delete duplicate element, then add it again                      
            @underlying_array << el
        end
    end

    def show
        # shows the items in the cache, with the LRU item first
        p @underlying_array
    end

    private
    # helper methods go here!
    def full?
        # returns true if the cache is full, false if not
        count >= @size ? true : false
    end
end

# To improve time complexity of the #add method, we could use a hash map 

johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

johnny_cache.count # => returns 2

johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})


johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]