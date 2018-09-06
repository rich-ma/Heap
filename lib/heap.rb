class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @prc = (prc ||= Proc.new do |el1, el2| 
      el1 <=> el2
    end)
    @store = []
  end

  def count
    @store.length - 1
  end

  def extract
    @store[0], @store[-1] = @store[-1], @store[0]
    val = @store.pop
    BinaryMinHeap.heapify_down(@store, 0)
    val
  end

  def peek
    @store[0]
  end

  def push(val)
    @store.push(val)
    BinaryMinHeap.heapify_up(@store, count)
  end

  public
  def self.child_indices(len, parent_index)
    child_idx = [parent_index*2 + 1, parent_index*2 + 2]
    return child_idx if len > child_idx[1]
    return [] if len <= child_idx[0]
    [child_idx[0]]
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    (child_index-1)/2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new{|el1, el2| el1 <=> el2 }

    children = BinaryMinHeap.child_indices(len, parent_idx)
    until children.all? { |child| prc.call(array[child], array[parent_idx]) > -1 }
      if children.length == 2 && (prc.call(array[children[1]],array[children[0]]) == -1 )
        array[children[1]], array[parent_idx] = array[parent_idx], array[children[1]] 
        parent_idx = children[1]
      else
        array[children[0]], array[parent_idx] = array[parent_idx], array[children[0]] 
        parent_idx = children[0]
      end
      children = BinaryMinHeap.child_indices(len, parent_idx)
    end
    array
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc ||= Proc.new {|el1, el2| el1 <=> el2 }
    return array if child_idx.zero?
    parent = BinaryMinHeap.parent_index(child_idx)
    until prc.call(array[parent], array[child_idx]) < 1 
      array[child_idx], array[parent] = array[parent], array[child_idx]
      child_idx = parent
      break if child_idx.zero?
      parent = BinaryMinHeap.parent_index(child_idx)
    end
    array
  end
end
