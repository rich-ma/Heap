class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @prc = prc ||= Proc.new{|el1, el2| el1 <=> el2 }
    @store = []
  end

  def count
    @store.length
  end

  def extract
    @store[0], @store[-1] = @store[-1], @store[0]
  end

  def peek
    @store[0]
  end

  def push(val)
    @store.push(val)
  end

  public
  def self.child_indices(len, parent_index)
    child_idx = [parent_index*2 + 1, parent_index*2 + 2]
    return child_idx if len > child_idx[1]
    return nil if len < child_idx[0]
    return [child_idx[0]]
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    (child_index-1)/2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    
    children = BinaryMinHeap.child_indices(len, parent_idx)
    until children.none? {|child| prc.call(array[child], array[parent_idx]) == }
    return array if children.empty?
    if children.length == 1 
      case (prc.call(array[children[0]], array[parent_idx]))

      array[children[0]], array[parent_idx] = array[parent_idx], arr[children[0]]
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)

  end
end
