# Unit_Test_GoodTests.rb
# Tests all iterators from enumerable, except lazy
# If a test fails, the failures variable increases by 1
# A brief summary is printed at the end


#===========================================================
# Begin Unit Testing of Enumerable Iterators (exc. lazy)
#===========================================================
failure = 0
failures = 0

#1 Testing map iterator
result = Triple.new(1, 2, 3).map { |n| n*2 }
failure += 1 if result != [2, 4, 6]
puts "map failed" if failure > 0
failures += failure
failure = 0

#2 Testing all? iterator
result = Triple.new(10, 9, nil).all?
failure += 1 if result

result = Triple.new("comp", "sci", "453").all? { |word| word.length >= 3 }
failure += 1 if !result

puts "all? failed" if failure > 0
failures += failure
failure = 0

#3 Testing any? iterator
result = Triple.new("comp", "sci", "453").any? { |word| word.length >= 4 }
failure += 1 if !result

result = Triple.new(nil, nil, nil).any?
failure += 1 if result

puts "any? failed" if failure > 0
failures += failure
failure = 0

#4 Testing chunk iterator
result = Triple.new(2,7,1).chunk {|n| n.even? }
result0 = result.to_a

failure += 1 if result0 != [[true, [2]],[false, [7, 1]]]

puts "chunk failed" if failure > 0
failures += failure
failure = 0

#5 Testing chunk_while iterator
result = Triple.new(2,6,12).chunk_while { |i,j| i*2 == j }
result0 = result.to_a

failure += 1 if result0 != [[2], [6, 12]]

puts "chunk_while failed" if failure > 0
failures += failure
failure = 0

#6 Testing collect iterator
result = Triple.new(1,2,3).collect { 42 }
failure += 1 if result != [ 42, 42, 42 ]

puts "collect failed" if failure > 0
failures += failure
failure = 0

#7 Testing collect_concat iterator
result = Triple.new(1,2,3).collect_concat { |n| [n,n**3] }
failure += 1 if result != [1,1,2,8,3,27]

puts "collect_concat failed" if failure > 0
failures += failure
failure = 0

#8 Testing count iterator
result = Triple.new(3,6,11)
failure += 1 if result.count != 3
failure += 1 if result.count(6) != 1
failure += 1 if result.count { |n| n%3==0 } != 2

puts "count failed" if failure > 0
failures += failure
failure = 0

#9 Testing cycle iterator
result = []
Triple.new("one", "two", "three").cycle(2) { |n| result.push(n) }
failure += 1 if result != ["one", "two", "three","one", "two", "three"]

puts "cycle failed" if failure > 0
failures += failure
failure = 0

#10 Testing detect iterator
result = Triple.new(15, 21, 45)
failure += 1 if result.detect { |n| n%9 == 0 and n%5 == 0 } != 45
failure += 1 if result.detect { |n| n%4 == 0 } != nil

puts "detect failed" if failure > 0
failures += failure
failure = 0

#11 Testing drop iterator
result = Triple.new(1,2,3).drop(2)
failure += 1 if result != [3]

puts "drop failed" if failure > 0
failures += failure
failure = 0

#12 Testing drop_while iterator
result = Triple.new(1,2,3).drop_while { |n| n < 2 }
failure += 1 if result != [2,3]

puts "drop_while failed" if failure > 0
failures += failure
failure = 0

#13 Testing each_cons iterator
result = Triple.new(5,8,13).each_cons(2)
failure += 1 if result.to_a[0] != [5,8] and result.to_a[1] != [8,13]

puts "each_cons failed" if failure > 0
failures += failure
failure = 0

#14 Testing each_entry iterator
result = Triple.new(1,2,3).each_entry
failure += 1 if result.to_a[0] != 1

puts "each_entry failed" if failure > 0
failures += failure
failure = 0

#15 Testing each_slice iterator
result = Triple.new(1,2,3).each_slice(2)
failure += 1 if result.to_a != [[1, 2], [3]]

puts "each_slice failed" if failure > 0
failures += failure
failure = 0

#16 Testing each_with_index iterator
hash = Hash.new
Triple.new('a','b','c').each_with_index { |item, index|
  hash[item] = index }
hash_comp = {'a' => 0,'b' => 1,'c' => 2}
failure += 1 if hash != hash_comp

puts "each_with_index failed" if failure > 0
failures += failure
failure = 0

#17 Testing each_with_object iterator
result = Triple.new(1,2,3).each_with_object([]) { |n,obj| obj << n**2  }
failure += 1 if result.to_a != [1, 4, 9]

puts "each_with_object failed" if failure > 0
failures += failure
failure = 0

#18 Testing entries iterator
result = Triple.new(1,2,3).entries
failure += 1 if result != [1,2,3]

puts "entries failed" if failure > 0
failures += failure
failure = 0

#19 Testing find iterator
result = Triple.new(15, 21, 45)
failure += 1 if result.find { |n| n%9 == 0 and n%5 == 0 } != 45
failure += 1 if result.find { |n| n%4 == 0 } != nil

