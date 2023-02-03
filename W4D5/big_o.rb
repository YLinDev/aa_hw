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

def clever_octopus(array) O(n)
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