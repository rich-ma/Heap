require_relative "heap"

class Array
  def heap_sort!
    pr = Proc.new{|el1, el2| el2 <=> el1 }
    heap_boundary = 1
    until heap_boundary == self.length
      p self[0..heap_boundary]
      BinaryMinHeap.heapify_up(self[0..heap_boundary],
        heap_boundary, heap_boundary - 0,
        &pr)
      p self[0..heap_boundary]
      heap_boundary += 1
    end
    self
  end
end
