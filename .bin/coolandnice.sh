#!/bin/python3
import random
words = [ "cool", "nice", "good", "great", "superb", "marvelous", "fine",
        "excellent", "pleasant", "neat", "splendid", "magnificent", "rad",
        "agreeable", "acceptable", "wonderful", "exceptional", "favourable",
        "swell", "nifty"
        ]
x = random.choice(words)
y = random.choice(words)
while x == y:
    x = random.choice(words)
    y = random.choice(words)
print(x + ". and " + y)
