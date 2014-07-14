Ruby mission 2
=======

##Compare recursive & iterative functions for large integer values and document your findings.##
-----
**A. Working**
- Recursive function is a function which give calls to "own self" to find solution. And it keep calls until it reaches to "basis case" (whose answer is basic and known previously. i.e fibo(1)=1 and fibo(0)=0 ) , which can be called as break point.
- Iterative functions have "loop" in heart. It repeats code (by means of loop like for, while etc) to find solution.

**B. Memory usage** (effective factor for large integer value)
- Recursive function calls to self (logically) but  for memory allocator its ultimately a 'another' function which is called. So now Activation Record is created for new function with its parameter,variable values and return point (where to return after work is done). Such Activation record is stacked up. The new Activation Record (and so memory occupied) is created each time when function call occurs. If the 'n' is larger, it may create a big stack which occupy memory beyond available memory.
- Iterative function use same variable through out execution. Instead of creating "new" variable with fresh memory, it over write the previously used variable. So it saves space.

**C. Applicability**
- Both approaches are applicable to most of problem. 
- Recursion is much useful for non-linear data structure i.e tree. and its better to use Iterative approach for liner problems i.e Factorial,  Fibonacci.
- There are some problems where "backtracking" of value is required. Iteration approach is not applicable for such problems because it over write the variable so it losses original value. So Recursion approach is useful as it contains separate Activation Record for each call. 

##Try to print the series from within the fibo(n) & fibo_rec(n) functions and document your findings.##
----
-As Fibonacci problem is linear ,its straight forward to print series using fibo(n). At the end of one iteration, we have one Fibonacci number, simply print it before that value is over written by program. 
-For fibo_rec() and funk_rec() functions there are two options:
- 1. To call funk_rec() for 0..n and print result after each iteration. In this approach, function calls will be multiplied so many times. But it will give accurate answer which is not case with another option.
- 2. To maintain a global_variable (array) which I have implemented.unlike printing Fibonacci value per iteration in iterative approach, we can not print Fibonacci value per Activation Record. The reason is there are many Activation records which contain same parameter values. So an global array was maintained, each Activation Record was writing/Over-writing 'n' th Fibonacci value on 'n' th index of array. Finally Array was printed, which contains 'n' Fibonacci values. In this option function will be called very less time than above option. acll  but drawback with this approach is , if some code cause change in the value of Global variable, this code get failed.

## Identify and explain the image at the top.##
----
![Golden Ractangle][1]


  -This is one of the amazes of maths. The Number you can find in figure is making Fibonacci series.  
  - Each consecutive numbers' pair's ratio is always 1.6......say of ...13/8,8/5,5/3....which is called "golden ration"
  - There are many applications of this ration. 
      - Shell follows golden ration in its structure
          - ![Golden ration in shell][2]
      - Perfection of face built is also measured on bases of golden ration.
      ![Face perfection by Golden Ratio][3]
      - It is found design using golden ratio is more appealing then others. So many organizations uses it to design their logo.
      ![Apple Logo][4]
      ![Twitter logo][5]
      ![Pepsi logo][6]
      ![enter image description here][7]
-Still there are many complex mathematics theoris in which golden ratio is useful.

  [1]: https://camo.githubusercontent.com/a777f70f50dca96fdd3bd036135255d122148e0d/687474703a2f2f666330352e64657669616e746172742e6e65742f667337302f662f323031322f3131362f342f312f6669626f6e616363695f73706972616c5f62795f686f7034312d6434786e61326e2e6a7067
  [2]: http://worldtruth.tv/wp-content/uploads/2011/10/44136-sea_shells.jpg
  [3]: http://sciencepenguin.com/wp-content/uploads/2013/07/mona-lisa-golden-ratio.jpg
  [4]: http://www.banskt.com/blog/wp-content/uploads/2011/07/apple_logo_golden_ratio.png
  [5]: http://inventikasolutions.com/wp-content/uploads/2012/09/larrybird-11.jpg
  [6]: http://www.graphicdesign.com/wp-content/uploads/2013/07/golden-ratio08.jpg
  [7]: http://www.maltekoeditz.com/wp-content/uploads/2011/07/icloud-logo.jpeg