class Attendance
{
  final String eventID;
  final String eventName;
  final String attendeeID;
  final DateTime signInTime;
  final DateTime signOutTime;

  Attendance(this.eventID,this.eventName, this.attendeeID, this.signInTime, this.signOutTime);
}