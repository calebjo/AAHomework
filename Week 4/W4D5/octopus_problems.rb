# ---------------------------------------------------------------
# W4D5 - Octopus Problems
# ---------------------------------------------------------------

# Big O-ctopus and Biggest Fish ---------------------------------

fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

# Sluggish Octopus ----------------------------------------------
# O(n^2) time
def sluggish_octopus(fish)
    longest_fish = fish.first

    fish.each do |fish1|
        fish.each do |fish2|
            if fish2.length > fish1.length
                longest_fish = fish2
            else
                longest_fish = fish1
            end
        end
    end

    longest_fish
end
# p sluggish_octopus(fish)

# Dominant Octopus ----------------------------------------------
# O(nlogn) time (merge_sort)
def dominant_octopus(fish)
    merge_sort(fish).last
end

def merge_sort(array)
    return array if array.length <= 1

    mid = array.length / 2

    left_half = merge_sort(array[0..mid-1])
    right_half = merge_sort(array[mid..-1])

    merge(left_half, right_half)
end

def merge(left_array, right_array)
    merged = []

    until left_array.empty? || right_array.empty?
        case left_array.first.length <=> right_array.first.length
        when 1
            merged << right_array.shift
        when 0
            merged << left_array.shift
        when -1
            merged << left_array.shift
        end
    end

    merged + left_array + right_array
end
# p dominant_octopus(fish)

# Clever Octopus ------------------------------------------------
# O(n) time
def dominant_octopus(fish)
    longest_fish = fish.first
    fish.each do |fish|
        longest_fish = fish if fish.length > longest_fish.length
    end
    longest_fish
end
# p dominant_octopus(fish)

# Dancing Octopus -----------------------------------------------
TILES_ARRAY = ["up", "right-up", "right", "right-down", "down", 
    "left-down", "left",  "left-up" ]

# Slow Dance ----------------------------------------------------
def slow_dance(tile_dir)
    TILES_ARRAY.each_with_index do |tile, i|
        return i if tile == tile_dir
    end
end
# p slow_dance("left-down")

# Constant Dance! -----------------------------------------------
def constant_dance(tile_dir)
    dir_hash = {"up"=> 0, "right-up"=> 1, "right"=> 2, "right-down"=> 3, "down"=> 4, 
    "left-down"=> 5, "left"=> 6,  "left-up"=> 7}

    return dir_hash[tile_dir]
end
p constant_dance("right-down")