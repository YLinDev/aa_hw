  class LRUCache
    attr_accessor :cache, :max, :time

    def initialize(num)
        @cache = []
        @max = num
        @time = Array.new(num) {0}
    end

    def count
      # returns number of elements currently in cache
        cache.length
    end

    def add(el)
      # adds element to cache according to LRU principle
        if cache.include?(el)
            match_idx = cache.index(el)
            time.map!.with_index do |ele, i|
                if i != match_idx
                    ele -= 1
                end
            end
            time[match_idx] = max
        elsif cache.length < max
            cache << el
            new_idx = cache.index(el)
            time.map!.with_index do |ele, i|
                if i != new_idx
                    ele -= 1
                end
            end
            time[new_idx] = max
        else 
            min_index = time.index(time.min)
            cache[min_index] = el
            time.map!.with_index do |ele, i|
                if i != min_index
                    ele -= 1
                end
            end
            time[min_index] = max
        end
    end

    def show
      result = []
      sorted = time.sort
      sorted.each do |ele|
        if !cache[time.index(ele)].nil?
            result << cache[time.index(ele)]
        end
      end
      result
    end

    private
    # helper methods go here!

  end