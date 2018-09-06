require_relative "heap"

class Array
  def heap_sort!
    prc = Proc.new{|el1, el2| el2 <=> el1 }
    heap_boundary = 1
    until heap_boundary == self.length
      BinaryMinHeap.heapify_up(self,
        heap_boundary, heap_boundary,
        &prc)
      heap_boundary += 1
    end
    self[0], self[-1] = self[-1], self[0]
    heap_boundary = self.length - 2
    until heap_boundary.zero?
      BinaryMinHeap.heapify_down(self, 0, heap_boundary + 1, &prc)
      self[0], self[heap_boundary] = self[heap_boundary], self[0]
      heap_boundary -= 1
    end
  end
end
