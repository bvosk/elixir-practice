# MusicalChairs

In the classic children's game Musical Chairs, children dance around a circle of
chairs until the music stops, at which point they sit down. Before each round,
some chairs are removed to prevent some children from sitting down. The children
who cannot sit are eliminated and do not play the next round.

### Problem

Given the number of children playing a single round of musical chairs and the
number of chairs they are dancing around, determine the number of children that
will be eliminated when the music stops.

### Input

For each  line there will be two positive integers, _n_ and _m_ `m ≤ n`,
representing the number of children and number of chairs, respectively, for that
round.

### Output

For each round, first output `Round #i: ` where _i_ is the current round
(starting
with `1`). Then, on the same line output `c children eliminated` where _c_
represents the number of children that were eliminated that round.

### Example Input

    1 1
    3 2
    8 4

### Example Output

    Round #1: 0 children eliminated
    Round #2: 1 children eliminated
    Round #3: 4 children eliminated
