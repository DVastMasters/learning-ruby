def bubble_sort(elements)
  n = elements.length
  until n <= 1 do
    newn = 0
    (n-1).times do |idx|
      if elements[idx] > elements[idx + 1] then
        elements[idx + 1], elements[idx] = elements[idx], elements[idx + 1]
        newn = idx + 1
      end
    end
    n = newn
  end
  elements
end

p bubble_sort([5, 4, 3, 2, 1])
p bubble_sort([3, 1, 5, 2, 4])