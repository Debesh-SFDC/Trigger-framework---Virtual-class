trigger LeadTrigger on Lead (before insert,before update,after insert,before delete) {
    System.System.debug(' Debug 1: Lead trigger is running...');
    LeadTriggerHandler handler = new LeadTriggerHandler();
    handler.run();
}   