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
balls_ball_=: balls_ball_ , coname''
create_entity_ f. xywh
)

destroy=: 3 : 0
destroy_entity_ f. ''
balls_ball_=: balls_ball_ -. coname''
codestroy''
)

tick=: 3 : 0
setXywh xywh + vel , 0 , 0
NB. Collision with canvas boundaries
if. (0 > {. xywh) +. (WIDTH_pjuicedemo_ < +/ 0 2 { xywh) do.
vel=: vel * _1 1
end.
if. (0 > 1 { xywh) +. (HEIGHT_pjuicedemo_ < +/ 1 3 { xywh) do. 
vel=: vel * 1 _1
end.
otherCollisions=: (collidesWith) butifnull (0&[) entities_entity_ -. coname''
vel=: vel * */ <: +: -. (((|. @: (+./"1)) *. (xor_pjuicedemo_"1))"2) 2 2 $"1 otherCollisions
EMPTY
)

NB. pass in xywh
setXywh=: 3 : 0
xywh_entity_ =: xywh =: y
)