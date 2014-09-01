NB. =========================================================
NB. main:
NB. game-wide constants and functions

cocurrent 'pjuicedemo'

NB. Regardless of the stretching of the screen, the graphics
NB. will always be represented by coordinates of maximum value (WIDTH, HEIGHT)
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
WINDOW=: 'pc window; pn "Breakout"; '
WINDOW=: WINDOW, 'minwh ',(":WIDTH),' ',(":HEIGHT),'; '
WINDOW=: WINDOW, 'cc canvas isidraw flush; pas 0 0'

NB. ---------------------------------------------------------
sys_timer_z_=: 3 : 0
cocurrent 'pjuicedemo'

try.

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
NB. smoutput 'Frames: ' , (":frames) , ' Ticks: ' , (":ticks)
frames=: ticks =: 0
end.

catch.

wd 'timer 0'
smoutput 'Error: ' , > (<: 13!:11 '') { 9!:8 ''
smoutput 13!:12 ''

end.

EMPTY
)

NB. ---------------------------------------------------------
NB. scales xywh values in y by the width and height specified by x
convertXywh=: 4 : '(,"2) x (*"1) (WIDTH, HEIGHT) (%~"1) 2 2 ($"1) y'"1

render=: 3 : 0
glclear''
NB. background
glfill 0 0 0
NB. draw each entity on the screen in white
glrgb 255 255 255
glbrush''
glpen 1
glrect ((glqwh'')&convertXywh)butifnull(]&(0 0 0 0)) 'xywh' from entities_entity_
glpaintx''
EMPTY
)

tick=: 3 : 0
'tick''''' inl balls_ball_
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