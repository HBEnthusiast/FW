*-- FUNCTION WaitUntil(Day_s, Time_s)-----------------------------------------
*         Name: WaitUntil(Day_s, Time_s)             Docs:            
*  Description: Sleeps until a specified Day and Time       
*       Author: HBExplorer        
* Date created: 01/5/2021              Date updated: 01/5/2021    
* Time created: 10:39:51AM            Time updated: 10:39:51AM  
*    Copyright: HBExplorer 2021           
*-----------------------------------------------------------------------------
*    Arguments: Day_s                          Day of Week e.g. Monday, Wednesday, Sunday
*             : Time_s                   Time to sleep until e.g. 13:15, 12:00, 23:59
* Return Value: (.T.)    
*-----------------------------------------------------------------------------
Function WaitUntil( Day_s, Time_s )
Local Target_Time_in_Seconds_n := 0
Local Target_Array_a := {}
Local CurrentDate_d := DATE()
Local CurrentTime_s := TIME()
Local NextDate_d

NextDate_d := Get_Future_Date_From_DayofWeek( Day_s )
Target_Array_a := FT_Elapsed( CurrentDate_d, NextDate_d, CurrentTime_s, Time_s )
Target_Time_in_Seconds_n := Target_Array_a[ 4, 2 ]

FT_Sleep( Target_Time_in_Seconds_n )
	  
Return Nil


*-- FUNCTION Get_Day_Number(Day_s)--------------------------------------------
*         Name: Get_Day_Number(Day_s)      Docs:            
*  Description: Get Number of Day of Week, from Day Name
*       Author: HBExplorer        
* Date created: 01/5/2021              Date updated: 01/5/2021    
* Time created: 12:51:32PM            Time updated: 012:51:32PM  
*    Copyright: HBExplorer 2021
*-----------------------------------------------------------------------------
*    Arguments: Day_s                        
* Return Value: Nth_Day_n        
* 
*-----------------------------------------------------------------------------
Function Get_Day_Number(Day_s)
Local Nth_Day_n := 0
Local Days_a := { ;
						"Sunday", ;
						"Monday", ;
						"Tuesday", ;
						"Wednesday", ;
						"Thursday", ;
						"Friday", ;
						"Saturday" ;
								}

Nth_Day_n := AScan( Days_a, Day_s )
	  
Return Nth_Day_n




*-- FUNCTION Get_Future_Date_From_DayofWeek(Day_s) ---------------------------
*         Name: Get_Future_Date_From_DayofWeek()Writer}
*  Description: Return the Date from a Day of the Week
*  If today is 01/10 Wednesday, then Get_Future_Date_From_DayofWeek( "Thursday" ) is 01/11.
*  If today is 01/10 Wednesday, then Get_Future_Date_From_DayofWeek( "Monday" ) is 01/15.
*        
*       Author: HBExplorer        
* Date created: 1/5/2021              Date updated: 01/5/2021    
* Time created: 2:22:57PM             Time updated: 02:22:57PM   
*    Copyright: HBExplorer 2021
*-----------------------------------------------------------------------------
* Arguments: Day_s                        
* Return Value: NextDate_d
*
*-----------------------------------------------------------------------------

Function Get_Future_Date_From_DayOfWeek(Day_s)

Local Current_Date_d := DATE()
Local Current_Day := ""
Local Current_Day_Number_n := 0
Local NextDate_d	 
Local Next_Day_Number_n := 0
Local Number_of_Days_n := 0

Current_Day_Number_n := Dow( Current_Date_d )
Next_Day_Number_n := Get_Day_Number(Day_s)

If	Next_Day_Number_n < Current_Day_Number_n
	Number_of_Days_n := 7-(Current_Day_Number_n-Next_Day_Number_n)
Else 
	Number_of_Days_n := Next_Day_Number_n-Current_Day_Number_n
Endif

NextDate_d := Current_Date_d + Number_of_Days_n

Return NextDate_d