puts "find failed" if failure > 0
failures += failure
failure = 0

#20 Testing find_all iterator
result = Triple.new(15, 21, 45)
failure += 1 if result.find_all { |n| n%5 == 0 } != [15,45]

puts "find_all failed" if failure > 0
failures += failure
failure = 0

#21 Testing find_index iterator
result = Triple.new(15, 21, 45)
failure += 1 if result.find_index { |n| n%9 == 0 and n%5 == 0 } != 2
failure += 1 if result.find_index { |n| n%4 == 0 } != nil
failure += 1 if result.find_index(45) != 2

puts "find_index failed" if failure > 0
failures += failure
failure = 0

#22 Testing first iterator
result = Triple.new("mouse", "cat", "dog")
failure += 1 if result.first != "mouse"
failure += 1 if result.first(2) != ["mouse", "cat"]
failure += 1 if [].first != nil

puts "first failed" if failure > 0
failures += failure
failure = 0

#23 Testing flat_map iterator
result = Triple.new(1,2,3).flat_map { |n| [n, n*2] }
failure += 1 if result.to_a != [1, 2, 2, 4, 3 ,6]

puts "flat_map failed" if failure > 0
failures += failure
failure = 0

#24, 25 Testing grep iterator and grep_v iterator
result = Triple.new("applesauce", "apple juice", "orange")
failure += 1 if result.grep(/apple/) { |w| w + "s" } !=
                 ["applesauces", "apple juices"]

puts "grep failed" if failure > 0
failures += failure
failure = 0

failure += 1 if result.grep_v(/apple/) { |w| w + "s" } !=
                 ["oranges"]

puts "grep_v failed" if failure > 0
failures += failure
failure = 0

#26 Testing group_by iterator
result = Triple.new(2,4,8).group_by { |n| n%4 }
failure += 1 if result != {2=>[2], 0=>[4,8]}

puts "group_by failed" if failure > 0
failures += failure
failure = 0

#27 Testing include? iterator
result = Triple.new(1,5,10).include?(5)
failure += 1 if !result 

puts "include? failed" if failure > 0
failures += failure
failure = 0

#28 Testing inject iterator
result = Triple.new(1,2,3)
failure += 1 if result.inject { |sum, n| sum + n } != 6
failure += 1 if result.inject(4) { |prod, n| prod*n } != 24

puts "inject failed" if failure > 0
failures += failure
failure = 0

#29 Testing max iterator
result = Triple.new("abc", "defgh", "ij")
failure += 1 if result.max != "ij"
failure += 1 if result.max(2) != ["ij","defgh"]
failure += 1 if result.max { |w1, w2| w1.length <=> w2.length } != "defgh"
failure += 1 if Triple.new(2,5,1).max != 5

puts "max failed" if failure > 0
failures += failure
failure = 0

#30 Testing max_by iterator
result = Triple.new("abc", "defgh", "ij")
failure += 1 if result.max_by { |w| w.length } != "defgh"
failure += 1 if result.max_by(2) { |w| w.length } != ["defgh","abc"]

puts "max_by failed" if failure > 0
failures += failure
failure = 0

#31 Testing member? iterator
result = Triple.new(1,5,10).member?(5)
failure += 1 if !result

puts "member? failed" if failure > 0
failures += failure
failure = 0

#32 Testing min iterator
result = Triple.new("abc", "defgh", "ij")
failure += 1 if result.min != "abc"
failure += 1 if result.min(2) != ["abc","defgh"]
failure += 1 if result.min { |w1, w2| w1.length <=> w2.length } != "ij"
failure += 1 if Triple.new(2,5,1).min != 1

puts "min failed" if failure > 0
failures += failure
failure = 0

#33 Testing min_by iterator
result = Triple.new("abc", "defgh", "ij")
failure += 1 if result.min_by { |w| w.length } != "ij"
failure += 1 if result.min_by(2) { |w| w.length } != ["ij","abc"]

puts "min_by failed" if failure > 0
failures += failure
failure = 0

#34 Testing minmax iterator
result = Triple.new("abc", "defgh", "ij")
failure += 1 if result.minmax != ["abc","ij"]
failure += 1 if result.minmax { |w1, w2| w1.length <=> w2.length } != ["ij","defgh"]

puts "minmax failed" if failure > 0
failures += failure
failure = 0

#35 Testing minmax_by iterator
result = Triple.new("abc", "defgh", "ij")
failure += 1 if result.minmax_by { |w| w.length } != ["ij","defgh"]

puts "minmax_by failed" if failure > 0
failures += failure
failure = 0

#36, 37 Testing none? and one? iterator
result = Triple.new("abc", "defgh", "ij")
failure += 1 if !result.none? { |w| w.length == 4 }
failure += 1 if result.none? { |w| w.length > 4 }
failure += 1 if ![].none?

puts "none? failed" if failure > 0
failures += failure
failure = 0

failure += 1 if !result.one? { |w| w.length == 5 }
failure += 1 if result.one? { |w| w.length < 5 }

