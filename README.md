
Salesforce Trigger Framework using Virtual Classes
==================================================

Step 1: Create Base Trigger Handler Class
-----------------------------------------

- Create an abstract base class to handle triggers.
- Define methods for each trigger event and pass trigger variables as parameters.

Example:

public abstract class TriggerHandler {
    public virtual void beforeInsert(SObject[] newList) {}
    public virtual void beforeUpdate(SObject[] newList, SObject[] oldList) {}
    public virtual void afterInsert(SObject[] newList) {}
    public virtual void afterUpdate(SObject[] newList, SObject[] oldList) {}
    public virtual void beforeDelete(SObject[] oldList) {}
    public virtual void afterDelete(SObject[] oldList) {}
}

--------------------------------------------------

Step 2: Create Object-Specific Trigger Handlers
-----------------------------------------------

- Create a trigger handler class specific to each object by extending the base trigger handler class.

Example:

public class AccountTriggerHandler extends TriggerHandler {
    public override void beforeInsert(SObject[] newList) {
        // Account specific logic before insert
    }
}

Framework Design:

Framework Class (TriggerHandler - Abstract Class)
        ↑
  Object Trigger Handler (extends Framework)
        ↑
   Object Trigger

--------------------------------------------------

Concepts Explained
------------------

Virtual Class / Virtual Methods:
- Used to allow child classes to override methods.
- You must define the class as virtual if you want to have virtual methods inside it.

Private vs Protected:
- Private variables/methods cannot be accessed in extended classes.
- Protected variables/methods can be accessed in child classes.

Method Overloading:
- Multiple methods with the same name but different parameters.
- Depending on parameters passed, the respective method is called.

--------------------------------------------------

Step 3: Order of Execution
--------------------------

1. Object Trigger fires
2. Calls Handler Constructor
3. Handler’s setTriggerContext() method sets the current context/event.
4. Calls Object Handler’s Constructor
5. Calls the overridden method in the object’s handler class based on event type.

Detailed Flow:

Object Trigger
   ↓
Handler Constructor
   ↓
Handler's setTriggerContext()
   ↓
Object Handler's Constructor
   ↓
Overridden method of Object Handler

- Trigger: One per object.
- Handler Constructor: Constructs framework class.
- setTriggerContext: Sets trigger context (beforeInsert, afterInsert, etc).
- Object Handler Constructor: Constructs object-specific handler class.
- Overridden method: Executes the logic for that trigger event.

--------------------------------------------------

This framework ensures:
- Reusability
- Clean separation of logic
- Scalability for large Salesforce orgs

--------------------------------------------------

