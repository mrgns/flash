package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import entitybeans.DBConnection;


public class MoviesData {
	private String imdb_id="";
	private String title="";
	private String plot="";
	private String type	="";
	private String rated	="";
	private String year	="";
	private String released_at="";	
	private String added_at	="";
	private String runtime	="";
	private String genre	="";
	private String director	="";
	private String writer	="";
	private String actors	="";
	private String language	="";
	private String awards	="";
	private String imdb_rating	="";
	private String imdb_votes="";
	

	public void Data()
	{
		try
		{
			Connection con;
				PreparedStatement pst;
				ResultSet rs;
				DBConnection db=new DBConnection();
				con=db.dbConnection();
				pst=con.prepareStatement("select * from moviedata where imdb_id=?");
				pst.setString(1, imdb_id);
					rs=pst.executeQuery();
					while(rs.next())
					{
						title=rs.getString("title");
						plot=rs.getString("plot");
						type=rs.getString("type");
						rated=rs.getString("rated");
						year=rs.getString("year");
						released_at=rs.getString("released_at");
						added_at=rs.getString("added_at");
						runtime=rs.getString("runtime");
						genre=rs.getString("genre");
						director=rs.getString("director");
						writer=rs.getString("writer");
						actors=rs.getString("actors");
						language=rs.getString("language");
						awards=rs.getString("awards");
						imdb_rating=rs.getString("imdb_rating");
						imdb_votes=rs.getString("imdb_votes");
					}
		}
		catch(Exception ex)
		{
			System.out.println(ex.toString());
		}
	}
	
	
	
	
	public String getImdb_id() {
		return imdb_id;
	}
	public void setImdb_id(String imdb_id) {
		Data();
		this.imdb_id = imdb_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPlot() {
		return plot;
	}
	public void setPlot(String plot) {
		this.plot = plot;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getRated() {
		return rated;
	}
	public void setRated(String rated) {
		this.rated = rated;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getReleased_at() {
		return released_at;
	}
	public void setReleased_at(String released_at) {
		this.released_at = released_at;
	}
	public String getAdded_at() {
		return added_at;
	}
	public void setAdded_at(String added_at) {
		this.added_at = added_at;
	}
	public String getRuntime() {
		return runtime;
	}
	public void setRuntime(String runtime) {
		this.runtime = runtime;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getActors() {
		return actors;
	}
	public void setActors(String actors) {
		this.actors = actors;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getAwards() {
		return awards;
	}
	public void setAwards(String awards) {
		this.awards = awards;
	}
	public String getImdb_rating() {
		return imdb_rating;
	}
	public void setImdb_rating(String imdb_rating) {
		this.imdb_rating = imdb_rating;
	}
	public String getImdb_votes() {
		return imdb_votes;
	}
	public void setImdb_votes(String imdb_votes) {
		this.imdb_votes = imdb_votes;
	}


}
