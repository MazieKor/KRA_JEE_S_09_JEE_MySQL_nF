package pl.coderslab.mysql.modification;

public class Main03 {
    public String query1 = "INSERT INTO products SET id=0, name=produkt1, description=name, price=904";
    public String query1fixed = "";

    public String query2 = "INSERT INTO clients VALUES(\"Jan\", \"Kowalski\", 4, \"Mr.\")";
    public String query2fixed = "";

    public String query3 = "INSERT INTO movies(id, rating, title) VALUES(null, \"bardzo dobry\", \"Szybcy i wściekli\")";
    public String query3fixed = "";

    public String query4 = "INSERT INTO payments SET id=90 AND VALUES(\"cash\", NOW())";
    public String query4fixed = "";

//        Dane przed poprawą
//    public String query1 = "INSERT INTO products SET id=0, name=produkt1, description=name, price=904";
//    public String query1fixed = "";
//
//    public String query2 = "INSERT INTO clients VALUES(\"Jan\", \"Kowalski\", 4, \"Mr.\")";
//    public String query2fixed = "";
//
//    public String query3 = "INSERT INTO movies(id, rating, title) VALUES(null, \"bardzo dobry\", \"Szybcy i wściekli\")";
//    public String query3fixed = "";
//
//    public String query4 = "INSERT INTO payments SET id=90 AND VALUES(\"cash\", NOW())";
//    public String query4fixed = "";
}
