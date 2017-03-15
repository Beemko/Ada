PACKAGE Ada.Calendar IS
 
  -- standard Ada package, must be supplied with compilers
  -- provides useful services for dates and times. We have
  -- changed the formatting and added comments, but the
  -- specifications are exactly as given in the standard.
 
  -- type definitions
 
  TYPE Time IS PRIVATE;
 
  SUBTYPE Year_Number  IS Integer  RANGE 1901..2099;
  SUBTYPE Month_Number IS Integer  RANGE 1..12;
  SUBTYPE Day_Number   IS Integer  RANGE 1..31;
  SUBTYPE Day_Duration IS Duration RANGE 0.0..86_400;
  -- Duration is a predefined (standard) fixed-point type;
  -- Day_Duration range is the number of seconds in 24 hours
 
  -- constructor operation
 
  -- constructs a Time value from its components; note that the
  -- default for Seconds is 0.0, so if Seconds value isn't given,
  -- the time is assumed to be at midnight
 
  FUNCTION Time_Of (Year : Year_Number;
                   Month : Month_Number;
                   Day   : Day_Number;
                   Seconds  : Day_Duration:=0.0) RETURN Time;
 
  -- selector operations
 
  FUNCTION Year  (Date : Time)  RETURN Year_Number;
  FUNCTION Month (Date : Time)  RETURN Month_Number;
  FUNCTION Day  (Date : Time)   RETURN Day_Number;
  FUNCTION Seconds (Date : Time) RETURN Day_Duration;
 
  -- splits a Time value into its component parts
 
  PROCEDURE Split (Date    : IN  Time;
                  Year     : OUT Year_Number;
                  Month    : OUT Month_Number;
                  Day      : OUT Day_Number;
                  Seconds  : OUT Day_Duration);
 
  -- read the computer's clock to get the current time of day
 
  FUNCTION Clock RETURN Time;
 
  -- arithmetic and comparison operations
 
  -- note that only the "sensible" operations are defined.
  -- this is possible because Time is a private type with no
  -- predefined operations except := and =
 
  FUNCTION "<"  (Left, Right : Time)      RETURN Boolean;
  FUNCTION "<=" (Left, Right : Time)      RETURN Boolean;
  FUNCTION ">"  (Left, Right : Time)      RETURN Boolean;
  FUNCTION ">=" (Left, Right : Time)      RETURN Boolean;
 
  FUNCTION "+" (Left : Time;     Right : Duration)  RETURN Time;
  FUNCTION "+" (Left : Duration; Right : Time)      RETURN Time;
  FUNCTION "-" (Left : Time;     Right : Duration)  RETURN Time;
  FUNCTION "-" (Left : Time;     Right : Time)      RETURN Duration;
 
  -- exported exceptions
 
  -- Time_Error is raised by Time_Of if its actual parameters
  -- don't form a proper date, and also by "+" and "-" if they
  -- can't return a date whose year number is in range,
  -- or if "-" can't return a value that is in the
  -- range of the type Duration.
 
  Time_Error : EXCEPTION;
 
PRIVATE
 
  -- implementation-dependent (the details depend on the computer's
  -- internal clock structure, and are not important because Ada.Calendar
  -- provides all the operations we need)
 
END Ada.Calendar;