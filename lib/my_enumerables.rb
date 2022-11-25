module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    for i in self do
      yield(i, index)
      index += 1
    end
    self
  end

  def my_select
    selected = []
    for i in self do
      result = yield(i)
      selected.push(i) if result
    end
    selected
  end

  def my_all?
    tracker = true
    for i in self do
      tracker = yield(i)
      break unless tracker
    end
    tracker
  end

  def my_any?
    tracker = false
    for i in self do
      tracker = yield(i)
      break if tracker
    end
    tracker
  end

  def my_none?
    tracker = true
    for i in self do
      tracker = !(yield(i))
      break unless tracker
    end
    tracker
  end

  def my_count
    unless block_given?
      return self.length
    end
    tracker = 0
    for i in self do
      result = yield(i)
      tracker += 1 if result
    end
    tracker
  end

  def my_map
    result = []
    for i in self do
      result.push(yield(i))
    end
    result
  end

  def my_inject(initial_value)
    reducer = initial_value
    for i in self do
      reducer = yield(reducer, i)
    end
    reducer
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for i in self do
      yield(i)
    end
    self
  end
end
