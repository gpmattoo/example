=begin
------------------------------------------------------ Class: Enumerable
     The +Enumerable+ mixin provides collection classes with several
     traversal and searching methods, and with the ability to sort. The
     class must provide a method +each+, which yields successive members
     of the collection. If +Enumerable#max+, +#min+, or +#sort+ is used,
     the objects in the collection must also implement a meaningful
     +<=>+ operator, as these methods rely on an ordering between
     members of the collection.

------------------------------------------------------------------------


Instance methods:
-----------------
     all?, any?, collect, detect, each_cons, each_slice,
     each_with_index, entries, enum_cons, enum_slice, enum_with_index,
     find, find_all, grep, include?, inject, inject, map, max, member?,
     min, partition, reject, select, sort, sort_by, to_a, to_set, zip

=end
module Enumerable

  # ----------------------------------------------------- Enumerable#member?
  #      enum.include?(obj)     => true or false
  #      enum.member?(obj)      => true or false
  # ------------------------------------------------------------------------
  #      Returns +true+ if any member of _enum_ equals _obj_. Equality is
  #      tested using +==+.
  # 
  #         IO.constants.include? "SEEK_SET"          #=> true
  #         IO.constants.include? "SEEK_NO_FURTHER"   #=> false
  # 
  def member?(arg0)
  end

  # ---------------------------------------------------- Enumerable#include?
  #      enum.include?(obj)     => true or false
  #      enum.member?(obj)      => true or false
  # ------------------------------------------------------------------------
  #      Returns +true+ if any member of _enum_ equals _obj_. Equality is
  #      tested using +==+.
  # 
  #         IO.constants.include? "SEEK_SET"          #=> true
  #         IO.constants.include? "SEEK_NO_FURTHER"   #=> false
  # 
  def include?(arg0)
  end

  # -------------------------------------------------------- Enumerable#sort
  #      enum.sort                     => array
  #      enum.sort {| a, b | block }   => array
  # ------------------------------------------------------------------------
  #      Returns an array containing the items in _enum_ sorted, either
  #      according to their own +<=>+ method, or by using the results of the
  #      supplied block. The block should return -1, 0, or +1 depending on
  #      the comparison between _a_ and _b_. As of Ruby 1.8, the method
  #      +Enumerable#sort_by+ implements a built-in Schwartzian Transform,
  #      useful when key computation or comparison is expensive..
  # 
  #         %w(rhea kea flea).sort         #=> ["flea", "kea", "rhea"]
  #         (1..10).sort {|a,b| b <=> a}   #=> [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
  # 
  def sort
  end

  # --------------------------------------------- Enumerable#each_with_index
  #      enum.each_with_index {|obj, i| block }  -> enum
  # ------------------------------------------------------------------------
  #      Calls _block_ with two arguments, the item and its index, for each
  #      item in _enum_.
  # 
  #         hash = Hash.new
  #         %w(cat dog wombat).each_with_index {|item, index|
  #           hash[item] = index
  #         }
  #         hash   #=> {"cat"=>0, "wombat"=>2, "dog"=>1}
  # 
  def each_with_index
  end

  # ----------------------------------------------------- Enumerable#collect
  #      enum.collect {| obj | block }  => array
  #      enum.map     {| obj | block }  => array
  # ------------------------------------------------------------------------
  #      Returns a new array with the results of running _block_ once for
  #      every element in _enum_.
  # 
  #         (1..4).collect {|i| i*i }   #=> [1, 4, 9, 16]
  #         (1..4).collect { "cat"  }   #=> ["cat", "cat", "cat", "cat"]
  # 
  def collect
  end

  # -------------------------------------------------------- Enumerable#to_a
  #      enum.to_a      =>    array
  #      enum.entries   =>    array
  # ------------------------------------------------------------------------
  #      Returns an array containing the items in _enum_.
  # 
  #         (1..7).to_a                       #=> [1, 2, 3, 4, 5, 6, 7]
  #         { 'a'=>1, 'b'=>2, 'c'=>3 }.to_a   #=> [["a", 1], ["b", 2], ["c", 3]]
  # 
  def to_a
  end

  # ---------------------------------------------------- Enumerable#find_all
  #      enum.find_all {| obj | block }  => array
  #      enum.select   {| obj | block }  => array
  # ------------------------------------------------------------------------
  #      Returns an array containing all elements of _enum_ for which
  #      _block_ is not +false+ (see also +Enumerable#reject+).
  # 
  #         (1..10).find_all {|i|  i % 3 == 0 }   #=> [3, 6, 9]
  # 
  def find_all
  end

  # ------------------------------------------------------ Enumerable#inject
  #      enum.inject(initial) {| memo, obj | block }  => obj
  #      enum.inject          {| memo, obj | block }  => obj
  # ------------------------------------------------------------------------
  #      Combines the elements of _enum_ by applying the block to an
  #      accumulator value (_memo_) and each element in turn. At each step,
  #      _memo_ is set to the value returned by the block. The first form
  #      lets you supply an initial value for _memo_. The second form uses
  #      the first element of the collection as a the initial value (and
  #      skips that element while iterating).
  # 
  #         # Sum some numbers
  #         (5..10).inject {|sum, n| sum + n }              #=> 45
  #         # Multiply some numbers
  #         (5..10).inject(1) {|product, n| product * n }   #=> 151200
  #      
  #         # find the longest word
  #         longest = %w{ cat sheep bear }.inject do |memo,word|
  #            memo.length > word.length ? memo : word
  #         end
  #         longest                                         #=> "sheep"
  #      
  #         # find the length of the longest word
  #         longest = %w{ cat sheep bear }.inject(0) do |memo,word|
  #            memo >= word.length ? memo : word.length
  #         end
  #         longest                                         #=> 5
  # 
  def inject(arg0, arg1, *rest)
  end

  # ----------------------------------------------------- Enumerable#sort_by
  #      enum.sort_by {| obj | block }    => array
  # ------------------------------------------------------------------------
  #      Sorts _enum_ using a set of keys generated by mapping the values in
  #      _enum_ through the given block.
  # 
  #         %w{ apple pear fig }.sort_by {|word| word.length}
  #                      #=> ["fig", "pear", "apple"]
  # 
  #      The current implementation of +sort_by+ generates an array of
  #      tuples containing the original collection element and the mapped
  #      value. This makes +sort_by+ fairly expensive when the keysets are
  #      simple
  # 
  #         require 'benchmark'
  #         include Benchmark
  #      
  #         a = (1..100000).map {rand(100000)}
  #      
  #         bm(10) do |b|
  #           b.report("Sort")    { a.sort }
  #           b.report("Sort by") { a.sort_by {|a| a} }
  #         end
  # 
  #      _produces:_
  # 
  #         user     system      total        real
  #         Sort        0.180000   0.000000   0.180000 (  0.175469)
  #         Sort by     1.980000   0.040000   2.020000 (  2.013586)
  # 
  #      However, consider the case where comparing the keys is a
  #      non-trivial operation. The following code sorts some files on
  #      modification time using the basic +sort+ method.
  # 
  #         files = Dir["*"]
  #         sorted = files.sort {|a,b| File.new(a).mtime <=> File.new(b).mtime}
  #         sorted   #=> ["mon", "tues", "wed", "thurs"]
  # 
  #      This sort is inefficient: it generates two new +File+ objects
  #      during every comparison. A slightly better technique is to use the
  #      +Kernel#test+ method to generate the modification times directly.
  # 
  #         files = Dir["*"]
  #         sorted = files.sort { |a,b|
  #           test(?M, a) <=> test(?M, b)
  #         }
  #         sorted   #=> ["mon", "tues", "wed", "thurs"]
  # 
  #      This still generates many unnecessary +Time+ objects. A more
  #      efficient technique is to cache the sort keys (modification times
  #      in this case) before the sort. Perl users often call this approach
  #      a Schwartzian Transform, after Randal Schwartz. We construct a
  #      temporary array, where each element is an array containing our sort
  #      key along with the filename. We sort this array, and then extract
  #      the filename from the result.
  # 
  #         sorted = Dir["*"].collect { |f|
  #            [test(?M, f), f]
  #         }.sort.collect { |f| f[1] }
  #         sorted   #=> ["mon", "tues", "wed", "thurs"]
  # 
  #      This is exactly what +sort_by+ does internally.
  # 
  #         sorted = Dir["*"].sort_by {|f| test(?M, f)}
  #         sorted   #=> ["mon", "tues", "wed", "thurs"]
  # 
  def sort_by
  end

  # ----------------------------------------------------- Enumerable#entries
  #      enum.to_a      =>    array
  #      enum.entries   =>    array
  # ------------------------------------------------------------------------
  #      Returns an array containing the items in _enum_.
  # 
  #         (1..7).to_a                       #=> [1, 2, 3, 4, 5, 6, 7]
  #         { 'a'=>1, 'b'=>2, 'c'=>3 }.to_a   #=> [["a", 1], ["b", 2], ["c", 3]]
  # 
  def entries
  end

  # --------------------------------------------------------- Enumerable#max
  #      enum.max                   => obj
  #      enum.max {|a,b| block }    => obj
  # ------------------------------------------------------------------------
  #      Returns the object in _enum_ with the maximum value. The first form
  #      assumes all objects implement +Comparable+; the second uses the
  #      block to return _a <=> b_.
  # 
  #         a = %w(albatross dog horse)
  #         a.max                                  #=> "horse"
  #         a.max {|a,b| a.length <=> b.length }   #=> "albatross"
  # 
  def max
  end

  # -------------------------------------------------------- Enumerable#all?
  #      enum.all? [{|obj| block } ]   => true or false
  # ------------------------------------------------------------------------
  #      Passes each element of the collection to the given block. The
  #      method returns +true+ if the block never returns +false+ or +nil+.
  #      If the block is not given, Ruby adds an implicit block of +{|obj|
  #      obj}+ (that is +all?+ will return +true+ only if none of the
  #      collection members are +false+ or +nil+.)
  # 
  #         %w{ ant bear cat}.all? {|word| word.length >= 3}   #=> true
  #         %w{ ant bear cat}.all? {|word| word.length >= 4}   #=> false
  #         [ nil, true, 99 ].all?                             #=> false
  # 
  def all?
  end

  # ------------------------------------------------------ Enumerable#select
  #      enum.find_all {| obj | block }  => array
  #      enum.select   {| obj | block }  => array
  # ------------------------------------------------------------------------
  #      Returns an array containing all elements of _enum_ for which
  #      _block_ is not +false+ (see also +Enumerable#reject+).
  # 
  #         (1..10).find_all {|i|  i % 3 == 0 }   #=> [3, 6, 9]
  # 
  def select
  end

  # ------------------------------------------------------ Enumerable#reject
  #      enum.reject {| obj | block }  => array
  # ------------------------------------------------------------------------
  #      Returns an array for all elements of _enum_ for which _block_ is
  #      false (see also +Enumerable#find_all+).
  # 
  #         (1..10).reject {|i|  i % 3 == 0 }   #=> [1, 2, 4, 5, 7, 8, 10]
  # 
  def reject
  end

  # -------------------------------------------------------- Enumerable#grep
  #      enum.grep(pattern)                   => array
  #      enum.grep(pattern) {| obj | block }  => array
  # ------------------------------------------------------------------------
  #      Returns an array of every element in _enum_ for which +Pattern ===
  #      element+. If the optional _block_ is supplied, each matching
  #      element is passed to it, and the block's result is stored in the
  #      output array.
  # 
  #         (1..100).grep 38..44   #=> [38, 39, 40, 41, 42, 43, 44]
  #         c = IO.constants
  #         c.grep(/SEEK/)         #=> ["SEEK_END", "SEEK_SET", "SEEK_CUR"]
  #         res = c.grep(/SEEK/) {|v| IO.const_get(v) }
  #         res                    #=> [2, 0, 1]
  # 
  def grep(arg0)
  end

  # --------------------------------------------------------- Enumerable#min
  #      enum.min                    => obj
  #      enum.min {| a,b | block }   => obj
  # ------------------------------------------------------------------------
  #      Returns the object in _enum_ with the minimum value. The first form
  #      assumes all objects implement +Comparable+; the second uses the
  #      block to return _a <=> b_.
  # 
  #         a = %w(albatross dog horse)
  #         a.min                                  #=> "albatross"
  #         a.min {|a,b| a.length <=> b.length }   #=> "dog"
  # 
  def min
  end

  # --------------------------------------------------- Enumerable#partition
  #      enum.partition {| obj | block }  => [ true_array, false_array ]
  # ------------------------------------------------------------------------
  #      Returns two arrays, the first containing the elements of _enum_ for
  #      which the block evaluates to true, the second containing the rest.
  # 
  #         (1..6).partition {|i| (i&1).zero?}   #=> [[2, 4, 6], [1, 3, 5]]
  # 
  def partition
  end

  # -------------------------------------------------------- Enumerable#any?
  #      enum.any? [{|obj| block } ]   => true or false
  # ------------------------------------------------------------------------
  #      Passes each element of the collection to the given block. The
  #      method returns +true+ if the block ever returns a value other than
  #      +false+ or +nil+. If the block is not given, Ruby adds an implicit
  #      block of +{|obj| obj}+ (that is +any?+ will return +true+ if at
  #      least one of the collection members is not +false+ or +nil+.
  # 
  #         %w{ ant bear cat}.any? {|word| word.length >= 3}   #=> true
  #         %w{ ant bear cat}.any? {|word| word.length >= 4}   #=> true
  #         [ nil, true, 99 ].any?                             #=> true
  # 
  def any?
  end

  # ------------------------------------------------------ Enumerable#detect
  #      enum.detect(ifnone = nil) {| obj | block }  => obj or nil
  #      enum.find(ifnone = nil)   {| obj | block }  => obj or nil
  # ------------------------------------------------------------------------
  #      Passes each entry in _enum_ to _block_. Returns the first for which
  #      _block_ is not +false+. If no object matches, calls _ifnone_ and
  #      returns its result when it is specified, or returns +nil+
  # 
  #         (1..10).detect  {|i| i % 5 == 0 and i % 7 == 0 }   #=> nil
  #         (1..100).detect {|i| i % 5 == 0 and i % 7 == 0 }   #=> 35
  # 
  def detect(arg0, arg1, *rest)
  end

  # --------------------------------------------------------- Enumerable#map
  #      enum.collect {| obj | block }  => array
  #      enum.map     {| obj | block }  => array
  # ------------------------------------------------------------------------
  #      Returns a new array with the results of running _block_ once for
  #      every element in _enum_.
  # 
  #         (1..4).collect {|i| i*i }   #=> [1, 4, 9, 16]
  #         (1..4).collect { "cat"  }   #=> ["cat", "cat", "cat", "cat"]
  # 
  def map
  end

  # --------------------------------------------------------- Enumerable#zip
  #      enum.zip(arg, ...)                   => array
  #      enum.zip(arg, ...) {|arr| block }    => nil
  # ------------------------------------------------------------------------
  #      Converts any arguments to arrays, then merges elements of _enum_
  #      with corresponding elements from each argument. This generates a
  #      sequence of +enum#size+ _n_-element arrays, where _n_ is one more
  #      that the count of arguments. If the size of any argument is less
  #      than +enum#size+, +nil+ values are supplied. If a block given, it
  #      is invoked for each output array, otherwise an array of arrays is
  #      returned.
  # 
  #         a = [ 4, 5, 6 ]
  #         b = [ 7, 8, 9 ]
  #      
  #         (1..3).zip(a, b)      #=> [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
  #         "cat\ndog".zip([1])   #=> [["cat\n", 1], ["dog", nil]]
  #         (1..3).zip            #=> [[1], [2], [3]]
  # 
  def zip(arg0, arg1, *rest)
  end

  # -------------------------------------------------------- Enumerable#find
  #      enum.detect(ifnone = nil) {| obj | block }  => obj or nil
  #      enum.find(ifnone = nil)   {| obj | block }  => obj or nil
  # ------------------------------------------------------------------------
  #      Passes each entry in _enum_ to _block_. Returns the first for which
  #      _block_ is not +false+. If no object matches, calls _ifnone_ and
  #      returns its result when it is specified, or returns +nil+
  # 
  #         (1..10).detect  {|i| i % 5 == 0 and i % 7 == 0 }   #=> nil
  #         (1..100).detect {|i| i % 5 == 0 and i % 7 == 0 }   #=> 35
  # 
  def find(arg0, arg1, *rest)
  end

end
