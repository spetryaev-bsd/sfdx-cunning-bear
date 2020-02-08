({
	createItem  : function(component, newItem) {
        var addItemEvent = component.getEvent("addItem");
        addItemEvent.setParams({"item": newItem});
        addItemEvent.fire();
        var blankItem = JSON.parse('{"sobjectType": "Camping_Item__c"}');
        component.set("v.newItem", blankItem);
	}
})