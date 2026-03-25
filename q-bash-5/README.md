# Question

Write a shell script to simulate elevator dispatching logic for a 6-storey building (floors 0–6, where 0 is the ground floor) with 6 elevators (numbered 1–6).

**Access rules**:

- Even elevators (2, 4, 6) can only access even floors (0, 2, 4, 6)
- Odd elevators (1, 3, 5) can only access odd floors (0, 1, 3, 5)
- Floor 0 (ground floor) is accessible by all elevators

**Dispatching rules**:

- When a person calls from a floor, find all elevators that can access that floor
- Among those, dispatch the one closest to the called floor (by absolute distance)
- If there's a tie in distance, dispatch the one with the smallest elevator number

**Input**:

- `elevators.csv` — two columns: elevator_number, elevator_floor
- A single integer argument: the floor from which an elevator is called

**Output**:

The number of the elevator that should be dispatched

```bash
# sample elevators.csv
1,0
2,0
3,5
4,0
5,1
6,0

# script call
./script.sh 3

# output
3
```
