NB. =========================================================
NB. init

coclass 'pjuicedemo'

coinsert 'jgl2'
NB. =========================================================
NB. util

nanoTime=: (10^9) * 6!:1
NB. =========================================================
NB. main:
NB. game-wide constants and functions

WIDTH=: 800
HEIGHT=: 600

TICKS_PER_SECOND=: 60

nsPerTick=: TICKS_PER_SECOND %~ 10^9
lastTick=: nanoTime''
deltaTick=: 0

NB. Defines the window and canvas
WINDOW=: 0 : 'pc window; pn "Breakout"; minwh ',(":WIDTH),' ',(":HEIGHT),'; cc canvas isidraw flush;'

sys_timer_z_=: 3 : 0
cocurrent 'pjuicedemo'
now=. nanoTime''
deltaTick=: deltaTick + (now - lastTick) % nsPerTick
lastTime=: nanoTime''

while. deltaTick >: 1 do.
tick''
deltaTick =: <: deltaTick
end.

render''
EMPTY
)

render=: 3 : 0
glclear''
glpaintx''
)

tick=: 3 : 0
EMPTY
)

window_canvas_char=: 3 : 0
if. sysdata = 'q' do.
stop''
end.
)

window_close=: 3 : 0
stop''
)

stop=: 3 : 0
wd 'timer 0'
wd 'pclose'
)
NB. =========================================================
NB. runs:
NB. verbs for running the game

run=: 3 : 0
wd WINDOW
wd 'pshow'
wd 'timer 1'
EMPTY
)

juicedemo_z_=: 3 : 0
game=. conew 'pjuicedemo'
run__game y
)
