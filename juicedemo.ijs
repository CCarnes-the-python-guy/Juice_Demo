NB. =========================================================
NB. init

coclass 'pjuicedemo'

coinsert 'jgl2'
NB. =========================================================
NB. util

nanoTime=: (10^9) * 6!:1

NB. Utilities for managing objects and locales
NB. loc creates versions of command x localized to each boxed locale in y
NB. from executes said commands
NB. inl ("in locale") executes command x in each boxed locale from y

loc_z_=: (,&'_'@[ ,&'_'@, ":@>@])"1 0
from_z_=: ".@:loc
inl_z_ =: (cocurrent@] ".@] [)"1 0
NB. =========================================================
NB. entity:
NB. Any rectangular object on the screen
coclass 'entity'

NB. list of all created entities
entities=: i. 0

NB. y is the rectangle's xywh
create=: 3 : 0
xywh=: y
entities_entity_=: entities_entity_ , coname''
)

destroy=: 3 : 0
entities_entity_=: entities_entity_ -. coname''
codestroy''
)

NB. Returns four boolean values corresponding to a collision on the
NB. left, top, right, or bottom of this entity
NB. y is the other entity used in the comparison
collidesWith=: 3 : 0
'thisMin thatMin'=. 2 ({."1) xywh ,: xywh__y
smoutput thisMin
'thisMax thatMax'=. (thisMin ,: thatMin) + _2 ({."1) xywh ,: xywh__y
smoutput thisMax
'minX minY'=. (thisMin < thatMax) *. (thisMin > thatMin)
'maxX maxY'=. (thisMax > thatMin) *. (thisMax < thatMax)
minX, minY, maxX, maxY
)
NB. =========================================================
NB. main:
NB. game-wide constants and functions

cocurrent 'pjuicedemo'

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
NB. smoutput 'Frames: ' , (":frames) , ' Ticks: ' , (":ticks)
frames=: ticks =: 0
end.

EMPTY
)

NB. ---------------------------------------------------------
render=: 3 : 0
glclear''
NB. background
glfill 0 0 0
NB. draw each entity on the screen in white
glrgb 255 255 255
glbrush''
glpen 1
glrect 'xywh' from entities_entity_
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
