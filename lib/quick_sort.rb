require 'byebug'
class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    # debugger
    # return if length <1
    # idx = QuickSort.partition(array, start, length, &prc)
    # array[idx], array[0] = array[0], array[idx] unless idx == 1
    # QuickSort.sort2!(array, 0, idx, &prc)
    # QuickSort.sort2!(array, idx+1, array.length - idx, &prc)
  end

  def self.partition(array, start, length, &prc)
    # debugger
    barrier = start
    length -= 1
    size = length
    pointer = start + 1
    while length > 0
      if array[pointer] < array[start] 
        barrier += 1
        array[barrier], array[pointer]  = array[pointer], array[barrier] if pointer != start + 1 
        length -= 1
      else
        length -= 1
      end
      pointer = pointer + 1
    end
    return barrier
  end
end

arr = [4,3,10,7,2,8,1]
QuickSort.sort2!(arr, 0, arr.length)
print(arr)
# puts(barrier)
