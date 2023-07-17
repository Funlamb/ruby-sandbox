class Stock_picker
    def stock_picker(array_of_prices = [1,17,3,6,9,15,8,6,1,10])
        max_profit = 0
        # get the length of the array
        # check all prices
        # find the highest price
        largest_number = 0
        largest_number_index = 0
        array_of_prices.each_with_index do |number, index|
            if number > largest_number
                largest_number = number
                largest_number_index = index
            end
        end
        # find the lowest price
        smallest_number = largest_number
        smallest_number_index = 0
        array_of_prices.each_with_index do |number, index|
            if number < smallest_number
                smallest_number = number
                smallest_number_index = index
            end
        end
        # if the lowest and highest work use it
        puts "Largest Numebr: " + largest_number.to_s + " Largest index: " + largest_number_index.to_s
        puts "Smallest Numebr: " + smallest_number.to_s + " Smallest index: " + smallest_number_index.to_s
        if smallest_number_index < largest_number_index
            return [smallest_number_index, largest_number_index]
        end
        # run though all the numbers
        i = 0
        j = 1
        size = array_of_prices.length
        day_array = []
        while i < size
            while j < size
                if ((array_of_prices[j] - array_of_prices[i]) > max_profit)
                    max_profit = array_of_prices[j] - array_of_prices[i]
                    day_array = [i, j]
                end
                j += 1
            end
            i += 1
            j = i + 1
            puts "Max Profit: " + max_profit.to_s + " i:" + i.to_s + " j: " + j.to_s 
        end
        return day_array

    end
end

something = Stock_picker.new
puts something.stock_picker([7,8,3,7,9,10,3,2])
puts something.stock_picker([7,8,3,7,9,24,3,2])
puts something.stock_picker([7,8,2,7,9,10,14,2])
puts something.stock_picker([8,12,5,8,16,19,10])