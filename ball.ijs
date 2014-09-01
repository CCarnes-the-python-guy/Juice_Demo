NB. =========================================================
NB. ball:
NB. Object that destroys bricks on collision
coclass 'ball'
coinsert 'entity'

NB. list of all balls
balls=: i. 0

NB. y is a boxed list, containing xywh and initial velocity
create=: 3 : 0
'xywh vel' =: y
balls=: balls , coname''
create_entity_ f. xywh
)

destroy=: 3 : 0
destroy_entity_ f. ''
balls=: balls -. coname''
codestroy''
)