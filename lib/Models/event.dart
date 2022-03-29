class Event
{
  // final String eventID; // doc_id
  final String eventName;
  final String venue;
  final String creator;
  final String creatorEmail;
  final String description;
  final String joiningCode;
  final DateTime start;
  final DateTime end;
  

  Event(this.eventName, this.venue, this.creator, this.creatorEmail,
      this.description, this.joiningCode, this.start, this.end);
}
