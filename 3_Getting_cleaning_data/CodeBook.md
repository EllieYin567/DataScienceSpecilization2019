The tidy dataset generated contained three main components:
* subject (30)
* activity (6 kinds)
* different measurements (the rest of the columns) 
And the numbers showed in the dataset are the average of each measurement for each activity and each subject.
For each of the measurement, there are data from three dimension, namely X, Y and Z. Mean value (mean())and standard deviation (std()) are shown for measurements.  
Measurements include: <br/>
tBodyAcc-XYZ <br/>
tGravityAcc-XYZ <br/>
tBodyAccJerk-XYZ <br/>
tBodyGyro-XYZ <br/>
tBodyGyroJerk-XYZ <br/>
tBodyAccMag <br/>
tGravityAccMag <br/>
tBodyAccJerkMag <br/>
tBodyGyroMag <br/>
tBodyGyroJerkMag <br/>
fBodyAcc-XYZ <br/>
fBodyAccJerk-XYZ <br/>
fBodyGyro-XYZ <br/>
fBodyAccMag <br/>
fBodyAccJerkMag <br/>
fBodyGyroMag
fBodyGyroJerkMag

For a detailed description of the tidy dataset:
* Row 1 Subject, activity and measurements
* Row 2	The mean of measurements from Subject1 during LAYING
* Row 3	The mean of measurements from Subject1 during SITTING
* Row 4	The mean of measurements from Subject1 during STANDING
* Row 5	The mean of measurements from Subject1 during WALKING
* Row 6	The mean of measurements from Subject1 during WALKING_DOWNSTAIRS
* Row 7	The mean of measurements from Subject1 during WALKING_UPSTAIRS
* Row 8	The mean of measurements from Subject2 during LAYING
* Row 9	The mean of measurements from Subject2 during SITTING
* Row 10	The mean of measurements from Subject2 during STANDING
* Row 11	The mean of measurements from Subject2 during WALKING
* Row 12	The mean of measurements from Subject2 during WALKING_DOWNSTAIRS
* Row 13	The mean of measurements from Subject2 during WALKING_UPSTAIRS
* Row 14	The mean of measurements from Subject3 during LAYING
* Row 15	The mean of measurements from Subject3 during SITTING
* Row 16	The mean of measurements from Subject3 during STANDING
* Row 17	The mean of measurements from Subject3 during WALKING
* Row 18	The mean of measurements from Subject3 during WALKING_DOWNSTAIRS
* Row 19	The mean of measurements from Subject3 during WALKING_UPSTAIRS
* Row 20	The mean of measurements from Subject4 during LAYING
* Row 21	The mean of measurements from Subject4 during SITTING
* Row 22	The mean of measurements from Subject4 during STANDING
* Row 23	The mean of measurements from Subject4 during WALKING
* Row 24	The mean of measurements from Subject4 during WALKING_DOWNSTAIRS
* Row 25	The mean of measurements from Subject4 during WALKING_UPSTAIRS
* Row 26	The mean of measurements from Subject5 during LAYING
* Row 27	The mean of measurements from Subject5 during SITTING
* Row 28	The mean of measurements from Subject5 during STANDING
* Row 29	The mean of measurements from Subject5 during WALKING
* Row 30	The mean of measurements from Subject5 during WALKING_DOWNSTAIRS
* Row 31	The mean of measurements from Subject5 during WALKING_UPSTAIRS
* Row 32	The mean of measurements from Subject6 during LAYING
* Row 33	The mean of measurements from Subject6 during SITTING
* Row 34	The mean of measurements from Subject6 during STANDING
* Row 35	The mean of measurements from Subject6 during WALKING
* Row 36	The mean of measurements from Subject6 during WALKING_DOWNSTAIRS
* Row 37	The mean of measurements from Subject6 during WALKING_UPSTAIRS
* Row 38	The mean of measurements from Subject7 during LAYING
* Row 39	The mean of measurements from Subject7 during SITTING
* Row 40	The mean of measurements from Subject7 during STANDING
* Row 41	The mean of measurements from Subject7 during WALKING
* Row 42	The mean of measurements from Subject7 during WALKING_DOWNSTAIRS
* Row 43	The mean of measurements from Subject7 during WALKING_UPSTAIRS
* Row 44	The mean of measurements from Subject8 during LAYING
* Row 45	The mean of measurements from Subject8 during SITTING
* Row 46	The mean of measurements from Subject8 during STANDING
* Row 47	The mean of measurements from Subject8 during WALKING
* Row 48	The mean of measurements from Subject8 during WALKING_DOWNSTAIRS
* Row 49	The mean of measurements from Subject8 during WALKING_UPSTAIRS
* Row 50	The mean of measurements from Subject9 during LAYING
* Row 51	The mean of measurements from Subject9 during SITTING
* Row 52	The mean of measurements from Subject9 during STANDING
* Row 53	The mean of measurements from Subject9 during WALKING
* Row 54	The mean of measurements from Subject9 during WALKING_DOWNSTAIRS
* Row 55	The mean of measurements from Subject9 during WALKING_UPSTAIRS
* Row 56	The mean of measurements from Subject10 during LAYING
* Row 57	The mean of measurements from Subject10 during SITTING
* Row 58	The mean of measurements from Subject10 during STANDING
* Row 59	The mean of measurements from Subject10 during WALKING
* Row 60	The mean of measurements from Subject10 during WALKING_DOWNSTAIRS
* Row 61	The mean of measurements from Subject10 during WALKING_UPSTAIRS
* Row 62	The mean of measurements from Subject11 during LAYING
* Row 63	The mean of measurements from Subject11 during SITTING
* Row 64	The mean of measurements from Subject11 during STANDING
* Row 65	The mean of measurements from Subject11 during WALKING
* Row 66	The mean of measurements from Subject11 during WALKING_DOWNSTAIRS
* Row 67	The mean of measurements from Subject11 during WALKING_UPSTAIRS
* Row 68	The mean of measurements from Subject12 during LAYING
* Row 69	The mean of measurements from Subject12 during SITTING
* Row 70	The mean of measurements from Subject12 during STANDING
* Row 71	The mean of measurements from Subject12 during WALKING
* Row 72	The mean of measurements from Subject12 during WALKING_DOWNSTAIRS
* Row 73	The mean of measurements from Subject12 during WALKING_UPSTAIRS
* Row 74	The mean of measurements from Subject13 during LAYING
* Row 75	The mean of measurements from Subject13 during SITTING
* Row 76	The mean of measurements from Subject13 during STANDING
* Row 77	The mean of measurements from Subject13 during WALKING
* Row 78	The mean of measurements from Subject13 during WALKING_DOWNSTAIRS
* Row 79	The mean of measurements from Subject13 during WALKING_UPSTAIRS
* Row 80	The mean of measurements from Subject14 during LAYING
* Row 81	The mean of measurements from Subject14 during SITTING
* Row 82	The mean of measurements from Subject14 during STANDING
* Row 83	The mean of measurements from Subject14 during WALKING
* Row 84	The mean of measurements from Subject14 during WALKING_DOWNSTAIRS
* Row 85	The mean of measurements from Subject14 during WALKING_UPSTAIRS
* Row 86	The mean of measurements from Subject15 during LAYING
* Row 87	The mean of measurements from Subject15 during SITTING
* Row 88	The mean of measurements from Subject15 during STANDING
* Row 89	The mean of measurements from Subject15 during WALKING
* Row 90	The mean of measurements from Subject15 during WALKING_DOWNSTAIRS
* Row 91	The mean of measurements from Subject15 during WALKING_UPSTAIRS
* Row 92	The mean of measurements from Subject16 during LAYING
* Row 93	The mean of measurements from Subject16 during SITTING
* Row 94	The mean of measurements from Subject16 during STANDING
* Row 95	The mean of measurements from Subject16 during WALKING
* Row 96	The mean of measurements from Subject16 during WALKING_DOWNSTAIRS
* Row 97	The mean of measurements from Subject16 during WALKING_UPSTAIRS
* Row 98	The mean of measurements from Subject17 during LAYING
* Row 99	The mean of measurements from Subject17 during SITTING
* Row 100	The mean of measurements from Subject17 during STANDING
* Row 101	The mean of measurements from Subject17 during WALKING
* Row 102	The mean of measurements from Subject17 during WALKING_DOWNSTAIRS
* Row 103	The mean of measurements from Subject17 during WALKING_UPSTAIRS
* Row 104	The mean of measurements from Subject18 during LAYING
* Row 105	The mean of measurements from Subject18 during SITTING
* Row 106	The mean of measurements from Subject18 during STANDING
* Row 107	The mean of measurements from Subject18 during WALKING
* Row 108	The mean of measurements from Subject18 during WALKING_DOWNSTAIRS
* Row 109	The mean of measurements from Subject18 during WALKING_UPSTAIRS
* Row 110	The mean of measurements from Subject19 during LAYING
* Row 111	The mean of measurements from Subject19 during SITTING
* Row 112	The mean of measurements from Subject19 during STANDING
* Row 113	The mean of measurements from Subject19 during WALKING
* Row 114	The mean of measurements from Subject19 during WALKING_DOWNSTAIRS
* Row 115	The mean of measurements from Subject19 during WALKING_UPSTAIRS
* Row 116	The mean of measurements from Subject20 during LAYING
* Row 117	The mean of measurements from Subject20 during SITTING
* Row 118	The mean of measurements from Subject20 during STANDING
* Row 119	The mean of measurements from Subject20 during WALKING
* Row 120	The mean of measurements from Subject20 during WALKING_DOWNSTAIRS
* Row 121	The mean of measurements from Subject20 during WALKING_UPSTAIRS
* Row 122	The mean of measurements from Subject21 during LAYING
* Row 123	The mean of measurements from Subject21 during SITTING
* Row 124	The mean of measurements from Subject21 during STANDING
* Row 125	The mean of measurements from Subject21 during WALKING
* Row 126	The mean of measurements from Subject21 during WALKING_DOWNSTAIRS
* Row 127	The mean of measurements from Subject21 during WALKING_UPSTAIRS
* Row 128	The mean of measurements from Subject22 during LAYING
* Row 129	The mean of measurements from Subject22 during SITTING
* Row 130	The mean of measurements from Subject22 during STANDING
* Row 131	The mean of measurements from Subject22 during WALKING
* Row 132	The mean of measurements from Subject22 during WALKING_DOWNSTAIRS
* Row 133	The mean of measurements from Subject22 during WALKING_UPSTAIRS
* Row 134	The mean of measurements from Subject23 during LAYING
* Row 135	The mean of measurements from Subject23 during SITTING
* Row 136	The mean of measurements from Subject23 during STANDING
* Row 137	The mean of measurements from Subject23 during WALKING
* Row 138	The mean of measurements from Subject23 during WALKING_DOWNSTAIRS
* Row 139	The mean of measurements from Subject23 during WALKING_UPSTAIRS
* Row 140	The mean of measurements from Subject24 during LAYING
* Row 141	The mean of measurements from Subject24 during SITTING
* Row 142	The mean of measurements from Subject24 during STANDING
* Row 143	The mean of measurements from Subject24 during WALKING
* Row 144	The mean of measurements from Subject24 during WALKING_DOWNSTAIRS
* Row 145	The mean of measurements from Subject24 during WALKING_UPSTAIRS
* Row 146	The mean of measurements from Subject25 during LAYING
* Row 147	The mean of measurements from Subject25 during SITTING
* Row 148	The mean of measurements from Subject25 during STANDING
* Row 149	The mean of measurements from Subject25 during WALKING
* Row 150	The mean of measurements from Subject25 during WALKING_DOWNSTAIRS
* Row 151	The mean of measurements from Subject25 during WALKING_UPSTAIRS
* Row 152	The mean of measurements from Subject26 during LAYING
* Row 153	The mean of measurements from Subject26 during SITTING
* Row 154	The mean of measurements from Subject26 during STANDING
* Row 155	The mean of measurements from Subject26 during WALKING
* Row 156	The mean of measurements from Subject26 during WALKING_DOWNSTAIRS
* Row 157	The mean of measurements from Subject26 during WALKING_UPSTAIRS
* Row 158	The mean of measurements from Subject27 during LAYING
* Row 159	The mean of measurements from Subject27 during SITTING
* Row 160	The mean of measurements from Subject27 during STANDING
* Row 161	The mean of measurements from Subject27 during WALKING
* Row 162	The mean of measurements from Subject27 during WALKING_DOWNSTAIRS
* Row 163	The mean of measurements from Subject27 during WALKING_UPSTAIRS
* Row 164	The mean of measurements from Subject28 during LAYING
* Row 165	The mean of measurements from Subject28 during SITTING
* Row 166	The mean of measurements from Subject28 during STANDING
* Row 167	The mean of measurements from Subject28 during WALKING
* Row 168	The mean of measurements from Subject28 during WALKING_DOWNSTAIRS
* Row 169	The mean of measurements from Subject28 during WALKING_UPSTAIRS
* Row 170	The mean of measurements from Subject29 during LAYING
* Row 171	The mean of measurements from Subject29 during SITTING
* Row 172	The mean of measurements from Subject29 during STANDING
* Row 173	The mean of measurements from Subject29 during WALKING
* Row 174	The mean of measurements from Subject29 during WALKING_DOWNSTAIRS
* Row 175	The mean of measurements from Subject29 during WALKING_UPSTAIRS
* Row 176	The mean of measurements from Subject30 during LAYING
* Row 177	The mean of measurements from Subject30 during SITTING
* Row 178	The mean of measurements from Subject30 during STANDING
* Row 179	The mean of measurements from Subject30 during WALKING
* Row 180	The mean of measurements from Subject30 during WALKING_DOWNSTAIRS
* Row 181	The mean of measurements from Subject30 during WALKING_UPSTAIRS




