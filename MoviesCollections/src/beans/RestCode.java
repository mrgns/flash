package beans;

import org.springframework.web.client.RestTemplate;

public class RestCode {
	
	public String getRestData(String imdb_id)
	{
		 
		 final String uri = "http://www.omdbapi.com/?i="+imdb_id+"&apikey=2c643b7c";
		  
	     RestTemplate restTemplate = new RestTemplate();
	     String result = restTemplate.getForObject(uri, String.class);
	    int startIn =result.intern().indexOf("Poster")+9;
	    int endIn =result.intern().indexOf("Ratings")-3;
	    String url=result.substring(startIn, endIn);
	    //System.out.println(url);
	    return url;
	}
}
