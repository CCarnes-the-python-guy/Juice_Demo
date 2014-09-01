NB. =========================================================
NB. entity:
NB. Any rectangular object on the screen
coclass 'entity'

NB. y is the rectangle's xywh
create=: 3 : 0
xywh=: y
)

destroy=: codestroy

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