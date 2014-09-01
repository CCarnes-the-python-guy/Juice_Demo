NB. =========================================================
NB. util

NB. returns nanoseconds since start of session
nanoTime=: (10^9) * 6!:1

NB. verb u unless y is empty
butifnull =: 2 : 'v"_`u@.(*@#@])'

NB. Utilities for managing objects and locales
NB. loc creates versions of command x localized to each boxed locale in y
NB. from executes said commands
NB. inl ("in locale") executes command x in each boxed locale from y

loc_z_=: (,&'_'@[ ,&'_'@, ":@>@])"1 0
from_z_=: ".@:loc
inl_z_ =: (cocurrent@] ".@] [)"1 0