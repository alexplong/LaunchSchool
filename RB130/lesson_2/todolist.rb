class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def undone!
    self.done = false
  end

  def done?
    done
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
    description == otherTodo.description &&
    done == otherTodo.done
  end
end

class TodoList
  attr_accessor :title
  def initialize(title)
    @title = title
    @todo_list = []
  end

  def add(task)
    raise TypeError.new("Can only add Todo objects") unless task.instance_of? Todo
    @todo_list << task
  end

  alias_method :<<, :add

  def size
    todo_list.size
  end

  def first
    todo_list.first
  end

  def last
    todo_list.last
  end

  def to_a
    [*todo_list]
  end

  def done?
    todo_list.all? { |task| task.done? }
  end

  def item_at(idx)
    raise IndexError.new("Out of Index Range") if idx > self.size
    todo_list[idx]
  end

  def mark_done_at(idx)
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    item_at(idx).undone!
  end

  def done!
    todo_list.each(&:done!)
  end

  def shift
    todo_list.shift
  end

  def pop
    todo_list.pop
  end

  def remove_at(idx)
    raise IndexError.new("Out of Index Range") if idx > self.size
    #todo_list.delete_at(idx)
    todo_list.delete(item_at(idx))
  end

  def to_s
    text = "---- #{@title} ----\n"
    text << @todo_list.map(&:to_s).join("\n")
    text
  end

  def each
    @todo_list.each { |todo| yield(todo) }
    self
  end

  def select

    selected = TodoList.new(title)

    each do |todo|
       selected << todo if yield(todo)
    end

    selected
  end


  def find_by_title(todo_name)
    each do |todo|
      return todo if todo.name == todo_name
    end

    nil
  end

  def all_done
    select do |todo|
      todo.done?
    end
  end

  def all_not_done
    select do |todo|
      !todo.done?
    end
  end

  def mark_done(task_name)
    found = find_by_title(task_name) || nil

    found.done! if found

    found
  end

  def mark_all_done
    each do |todo|
      todo.done!
    end
  end


  def mark_all_undone
    each do |todo|
      todo.undone!
    end
  end

  private

  attr_reader :todo_list
end
