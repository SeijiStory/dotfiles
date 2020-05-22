#!/bin/python3
import random
absolutely = [ 
                "ABSOLUTELY", "CATEGORICALLY", "DOUBTLESSLY",
                "POSITIVELY", "UNQUESTIONABLY", "GENUINELY", "THOROUGHLY",
                "UTTERLY", "ASSUREDLY", "CONCLUSIVELY", "WHOLLY",
                "DOWNRIGHT", "DECISIVELY", "DISTINCTLY", "TERRIBLY",
                "UNEQUIVOCALLY", "UNMISTAKABLY", "INDUBITABLY",
                "UNDENIABLY" ]
disgusting = [
                "DISGUSTING", "OUTRAGEOUS", "AWFUL", "GRUESOME", "HORRIFIC",
                "OBJECTIONABLE", "REPUGNANT", "VULGAR", "ODIOUS", "ABHORRENT",
                "ATROCIOUS", "DESPICABLE", "LOATHSOME", "REPREHENSIBLE",
                "REVOLTING", "NAUESATING", "DREADFUL", "SICKENING",
                "REPULSIVE", "HORRENDOUS", "DEPRAVED", "UNHOLY", "IGNOBLE",
                "WRETCHED", "DESPISABLE", "DETESTABLE", "ABOMINABLE" ]

x = random.choice(absolutely)
y = random.choice(disgusting)
print(x + " " + y)
