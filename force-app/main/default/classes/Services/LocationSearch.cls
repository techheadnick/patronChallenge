public with sharing class LocationSearch {

	private String apiKey;
	private String location;
	private String maxResults;

	public LocationSearch(String location){
		this.apiKey = API_KEY_VALUE;
		this.location = location;
		this.maxResults = MAX_RESULTS_VALUE;
	}

	public HttpRequest buildHttpRequest(){
		HttpRequest req = new HttpRequest();
		req.setEndpoint('callout:LocationNamedCredential'+ buildAddressRequestURL());
		req.setMethod('GET');
		return req;
	}


	private String buildAddressRequestURL(){
		Map<String, String> parms = buildParmMap();
		String requestUrl = REQUEST_URL;
		for (String key : parms.keySet()) {
			requestUrl+= key + '=' + parms.get(key) +'&';
		}
		return requestUrl;
	}

	private Map<String, String> buildParmMap(){
		Map<String, String> parms = new Map<String, String>();
		// parms.put(KEY_PARM, this.apiKey); now inside a Named Credential
		parms.put(MAX_RESULTS_PARM, this.maxResults);
		parms.put(LOCATION_PARM, EncodingUtil.urlEncode(this.location, 'UTF-8'));
		return parms;
	}

	public with sharing class LocationResponse {
        public List<LocationResult> results { get; set; }
		public String errorMessage { get; set; }
    }

	public with sharing class LocationResult {
		public List<Location> locations { get; set; }
	}

	public with sharing class Location {
		public String street  { get; set; }
		public String adminArea1  { get; set; }
		public String adminArea3  { get; set; }
		public String adminArea4  { get; set; }
		public String adminArea5  { get; set; }
		public Point latLng { get; set; }

		public String getIdentifier() {
			return (getCity() +'|'+ getState());
		}

		public String getState() {
			return adminArea3;
		}
		
		public String getCity() {
			return adminArea5;
		}

		public String getLatitude(){
			return latLng.lat;
		}

		public String getLongtitude(){
			return latLng.lng;
		}
	}

	public with sharing class Point {
		public String lat  { get; set; }
		public String lng  { get; set; }
	}

	private Static Final String API_KEY_VALUE = '',
		MAX_RESULTS_VALUE = '10',
	 	REQUEST_URL = '/geocoding/v1/address?',
		KEY_PARM = 'key',
		LOCATION_PARM = 'location',
		MAX_RESULTS_PARM = 'maxResults';
	
	public class LocationSearchException extends Exception {
	}
}