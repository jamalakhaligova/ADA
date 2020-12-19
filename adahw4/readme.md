
Ada 4th homework
----

- While coronavirus has left a big effect on our lives, some people are still reckless and don't follow government restrictions to protect themselves and others against the virus.

- Let's Create a simulation to see what will happen when people are careless !

- A market of area 10X10, each cell can either be clean or infected, at the beginning when the market opens, all it's area is clean and disinfected. Customers are starting at a random cell, and after 0.5 seconds will move (left, right, up, down) randomly chosen direction.
- If direction is outside borders, they have to chose another direction within area. A Customer can infect a cell if he is infected and can get infected from a cell if it's infected, each Customer will stay in the market for 2 seconds.

- The market organizer allows only 5 customers to enter at a time, and checks each 1 second if any of the customers finished and allow another to enter (there are infinite many customers available).
- The market will be open for 1 minute, after which the organizer will ask all the customers to finish.

- All important activities should be printed by a protected monitor, and at the end write a status of infected cells (percentage of infected cells in the market (Ex: 81 percent of area is infected)), also write the number of infected customers and total customers that visited the market (Ex: 112 customers got infected out of 139 visited the market).

- Note: customers have to be created dynamically only when needed, random generators have to be protected, the organizer can be the main program, the market area has to be within protected as well, Customer receives name and is_infected as a discriminant.
- First 5 customers created should be infected, rest are not infected.
- Simulate the above market place and visitors, print all the activities that are happening.
