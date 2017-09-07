trigger HospitalRoom_AddGuid on Hospital_Room__c (before insert) {

    for ( Hospital_Room__c room : Trigger.new)
    {
        room.Room_ID__c = GetGuid.generate();
    }
}