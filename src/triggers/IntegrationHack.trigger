trigger IntegrationHack on Opportunity (after update) {
	Opportunity opp = trigger.new.get(0);
	if(opp.StageName == 'Closed Won')
		IntegrationHack.sendOpp(JSON.serialize(new IntegrationHack.MyOpp(opp)));
}