
# End-term Programming - Tasks

# For mark 2:

Place cells on the main diagonal of the matrix by the Init and start one virus from the (2,7) point which moves with the distance vector (1,0). The virus moves until exits the territory or meets a cell and infects it. The output is:
```
Virus is at 2,7
Virus is at 3,7
Virus is at 4,7
Virus is at 5,7
Virus is at 6,7
Virus is at 7,7 infects!
```

# For mark 3:

Create more viruses with discriminants with their initial coordinate and the distance vector when it moves. Start 3 viruses one from (2,7) point distance vector (1,0), one from (2,3) point with (1,1) distance vector and one form (10,2) point with (-1,0) distance vector. Create cells in points where a coordinate is a divisor of the other. A possible output is:

```
Virus is at 2,7
Virus is at 2,3
Virus is at 10,2 infects!
Virus is at 3,7
Virus is at 3,4
Virus is at 4,7
Virus is at 4,5
Virus is at 5,7
Virus is at 5,6
Virus is at 6,7
Virus is at 6,7
Virus is at 7,7 infects!
Virus is at 7,8
Virus is at 8,9
Virus is at 9,10

```

# For mark 4:

The cells try to defend themselves against some of the infections, using a random Boolean to decide if a cell will be infected or not, each time a virus moves into it. The viruses are reproductive, i.e. when they infect a cell then they create a new virus (this causes 0.5 delay in their movement). Start the same 3 viruses.

 Hint: use access type and create dynamically a new virus inside the Virus task. For this you have to introduce a type synonym to the Virus task type (subtype Virus_Type is Virus;) and use that in the pointer type and in the new expressions when creating pointers. The original virus should move as earlier; the new virus should move in opposite direction. If the parent moved with (DX, DY) distance vector, then the child should move with (DY, -DX) distance vector. Then cells that are infected should die, i.e. that component becomes False. A part of possible output is:

```
Virus is at 10,2 infects!
Virus is at 2,7
Virus is at 2,3 Couldn't infect!
Virus is at 3,4
Virus is at 3,7 Couldn't infect!
Virus is at 4,5 Couldn't infect!
..

```

# For mark 5:

Create an Immune_System task, which destroys viruses and lives as long as the viruses are calling it. It has an Antibodies entry, and can accept calls after 0.2 seconds. If nobody calls, then it terminates. The viruses, between two moving, can hit antibodies (calling the Antibodies entry with the 0.1 timed call). If the rendez-vous is successful, then they are destroyed and finish their activities.

Have fun with programming!



