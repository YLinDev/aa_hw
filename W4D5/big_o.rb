array = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 
 'fiiiissshhhhhh']

 #=> "fiiiissshhhhhh"

def sluggish_octopus(array) #O(n^2)
    result = ''
    max = 0
    (0...array.length-1).each do |i|
        (0...array.length).each do |j|
            if array[i].length > array[j].length
                result = array[i]
                max = array[i].length
            else
                result = array[j]
                max = array[j].length
            end
        end
    end
    result
end

def dominant_octopus(array, &prc) #O(n log n)
    return array if array.length <= 1
    mid_idx = array.length / 2
    merge(
        dominant_octopus(array[0...mid_idx], &prc),
        dominant_octopus(array[mid_idx..-1], &prc),
        &prc
    )
end

def merge(left, right, &prc)
    result = []
    prc = Proc.new {|a, b| a <=> b}
    until left.empty? || right.empty?
        case prc.call(left.first.length, right.first.length)
        when -1
            result << left.shift
        when 0
            result << left.shift
        when 1
            result << right.shift
        end
    end
    result + left + right
end

def clever_octopus(array) #O(n)
    array.max {|ele| ele.length}
end

#p clever_octopus(array)

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(tile_dir, tiles_array) #O(n)
    tiles_array.each.with_index do |tile, i|
        return i if tile == tile_dir
    end
end

def constant_dance(tile_dir, tiles_array) #O(1)
    tiles_array.index(tile_dir)
end

p constant_dance("right-down", tiles_array)


#class demo on Big O

def first_thing(array)
    array.first #O(1) time O(1) space
end



def three_hundred_thousand_puts(name)
    300000.times { puts "hello, #{name}"} #O(1) time
end

def print_all(array)
    array.each { |el| puts el } #O(n)
end

def most_common_char(word) # O(1) + O(n) + O(n) => O(2n) + O(1) => O(n)
    counts = Hash.new(0) #O(1) *space complexity is constant because max alphabet or charater is limited, there is not an inifity amount of characters*
    words.chars.each { |char| counts[char] += 1 } #O(n)  *space is O(n)
    count.max_by { |_, num| num } #O(n) *space is constant because only max is created to set and return max
end

class Array
    def include?(value) #O(n)
        self.each do |el|
            return true if (el == value)
        end
        false
    end

    def bsearch(nums, target, start = 0, finish = nums.length)
        return nil if start == finish
        mid = (finish - start) / 2 + start #O(log n) *space is O(log n)
        case target <=> nums[mid]
        when -1
            bsearch(nums, target, start, mid)
        when 0
            mid
        when 1
            bsearch(nums, target, mid + 1, finish)
        end
    end
end

class Array #O(n) * O(log n)
    def merge_sort
        return self if self.length < 2
        mid_index = self.length / 2
        left = self[0...mid_index]
        right = self[mid_index..-1]
        return Array.merge(
          left.merge_sort(&prc), 
          right.merge_sort(&prc),
          &prc
        )
      end
    
    private
    def self.merge(left, right, &prc)
    result = []
    prc ||= Proc.new {|num1, num2| num1 <=> num2}
    while left.length > 0 && right.length > 0
        if prc.call(left[0], right[0]) <= 0
        result.push(left.shift)
        else
        result.push(right.shift)
        end
    end
    return result + left + right
    end
end


def all_pair_sums(array) #O(n^2) *space is O(n^2)
    sums = []
    array.each do |el1|
        array.each do |el2|
            sums << el1 + el2
        end
    end
    sums
end 

class Array
    def subsets #O(2^n) *space O(2^n)
        return [[]] if empty?
        subs_without_first = drop(1).subsets
        subs_with_first = subs_without_first.map { |sub| [first] + sub}
        subs_with_first + subs_without_first
    end
end

[1].subsets => [[],[1]]
[1, 2].subsets => [[], [1], [2], [1,2]]
