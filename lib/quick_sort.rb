require 'byebug'
class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length <= 1
    pivot = array.shift
    left = array.select{|el| el < pivot}
    right = array.select{|el| el > pivot}
    sorted_left = QuickSort.sort1(left)
    sorted_right = QuickSort.sort1(right)
    return sorted_left.concat([pivot]).concat(sorted_right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    return array if length <= 1
    idx = QuickSort.partition(array, start, length, &prc)
    QuickSort.sort2!(array, start, idx - start, &prc)
    QuickSort.sort2!(array, idx+1, length - idx - 1, &prc) unless idx + 1 == length - 1
    return array
  end

  def self.partition(array, start, length, &prc)
    return if length <= 1
    prc ||= Proc.new { |a, b| a <=> b }
    barrier = start + 1
    pointer = start + 1
    while pointer < (start + length)
      if prc.call(array[pointer],array[start]) < 1
        array[barrier], array[pointer]  = array[pointer], array[barrier]
        barrier += 1
      end
      pointer = pointer + 1
    end
    array[barrier - 1], array[start] = array[start], array[barrier - 1]
    return barrier - 1
  end
end

arr = [4,3,10,7,2,8,1]
# ans = QuickSort.sort2(arr)
QuickSort.sort2!(arr, 0, arr.length)
print(arr)
# puts(barrier)
