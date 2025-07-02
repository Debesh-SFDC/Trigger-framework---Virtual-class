public virtual class TriggerHandler {
        private TriggerContext context;
        protected virtual void beforeInsert() {}
        protected virtual void beforeUpdate() {}
        protected virtual void beforeDelete() {}
        protected virtual void afterInsert() {}
        private  enum TriggerContext {
            BEFORE_INSERT, BEFORE_UPDATE, BEFORE_DELETE,
            AFTER_INSERT, AFTER_UPDATE, AFTER_DELETE,
            AFTER_UNDELETE
        }
        public TriggerHandler() {
            System.debug('Debug 4: Trigger handler Constructor is running...');
                this.setTriggerContext();
        }

        private void setTriggerContext(){
            System.debug(Trigger.isInsert);
            System.debug(Trigger.isUpdate);
            System.debug(Trigger.isUndelete);
            if(Trigger.isExecuting && Trigger.isbefore && Trigger.isInsert){
                this.context = TriggerContext.BEFORE_INSERT;
            }  
            else if(Trigger.isExecuting && Trigger.isbefore && Trigger.isUpdate)   {
                this.context = TriggerContext.BEFORE_UPDATE;
            } 
            else if(Trigger.isExecuting && Trigger.isbefore && Trigger.isDelete){
                this.context = TriggerContext.BEFORE_DELETE;
            }
            else if(Trigger.isExecuting && Trigger.isafter && Trigger.isInsert){}
            System.debug('Debug 5: Trigger handler SetTriggerContext() is running...'+this.context);
            }
        

        public void run(){
            System.debug('Debug 3 : Run Method of Trigger Handler is running...');
            if(this.context == TriggerContext.BEFORE_INSERT){
                this.beforeInsert();
            }
            else if(this.context == TriggerContext.BEFORE_UPDATE){
                this.beforeUpdate();
            }   
            else if(this.context == TriggerContext.BEFORE_DELETE){
                this.beforeDelete();
            }
        }


}