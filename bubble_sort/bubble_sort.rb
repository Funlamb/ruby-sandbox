class Bubble_sort
    def bubble_sort(array_to_sort = [10,15,4,7,3,9,22,17])
        array_size = array_to_sort.length
        # check 2 numbers
        i = 0
        j = 0
        while i < array_size
            swapped = false
            while j < array_size - i - 1
                if array_to_sort[j] > array_to_sort[j + 1]
                    temp = array_to_sort[j]
                    array_to_sort[j] = array_to_sort[j + 1]
                    array_to_sort[j + 1] = temp
                    swapped = true
                end
                j += 1
            end
            if !swapped
                break
            end
            i += 1
            j = 0
        end
        array_to_sort
    end
end

something = Bubble_sort.new
print something.bubble_sort()
print something.bubble_sort([6,7,3,5,2,8,9])
print something.bubble_sort([22,66,34,512,89,45])
print something.bubble_sort([12,2,14,55,44,77,32,9,0])