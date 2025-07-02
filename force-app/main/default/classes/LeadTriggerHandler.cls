public with sharing class LeadTriggerHandler extends TriggerHandler {
    List<Lead> newLeads;

    public LeadTriggerHandler() {
        System.debug('Debug 2: Lead Handler contructor is running...');
        newLeads = (List<Lead>) Trigger.new;
    }

    public  override void beforeInsert(){
        System.debug('Debug 6: Lead Trigger handler beforeInsert is running...');

        
    }
}
