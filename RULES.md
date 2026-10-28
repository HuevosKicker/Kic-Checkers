# Kic-Checkers rules

Checkers is played on an 8×8 board. Each player starts with twelve pieces on the dark squares of the three rows nearest them. Pieces move diagonally forward, one square at a time. A piece that reaches the far row becomes a King.

The game offers three rule sets. Choose one before you start.

---

## Classic

- **Capture is compulsory.** If you can jump a piece, you must.
- **A jump runs to the end.** Once you start a capture, you keep jumping until you can't.
- **Kings** move one square diagonally in any direction, including backwards.

---

## Spanish

- **Capture is compulsory.** If you can jump a piece, you must.
- **Kings fly.** A King can move any distance along a diagonal, over empty squares.
- **The most pieces wins the capture.** If several captures are possible, you must take the sequence that captures the most pieces.

---

## Huevo Style

Huevo Style keeps the basic game and changes the rules around capture, Queens, the clock, and two extra pieces. It was designed by HuevosKicker, with the original capture idea from Chogan issue [#391](https://github.com/choganhq/chogan/issues/391#issuecomment-6451636233).

### Capture

- **Capture is optional,** with one exception below.
- **A King flies only on its first jump.** Later jumps in the same chain are short.
- **Every capture lands directly behind the piece taken.** Never farther.
- **A chain can stop after any landing.** Each landing square is a legal end point, shown as a yellow dot.

### Forced capture of a Jester or Joker

- **If a Jester or Joker can be captured, the side to move must capture it.** Any piece may do so, including a Jester or Joker.
- **Ordinary pieces never force a Jester or Joker to capture them.**
- **If a piece can capture the enemy Queen instead, nothing is forced.**

### Queens

- **Each side has one Queen**, shown as a paler piece, starting on the second row. Red's Queen starts on row 2, column 3, counting from 1 (index 10). Black's Queen starts on row 7, column 6 (index 53).
- **A Queen moves one square diagonally in any direction**, including backwards. She does not fly.
- **A Queen captures like a Man, in every direction.**
- **Capturing the enemy Queen wins the game at once,** even at timer 0.
- **A Queen that reaches the far row becomes an Empress.** Promotion ends the move.
- **An Empress flies like a King on every jump.** In a capture chain, she lands directly behind each piece she takes and may stop after any landing.

### The edge timer

- **A Queen or Empress on an edge square has 15 turns.** The timer appears on screen.
- **The timer resets to 15 when she leaves the edge.** It continues unchanged after promotion.
- **Arriving on an edge does not start the timer.** Each later turn she stays on the edge counts down.
- **When the timer reaches 0, she must leave the edge.** If she can't, her side loses.
- **A forced capture comes before the timer.** If a forced capture is available, the side must make it, and the timer rule is checked after that.
- **A Queen or Empress at timer 0 that moves from one edge square to another has not left the edge,** so her side loses. This also applies when another piece makes the forced capture and she stays on the edge.

### Jesters and Jokers

- **Each side has a Jester,** starting on the third row, red on square 21 and black on square 42.
- **A Jester steps and captures one square in any diagonal direction.**
- **On the far row, a Jester becomes a Joker,** which moves like a King.
- **Sleep:** each Jester starts asleep for 15 of its own side's turns. The number on it counts down. A sleeping Jester cannot move or capture. Nobody is forced to capture it, but the other side may still capture it by choice.

### Scouters and Adventurers

- **Each side has a Scouter,** starting on the third row beside the Jester, red on square 19 and black on square 44.
- **A Scouter steps one square in any diagonal direction.**
- **A Scouter's move is a chain of jumps.** Each jump passes over a piece next to it and lands right behind that piece.
- **An ally is only hopped over. An enemy is captured.** The chain can mix both, have any number of segments, and stop after any segment.
- **Each piece can be jumped at most once in one move.**
- **On the far row, a Scouter becomes an Adventurer,** which can also fly to the first piece it jumps and still lands right behind it. A jump made on the far row counts too.
- **The flight is only for the first jump of a move.** Every later jump needs a piece right next to it, like a Scouter.
- **Only the Empress can chain flying captures.**
- **A Scouter or Adventurer that can capture a Jester or Joker must do so,** under the forced-capture rule above.

### Stuck players

- **A player with no legal move loses on piece count.** More pieces wins. Equal counts is a draw.
- **A Queen, Empress, Jester, Joker, Scouter, or Adventurer counts as one piece.**
- **If your only legal moves are Queen or Empress moves, you are stuck,** and the count decides, except where the edge timer rule above applies.

### Lone Queen

- **A side left with only its Queen or Empress gets one last move.**
- **If that move captures the enemy Queen, that side wins.**
- **If that move captures the enemy's last other piece, it is a draw.**
- **Otherwise, that side loses.**
- **Two lone Queens is a draw.**

### Draws

- **Sixty plies with no capture and no Man moving is a draw.**
- Only captures and men's moves reset the count. Queen steps, Jester moves, Scouter moves that do not capture, and promotions do not.

### Playing against the AI

The AI values Queens, Scouters, and Jesters highly, and keeps its Queen off the edge when it can. It plays by the same rules as you.

---

## Piece summary

| Piece | Moves | Captures | Notes |
|---|---|---|---|
| Man | Diagonally forward, one square | Forward, jumping one piece | Becomes a King on the far row |
| King (Classic) | One square, any diagonal | Like a Man, any direction | |
| King (Spanish) | Any distance along a diagonal | Flies over empty squares | |
| King (Huevo) | Any distance | Flies on the first jump, later jumps short | Lands right behind the piece taken |
| Queen (Huevo) | One square, any diagonal | Like a Man, any direction | Capturing her wins the game |
| Empress (Huevo) | Flies like a King | Flies on every jump | Edge timer applies |
| Jester (Huevo) | One square, any diagonal | One square, any diagonal | Sleeps for 15 of its side's turns. Must be captured when possible |
| Joker (Huevo) | Flies like a King | Like a King | A promoted Jester. Must be captured when possible |
| Scouter (Huevo) | One square, any diagonal | Hops allies, captures enemies, chains | Any number of segments |
| Adventurer (Huevo) | One square, any diagonal | Flies on the first jump, then like a Scouter | A promoted Scouter |

---

## Credits

Based on [Chogan](https://github.com/choganhq/chogan) by Margani, MIT licence. Huevo Style, Jesters, Scouters, and Adventurers designed by [HuevosKicker](https://github.com/HuevosKicker).
