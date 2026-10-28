# Kic-Checkers rules

Checkers is played on an 8×8 board. Each player starts with twelve pieces on the dark squares of the three rows nearest them. Pieces move diagonally forward, one square at a time. A piece that reaches the far row becomes a king.

The game offers three rule sets. Choose one before you start.

---

## Classic

- **Capture is compulsory.** If you can jump a piece, you must.
- **Toggle** optional capture or stay as forced.
- **A jump runs to the end.** Once you start a capture, you keep jumping until you can't.
- **Kings** move one square diagonally in any direction, including backwards.

---

## Spanish

- **Capture is compulsory.** If you can jump a piece, you must. Theres a toggle for optional.
- **Toggle** optional capture or stay as forced.
- **Kings fly.** A king can move any distance along a diagonal, over empty squares.
- **The most pieces wins the capture.** If several captures are possible, you must take the sequence that captures the most pieces.

---

## Huevo Style (main focus)

Huevo Style keeps the basic game and changes the rules around capture, queens, and the clock. It was designed by HuevosKicker, with the original capture idea from Chogan issue #391.

### Capture

- **Capture is optional only.** You can always make a quiet move instead.
- **A king flies only on its first jump.** Later jumps in the same chain are short.
- **Every capture lands directly behind the piece taken.** Never farther.
- **A chain can stop after any landing.** Each landing square is a legal end point, shown as a yellow dot.

### Queens

- **Each side has one queen**, shown as a paler piece. Red's queen starts on the square at row 2, column 3, counting from 1 (index 10). Black's queen starts on row 7, column 6 (index 53).
- **A queen moves one square diagonally in any direction**, including backwards. She does not fly.
- **A queen captures like a man, in every direction.**
- **Capturing the enemy queen wins the game at once.**
- **A queen that reaches the far row becomes an empress.** Promotion ends the move.
- **An empress flies like a king on every jump.** In a capture chain, she lands directly behind each piece she takes and may stop after any landing.

### The edge timer

- **A queen or empress on an edge square has 15 turns.** The timer appears on screen.
- **The timer resets to 15 when she leaves the edge.** It continues unchanged after promotion.
- **Arriving on an edge does not start the timer.** Each later turn she stays on the edge counts down.
- **When the timer reaches 0, she must step off the edge.** If she can't, her side loses.
<!--
- **If a forced capture is available on that turn, she still has to step off.** Only the queen's own exit move is allowed while the timer is at 0.
-->
### Stuck players

- **A player with no legal move loses on piece count.** More pieces wins. Equal counts is a draw.
- **A queen or empress counts as one piece.**
- **If your only legal moves are queen or empress moves, you are stuck**, and the count decides.
<!--
except on the turn your edge timer reaches 0. That turn, the queen must step off, as described above.
-->
### Lone queen

- **A side left with only its queen or empress gets one last move.**
- **If that move captures the enemy queen, that side wins.**
- **If that move captures the enemy's last other piece, and the other side has only its queen, it is a draw.**
- **Otherwise, that side loses.**
- **Two lone queens is a draw.**

### Draws

- **Sixty plies with no capture and no move by a man** is a draw. A queen step does not count as progress, but a man moving or a capture does.

### Playing against the AI

The AI knows the queen is worth the game and keeps her off the edge. It plays by the same rules as you.

---

## Piece summary

| Piece | Moves | Captures | Notes |
|---|---|---|---|
| Man | Diagonally forward, one square | Forward, jumping one piece | Becomes a king on the far row |
| King (Classic) | One square, any diagonal | Like a man, any direction | |
| King (Spanish) | Any distance along a diagonal | Flies over empty squares | |
| King (Huevo) | Any distance, first jump only | First jump flies, later jumps short | |
| Queen (Huevo) | One square, any diagonal | Like a man, any direction | Capturing her wins the game |
| Empress (Huevo) | Flies like a king | Flies on every jump | Edge timer applies |

---

## Credits

Based on [Chogan](https://github.com/choganhq/chogan) by Margani, MIT licence. Huevo Style designed by [HuevosKicker](https://github.com/HuevosKicker).
