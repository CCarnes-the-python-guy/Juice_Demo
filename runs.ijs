NB. =========================================================
NB. runs:
NB. verbs for running the game

run=: 3 : 0
NB. Initializing objects
leftWall=: (0 , 0 , 10 , HEIGHT - 50) conew 'entity'
topWall=: (10 , 0 , (WIDTH - 20) , 10) conew 'entity'
rightWall=: ((WIDTH - 10) , 0 , 10 , HEIGHT - 50) conew 'entity'
ball=: (((5 -~ -: WIDTH) , 500 10 10);(5 5)) conew 'ball'

wd WINDOW
wd 'pshow'
wd 'timer 1'
EMPTY
)

juicedemo_z_=: 3 : 0
game=: conew 'pjuicedemo'
run__game y
)