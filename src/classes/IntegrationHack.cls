/********************************************************************************
Name:  IntegrationHack
Copyright © 2012  FH
======================================================
======================================================
********************************************************************************/
global with sharing class IntegrationHack {
	private static String endPoint = 'http://cs12london.herokuapp.com';

	@future (callout=true)
	public static void sendOpp(String str) {
		HttpRequest thisHttpRequest = new HttpRequest();
		thisHttpRequest.setEndPoint(endPoint);
		thisHttpRequest.setMethod('POST');

		thisHttpRequest.setBody(str);

		thisHttpRequest.setHeader('Content-Type', 'application/json');

		thisHttpRequest.setTimeout(10000);


		Http thisHttp = new Http();
		HttpResponse thisHttpResponse = thisHttp.send(thisHttpRequest);

		System.Debug('===>' + thisHttpResponse.getBody());
	}

	public class MyOpp {
		public String Name;
		public String Id;
		public String Amount;

		public MyOpp(Opportunity opp) {
			this.Name = opp.Name;
			this.Id = opp.Id;
			this.Amount = String.ValueOf(opp.Amount);
		}
	}

}