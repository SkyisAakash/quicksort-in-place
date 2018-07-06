require 'byebug'
class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
  end

  def self.partition(array, start, length, &prc)
    # debugger
    barrier = start + 1
    length -= 1
    while length > 0
      # debugger
      pointer = array.length - length
      if array[pointer] < array[start] 
        array[barrier], array[pointer]  = array[pointer], array[barrier] if pointer != start + 1 
        barrier += 1
        length -= 1
      else
        length -= 1
      end
    end
    return barrier - 1
  end
end

# arr = [4,3,10,7,2,8,1]
# barrier = QuickSort.partition(arr, 0, arr.length)
# print(arr)
# puts(barrier)
