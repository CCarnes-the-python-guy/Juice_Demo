NB. =========================================================
NB. init

coclass 'pjuicedemo'

coinsert 'jgl2'
NB. =========================================================
NB. main

WIDTH=: 800
HEIGHT=: 600

NB. Defines the window and canvas
WINDOW=: 0 : 'pc window; pn "Breakout"; minwh ',(":WIDTH),' ',(":HEIGHT),'; cc canvas isidraw flush;'
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
