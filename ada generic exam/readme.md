#Generic programming mid-term exam
For each mark create a directory and place the solution for that mark in there (e.g. /2 for mark 2, /3 for mark 3 etc.) Submit in a .zip only source files: .adb, .ads files and the connected .gpr project file. Please delete the .o, .exe etc. files. Only individually solved files are corrected and considered for marking, same files will be discarded.

Implement the generic package of a priority queue. The queue contains priority-data pairs. The generic parameters are:

Any discrete type (this will be the priority).
Any elementary type (this will be the data part).
A “<” operator on the priority type, which can be default as well.
Implement the PQueue type as private type with a discriminant, which represents the maximum capacity of the priority queue.

#For mark 2.
Implement in pqueue_type.ads file the generic specification.
Implement the Insert and Get operations.
Insert will put an element in the queue, a priority-data pair, such that the highest priority will be the first and then it is decreasingly ordered by priority.

Get returns the pair with the highest priority, but does not delete it from queue, a Boolean parameter indicates if the operation is successful; it is false when we search in an empty queue.

The operations are:

	procedure Insert ( PQ : in out PQueue; P : in Priority; D : in Data ); 
	procedure Get ( PQ : in PQueue; P : out Priority; D : out Data; Found : out Boolean ); 
In demo program test extensively every operation of the priority queue.

#For mark 3.
Previous operations and additionally:

Implement the Remove and Size operations.
Remove deletes and returns the highest priority pair, a Boolean parameter indicates if the operation is successful; it is false when we delete from an empty queue.

Size returns the number of pairs in the queue.

The operations are:

	procedure Remove (PQ : in out PQueue; P : out Priority; D : out Data; Found : out Boolean); 
	function Size (PQ : PQueue) return Integer; 
In demo program test extensively every operation of the priority queue.

#For mark 4.
Previous operations and additionally:

Overload the "<" operator such that, if P and Q are priority queues, then P < Q is true if the highest priority of P is smaller than the highest priority of Q.

Overload the "+" operator such that it computes the union of two priority queues.

If a data is in both with same priority, then it appears only once in the union.

Remark: it can be assumed that the max capacity of the queues is the same.

In demo program test extensively every operation of the priority queue.

#For mark 5.
Previous operations and additionally:

Create a generic procedure ForEach inside the package, which performs an Action generic parameter procedure (with priority and data parameters) on every element of the priority queue.

In demo program test extensively every operation of the priority queue and print the content of a priority queue based on the generic procedure.

Good luck!

