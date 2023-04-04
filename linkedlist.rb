class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(value)
    if @head.nil?
      @head = Node.new(value, nil)
    else
      last = @head
      # start at the head
      # while the head's next node is not nil, the head is reassigned to the next_node
      while (!last.next_node.nil?)
        last = last.next_node
      end
      # the node that we land on becomes the new Node object below
      last.next_node = Node.new(value, nil)
    end
  end

  def prepend(value)
    if @head.nil?
      @head = Node.new(value, nil)
    else
      # assign the current @head to a var
      first = @head
      # create a new Node object with its next_node to be var above
      @head = Node.new(value, first)
    end
  end

  def size
    count = 0
    if @head.nil?
      return count
    else
      while !@head.next_node.nil?
        count += 1
        @head = @head.next_node
      end
      return count + 1
    end
  end

  def head
    if !@head.nil?
      return @head.value
    else
      return "nil"
    end
  end

  def tail
    until @head.next_node.nil?
      @head = @head.next_node
    end
    return @head.value
  end

  def at(index)
    count = 1
    if index == count
      return @head.value
    else
      while index != count
        @head = @head.next_node
        count += 1
      end
      return @head.value
    end
  end

  # def pop
  #   if @head.nil?
  #     return
  #   end

  #   last = @head
  #   while !last.next_node.nil?
  #     last = last.next_node
  #   end

  #   last.next_node = nil
  # end

  def pop
    if @head.nil?
      return
    end

    while !@head.next_node.nil?
      @head = @head.next_node
    end
    @head.value = nil

  end

  def contains?(value)
    loop do
      if @head.value == value
        return true 
      elsif @head.next_node.nil?
        return false
      else
        @head = @head.next_node
        contains?(value)
      end
    end
  end

  def find(value)
    index = 1

    if @head.value == value
      return index
    end

    while @head.value != value
      @head = @head.next_node
      index += 1
      if @head.next_node.nil? && @head.value != value
        return false
      end
    end
    index
  end

  def to_s

  end



  class Node
    attr_accessor :value, :next_node
  
    def initialize(value, next_node)
      @value = value
      @next_node = next_node
    end
  end

end

list = LinkedList.new

list.append(1)
list.append(2)
list.append(3)
list.append(7)

list.pop
puts list.size
