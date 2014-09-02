NB. =========================================================
NB. brick:
NB. Object that is destroyed by ball on collision
coclass 'brick'
coinsert 'entity'

NB. List of all bricks
bricks=: i. 0

NB. y contains xywh
create=: 3 : 0
xywh =: y
bricks_brick_=: bricks_brick_ , coname''
create_entity_ f. xywh
)

destroy=: 3 : 0
destroy_entity_ f. ''
bricks_brick_=: bricks_brick_ -. coname''
codestroy''
)