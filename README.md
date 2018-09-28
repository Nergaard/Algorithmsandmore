# Algorithms

## Algorithms in code
Tasks related to algorithms. 
Mainly written in Julia.
Will by time try to write an example of the most popular and effective algorithms for further use.

### Tasks 
#### Oving 6
This task asks you to find the "lightest" path from the top of a matrix to the bottom.
You can only go straight down or one diagonaly to the right or left.
If the values are the same weight the value to the left is the standard choice.

Takes a matrix with values as argument.

The first function "cumulative" strats at the top and calculates tha weight of the path from it to any of the allowd nodes below it.
This repeates until it has reached the bottom.

The second function "back_track" starts at the bottom row at the smallest value.
It follows the rules defined and finds the shortest path from bottom to top.
Inductively this is also the shortest path from top to bottom.

## Theory about algorithms
General theory about algorithms.
- Overview of big-O.
- Introduction to algorithms and computer structures.
- Notes about using algorithms effectively in software development. 
