for /l %%x in (1, 1, 100) do (
   echo %%x
   call robot -d Results -b debug%%x.log Tests\vote.robot
   echo ---------------------------------------------------------------------
)

PAUSE