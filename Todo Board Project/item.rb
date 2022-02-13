class Item

    def self.valid_date?(date)
        date = date.split("-")
        return false if date[0].to_i > 2022
        return false if date[1].to_i > 12
        return false if date[2].to_i > 31
        date[0].length == 4 && date[1].length == 2 && date[2].length == 2 
    end

    def initialize(title, deadline, description)
        @title = title
        @description = description
        if Item.valid_date?(deadline)
            @deadline = deadline
        else
            raise("Invalid Date")
        end
    end

    attr_accessor :title, :description

    def deadline
        @deadline
    end

    def deadline=(new_deadline)
        if Item.valid_date?(new_deadline)
            @deadline = new_deadline
        else
            raise("Invalid Date")
        end
    end
end