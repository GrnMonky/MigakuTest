Things to Note:
- The animations are not exactly 1:1. I slowed them down to highlight that they are animations.
- Clicking the '->' button switches to using the GitHub API, demonstrating the use of a real API.

Known Issues to Fix:
- The large button is not perfect. It frustrates me, and I would like to perfect it with more time.
- Networking could be cleaner, and overall the code could benefit from some refactoring, comments, etc.
- Many more things could be made adjustable through the theming, I added a few as demonstration for now.
- The GTMaru font I found (Apple doesn't seem to like .woff fonts) is not the same as the design hence the a in the Big button.

Decisions I Made:
- I assumed that the inverted appearance of the top "Study" button in the popup is the when pressed state. So, I made the press animation on all buttons match the top button. It also uses an inverse mask instead of a gradient, unlike the design.
