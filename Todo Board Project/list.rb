require "./item.rb"

class List
    def initialize(label)
        @label = label
        @items = []
    end

    attr_accessor :label, :items

    def add_item(title, deadline, description="")
        if Item.valid_date?(deadline)
            @items << Item.new(title, deadline, description)
            return true
        else
            return false
        end
    end

    def size
        @items.length
    end

    def valid_index?(index)
        @items.length - 1 >= index
    end

    def swap(index_1, index_2)
        if valid_index?(index_1) && valid_index?(index_2)
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
            return true
        else
            return false
        end
    end

    def [](index)
        @items[index]
    end

    def priority
        @items[0]
    end

    def print
        puts "------------------------------------------"
        puts "                #{@label}".ljust(20)
        puts "------------------------------------------"
        puts "Index | Item                 | Deadline".ljust(20)
        puts "------------------------------------------"
        @items.each_with_index do |item, i|
            puts "#{i}".ljust(6) + "| " + "#{item.title}".ljust(25) + "| " + "#{item.deadline}"
        end
        puts "------------------------------------------"
    end

    def print_full_item(i)
        if valid_index?(i)
            puts "------------------------------------------"
            puts "#{@items[i].title}      #{@items[i].deadline}"
            puts @items[i].description
            puts "------------------------------------------"
        end
    end

    def print_priority
        puts "------------------------------------------"
            puts "#{@items[0].title}      #{@items[0].deadline}"
            puts @items[0].description
            puts "------------------------------------------"
    end

    def up(index, amount=1)
        
    end
end