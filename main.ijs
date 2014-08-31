NB. =========================================================
NB. main:
NB. game-wide constants and functions

WIDTH=: 800
HEIGHT=: 600

TICKS_PER_SECOND=: 60

nsPerTick=: TICKS_PER_SECOND %~ 10^9
lastTime=: nanoTime''
deltaTick=: 0

NB. Counts ticks and frames per second
ticks=: 0
frames=: 0

NB. Will increment once per second, when FPS/TPS is outputted
runningTime=: 6!:1''

NB. Defines the window and canvas
WINDOW=: 0 : 'pc window; pn "Breakout"; minwh ',(":WIDTH),' ',(":HEIGHT),'; cc canvas isidraw flush;'

NB. ---------------------------------------------------------
sys_timer_z_=: 3 : 0
cocurrent 'pjuicedemo'

now=. nanoTime''
deltaTick=: deltaTick + (now - lastTime) % nsPerTick
lastTime=: nanoTime''

while. deltaTick >: 1 do.
tick''
ticks=: >: ticks
deltaTick =: <: deltaTick
end.

render''
frames=: >: frames

if. 1 <: (6!:1'') - runningTime do.
runningTime =: >: runningTime
smoutput 'Frames: ' , (":frames) , ' Ticks: ' , (":ticks)
frames=: ticks =: 0
end.

EMPTY
)

NB. ---------------------------------------------------------
render=: 3 : 0
glclear''
glpaintx''
)

tick=: 3 : 0
EMPTY
)

NB. ---------------------------------------------------------
window_canvas_char=: 3 : 0
if. sysdata = 'q' do.
stop''
end.
)

window_close=: 3 : 0
stop''
)

NB. ---------------------------------------------------------
stop=: 3 : 0
wd 'timer 0'
wd 'pclose'
)