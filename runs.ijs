NB. =========================================================
NB. runs:
NB. verbs for running the game

run=: 3 : 0
wd WINDOW
wd 'pshow'
NB. wd 'timer 1'
glclear''
glpaintx''
EMPTY
)

juicedemo_z_=: 3 : 0
game=. conew 'pjuicedemo'
run__game y
)