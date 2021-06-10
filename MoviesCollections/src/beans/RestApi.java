package beans;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.simple.parser.JSONParser;

public class RestApi {
	 public static void getData()
	 {
	     final String url = "http://www.omdbapi.com/?i=tt3896198&apikey=2c643b7c";
	  
	     //var url="http://www.omdbapi.com/?i="+name+"&apikey=2c643b7c";
	        var request = HttpRequest.newBuilder().GET().uri(URI.create(url)).build();
	        var client = HttpClient.newBuilder().build();
	        try {
				var response  = client.send(request, HttpResponse.BodyHandlers.ofInputStream());
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	        //System.out.println(response.statusCode());
	        //Calling function
	        
//	        JSONParser parse = new JSONParser();
//			
//			JSONObject jobj = (JSONObject)parse.parse(inline);
//	        JSONArray jsonarr = (JSONArray) jobj.get("results");
//	        for(int i=0;i<jsonarr.length();i++)
//	        {
//	        //Store the JSON objects in an array
//	        //Get the index of the JSON object and print the values as per the index
//	        JSONObject jsonobj = (JSONObject)jsonarr.get(i);
//	        System.out.println("Title : " +jsonobj.get("Title"));
	        }
	 }
