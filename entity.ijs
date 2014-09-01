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
NB. left, right, top, or bottom of this entity
NB. y is the other entity used in the comparison
collidesWith=: 3 : 0"0
'thisMin thatMin'=. 2 ({."1) xywh ,: xywh__y
'thisMax thatMax'=. (thisMin ,: thatMin) + _2 ({."1) xywh ,: xywh__y
'minX minY'=. (thisMin < thatMax) *. (thisMin > thatMin)
'maxX maxY'=. (thisMax > thatMin) *. (thisMax < thatMax)
minX, maxX, minY, maxY
)