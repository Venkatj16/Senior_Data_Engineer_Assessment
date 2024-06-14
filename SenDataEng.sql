-- 14-Jun-2024 - VRP - Initial Version of Code

/*USE The Required Database*/
USE PRACTICE
GO
/*Create the Required Table*/
CREATE TABLE TrainerSchedule 
(
trainerid INT,
starttime DATETIME,
endtime DATETIME
);

/*Verify the records depending on the query*/
SELECT trainerid, starttime, endtime FROM dbo.TrainerSchedule with (nolock);

/*Insert The Rows required to Test your logic*/
INSERT INTO dbo.TrainerSchedule VALUES (1234, '2018-01-10 08:30', '2018-01-10 09:00'),
                                   (1234, '2018-01-10 08:45', '2018-01-10 09:15'),
								   (1234, '2018-01-10 09:30', '2018-01-10 10:00'),
								   (2345, '2018-01-10 08:45', '2018-01-10 09:15'),
								   (2345, '2018-01-10 09:30', '2018-01-10 10:00'),
								   (2345, '2018-01-10 10:50', '2018-01-10 11:00'),
								   (2345, '2018-01-10 09:50', '2018-01-10 10:00'),
								   (4345, '2018-01-10 08:45', '2018-01-10 09:15'),
								   (4345, '2018-01-10 09:05', '2018-01-10 09:25'),
								   (4345, '2018-01-10 09:10', '2018-01-10 09:30');

/*Write the Query with the Desired Output
May have Duplicates as the schedule may clash with other 2 or more schedules
If Needed, we can use DISTINCT and avoid the record   */
SELECT TrSc1.TrainerID, TrSc1.StartTime, TrSc1.EndTime
       FROM
	   dbo.TrainerSchedule TrSc1
	   INNER JOIN 
	   dbo.TrainerSchedule TrSc2
	   ON
	   TrSc1.TrainerID = TrSc2.TrainerID -- Make sure that it is matching with Trainer
	   AND 
	   TrSc1.StartTime < TrSc2.EndTime
	   AND
	   TrSc1.EndTime > TrSc2.StartTime
	   AND
	   TrSc1.StartTime <> TrSc2.StartTime
	   WHERE TrSc1.StartTime > TrSc2.StartTime
	   ORDER  BY TrSc1.TrainerID; -- We can use if there are a large number of records


