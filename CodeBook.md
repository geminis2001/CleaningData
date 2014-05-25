###Code Book

tidyData_MnSd.txt have this data:
1. subject : if of the volunteer. The values are from 1 to 30
2. activity: the activity that the volunteer did. values =WALKING,WALKING_UPSTAIRS,WALKING_DOWNSTAIRS,SITTING,STANDING,LAYING

the measures:

1. tBodyAcc.mean.X   : Mean for body acceleration in X
2. tBodyAcc.mean.Y   : Idem for Y mean body acceleration
3. tBodyAcc.mean.Z   : Idem for Z mean body acceleration
4. tBodyAcc.std.X    : Standard Deviation for body acceleration X
5. tBodyAcc.std.Y    : Idem for Y standard deviation
6. tBodyAcc.std.Z    : Idem for Z standard deviation
7. tGravityAcc.mean.X: Mean for gravitacional acceleration in X
8. tGravityAcc.mean.Y: Idem for Y gravitacional acceleration
9. tGravityAcc.mean.Z: Idem for Z gravitacional acceleration
10. tGravityAcc.std.X : Standard Deviation for gravitacional acceleration in X 
11. tGravityAcc.std.Y : Idem for Y gravitacional acceleration
12. tGravityAcc.std.Z : Idem for Z gravitacional acceleration
13. tBodyGyro.mean.X  : Mean for Angular velocity from the gyroscope in X
14. tBodyGyro.mean.Y  : Idem for Y Angular velocity from the gyroscope
15. tBodyGyro.mean.Z  : Idem for Z Angular velocity from the gyroscope
16. tBodyGyro.std.X   : Standard Deviation for Angular velocity from the gyroscope in X 
17. tBodyGyro.std.Y   : Idem for Y Angular velocity from the gyroscope
18. tBodyGyro.std.Z   : Idem for Z Angular velocity from the gyroscope
	
tidyData_summa.txt have summarize mean, group by subject and activity. The measures in this file are:
 
 ..*tBodyAcc.mean.X
 ..*tBodyAcc.mean.Y
 ..*tBodyAcc.mean.Z
 ..*tGravityAcc.mean.X
 ..*tGravityAcc.mean.Y
 ..*tGravityAcc.mean.Z
 ..*tBodyGyro.mean.X
 ..*tBodyGyro.mean.Y
 ..*tBodyGyro.mean.Z