puts "one? failed" if failure > 0
failures += failure
failure = 0

#38 Testing partition iterator
result = Triple.new(2,3,4).partition { |n| n%2 == 0 }
failure += 1 if result[0] != [2,4]
failure += 1 if result[1] != [3]

puts "partition failed" if failure > 0
failures += failure
failure = 0

#39 Testing reduce iterator
result = Triple.new(1,2,3)
failure += 1 if result.reduce(:+) != 6
failure += 1 if result.reduce(1, :*) != 6

puts "reduce failed" if failure > 0
failures += failure
failure = 0

#40 Testing reject iterator
result = Triple.new(1,2,3).reject { |n| n**2 > 3 }
failure += 1 if result != [1]

puts "reject failed" if failure > 0
failures += failure
failure = 0

#41 Testing reverse_each iterator
result = []
Triple.new(1,2,3).reverse_each { |n| result << n**2 }
failure += 1 if result.to_a != [9,4,1]

puts "reverse_each failed" if failure > 0
failures += failure
failure = 0

#42 Testing select iterator
result = Triple.new(15,21,45).select { |n| n%5 == 0 }
failure += 1 if result != [15,45]

puts "select failed" if failure > 0
failures += failure
failure = 0

#43 Testing slice_after iterator
result = Triple.new("apple juice", "milk", "orange juice").slice_after(/juice/)
failure += 1 if result.to_a[0] != ["apple juice"]
failure += 1 if result.to_a[1] != ["milk", "orange juice"]

result = Triple.new(1,3,5).slice_after { |n| n%3 == 0 }
failure += 1 if result.to_a[0] != [1,3]
failure += 1 if result.to_a[1] != [5]

puts "slice_after failed" if failure > 0
failures += failure
failure = 0

#44 Testing slice_before iterator
result = Triple.new("apple juice", "milk", "orange juice").slice_before(/juice/)
failure += 1 if result.to_a[0] != ["apple juice", "milk"]
failure += 1 if result.to_a[1] != ["orange juice"]

result = Triple.new(1,3,5).slice_before { |n| n%3 == 0 }
failure += 1 if result.to_a[0] != [1]
failure += 1 if result.to_a[1] != [3,5]

puts "slice_before failed" if failure > 0
failures += failure
failure = 0

#45 Testing slice_when iterator
result = Triple.new(1,3,2).slice_when { |i,j| (i+j)%2 == 0 }.to_a
failure += 1 if result[0] != [1]
failure += 1 if result[1] != [3,2]

puts "slice_when failed" if failure > 0
failures += failure
failure = 0

#46 Testing sort iterator
result = Triple.new(5,1,3)
failure += 1 if result.sort != [1,3,5]
failure += 1 if result.sort { |n, m| m <=> n } != [5,3,1]
failure += 1 if Triple.new("b","c","a").sort != ["a","b","c"]

puts "sort failed" if failure > 0
failures += failure
failure = 0

#47 Testing sort_by iterator
result = Triple.new("abc","defgh","ij").sort_by { |w| w.length }
failure += 1 if result != ["ij", "abc", "defgh"]

puts "sort_by failed" if failure > 0
failures += failure
failure = 0

#48 Testing sum iterator
result = Triple.new(1,2,3)
failure += 1 if result.sum != 6
failure += 1 if result.sum { |n| n**2 } != 14

puts "sum failed" if failure > 0
failures += failure
failure = 0

#49 Testing take iterator
result = Triple.new(1,2,3).take(2)
failure += 1 if result != [1,2]

puts "take failed" if failure > 0
failures += failure
failure = 0

#50 Testing take_while iterator
result = Triple.new("a","bc","def").take_while { |w| w.length < 3 }
failure += 1 if result != ["a","bc"]

puts "take_while failed" if failure > 0
failures += failure
failure = 0

#51 Testing to_a iterator
result = (1..4).to_a
failure += 1 if result != [1,2,3,4]

puts "to_a failed" if failure > 0
failures += failure
failure = 0

#52 Testing to_h iterator
result = Triple.new(["abc",0],["def",1],["ghi",2]).to_h
failure += 1 if result != {"abc"=>0,"def"=>1,"ghi"=>2}

puts "to_h failed" if failure > 0
failures += failure
failure = 0

#53 Testing uniq iterator
result = Triple.new(1,1,2)
failure += 1 if result.uniq != [1,2]

puts "uniq failed" if failure > 0
failures += failure
failure = 0

#54 Testing zip iterator
x = Triple.new(1,2,3)
y = Triple.new(4,5,6)
z = []
result = x.zip(y)
x.zip(y) { |n, m| z << n*m }
failure += 1 if result != [[1,4],[2,5],[3,6]]
failure += 1 if x.zip(x,y) != [[1,1,4],[2,2,5],[3,3,6]]
failure += 1 if z != [4,10,18]

puts "zip failed" if failure > 0
failures += failure
failure = 0

#Total failures
puts "There was/were #{failures} failure(s)"
