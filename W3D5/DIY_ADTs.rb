 class Stack
    def initialize
      # create ivar to store stack here!
      @stack = []
    end

    def push(el)
      # adds an element to the stack
      @stack << el
    end

    def pop
      # removes one element from the stack
      @stack.pop
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      p @stack[-1]
    end
  end

  class Queue

    def initialize
        @queue = []
    end

    def enqueuq(el)
        @queue << el
    end

    def dequeue
        @queue.shift
    end

    def peek
        @queue[0]
    end
  end

  class Map

    def initialize
        @map = []
    end

    def set(key, value)
        if @map.none? {|ele| ele[0] == key}
            @map << [key, value]
        else
            (0...@map.length).each do |i|
                if @map[i][0] == key
                    @map[i][1] = value
                end
            end
        end
    end

    def get(key)
        (0...@map.length).each do |i|
            if @map[i][0] == key
                return @map[i][1]
            end
        end
    end

    def [](arr)
        @map[arr[0]][arr[1]]
    end

    def delete(key)
        (0...@map.length).each do |i|
            if @map[i][0] == key
                @map.delete_at(i)
                return true
            end
        end
        false
    end

    def show
        @map
    end
  end