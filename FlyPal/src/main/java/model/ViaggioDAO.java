package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;

public class ViaggioDAO {
	public boolean doSave(Viaggio v) {
		try {
			Connection con = DbConnection.getConnection();
			
			PreparedStatement ps = con.prepareStatement("INSERT INTO VIAGGIO ("
					+ "username,"
					+ "cittap, "
					+ "cittaar, "
					+ "orariop, "
					+ "orarioa, "
					+ "nposti, "
					+ "costo, "
					+ "scadenza, "
					+ "url,"
					+ "descrizione) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			
			ps.setString(1, v.getUsername());
			ps.setString(2, v.getCitta_p());
			ps.setString(3, v.getCitta_a());
			ps.setString(4, v.getOrario_p());
			ps.setString(5, v.getOrario_a());
			
			ps.setInt(6, v.getNposti());
			ps.setFloat(7, v.getCosto());
			ps.setString(8, v.getScadenza());
			ps.setString(9, v.getUrl());
			ps.setString(10, v.getDescrizione());
			
			int i = ps.executeUpdate();
			if (i != 1)
            {
                throw new RuntimeException("INSERT error.");
            }
			/*
			ResultSet rs = ps.getGeneratedKeys();
			rs.next();*/
			return true;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return false;
		}
	}
	
	public ArrayList<Viaggio> select(String username) {
		Connection con;
		try {
			con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM VIAGGIO WHERE username=?");
			
			ps.setString(1, username);
			
			ResultSet rs = ps.executeQuery();
			ArrayList<Viaggio> lv = new ArrayList<Viaggio>();
			Viaggio v;
			while(rs.next()) {
				v=new Viaggio(
					rs.getString("username"),
					rs.getString("cittap"),
					rs.getString("cittaar"),
					rs.getString("orariop"),
					rs.getString("orarioa"),
					rs.getString("scadenza"),
					rs.getInt("id"),
					rs.getInt("nposti"),
					rs.getFloat("costo"),
					rs.getString("descrizione"),
					rs.getString("url")
				);
				lv.add(v);
				
			}
			return lv;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public ArrayList<Viaggio> select() {
		Connection con;
		try {
			con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM VIAGGIO");
			
			ResultSet rs = ps.executeQuery();
			ArrayList<Viaggio> lv = new ArrayList<Viaggio>();
			Viaggio v;
			while(rs.next()) {
				v=new Viaggio(
					rs.getString("username"),
					rs.getString("cittap"),
					rs.getString("cittaar"),
					rs.getString("orariop"),
					rs.getString("orarioa"),
					rs.getString("scadenza"),
					rs.getInt("id"),
					rs.getInt("nposti"),
					rs.getFloat("costo"),
					rs.getString("descrizione"),
					rs.getString("url")
				);
				lv.add(v);
				
			}
			return lv;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public Viaggio select(int id) {
		Connection con;
		try {
			con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM VIAGGIO WHERE id=?");
			
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			ArrayList<Viaggio> lv = new ArrayList<Viaggio>();
			Viaggio v = null;
			while(rs.next()) {
				v=new Viaggio(
					rs.getString("username"),
					rs.getString("cittap"),
					rs.getString("cittaar"),
					rs.getString("orariop"),
					rs.getString("orarioa"),
					rs.getString("scadenza"),
					rs.getInt("id"),
					rs.getInt("nposti"),
					rs.getFloat("costo"),
					rs.getString("descrizione"),
					rs.getString("url")
				);
				lv.add(v);
				
			}
			return v;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	public boolean delete(String username, int id) {
		Connection con;
		try {
			con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("DELETE FROM VIAGGIO WHERE username=? AND id=?");
			
			ps.setString(1, username);
			ps.setInt(2, id);
			
			if(ps.execute())return true;
			return false;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean addCart(int id_viaggio, String username, int biglietti, int pagato) {
		try {
			LocalDateTime date = LocalDateTime.now(); 
			Connection con = DbConnection.getConnection();
			
			PreparedStatement ps = con.prepareStatement("INSERT INTO acquista ("
					+ "id,"
					+ "profile_user,"
					+ "quantita, "
					+ "dataora, "
					+ "pagato"
					+ ") VALUES (?, ?, ?, ?, ?)");

			ps.setInt(1, id_viaggio);
			ps.setString(2, username);
			ps.setInt(3, biglietti);
			ps.setString(4, date.toString());
			ps.setInt(5, pagato);
			
			
			int i = ps.executeUpdate();
			if (i != 1)
            {
                throw new RuntimeException("INSERT error.");
            }
			return true;
		} catch (SQLException e) {
			addCartTicket(id_viaggio,username);
			System.out.println(e.getMessage());
			return false;
		}
	}
	
	public boolean addCartTicket(int id_viaggio, String username) {
		try {
			Connection con = DbConnection.getConnection();
			
			PreparedStatement ps = con.prepareStatement(
					"SELECT quantita FROM acquista "
					+ "WHERE id=? AND profile_user = ?;"
			);
			ps.setInt(1, id_viaggio);
			ps.setString(2, username);
			ResultSet rs = ps.executeQuery();
			rs.next();
			int q=rs.getInt("quantita") + 1;

			ps = con.prepareStatement(
					"UPDATE acquista "
					+ "SET quantita = ? "
					+ "WHERE  pagato=0 AND profile_user = ? AND id=?;"
			);
			ps.setInt(1, q);
			ps.setString(2, username);
			ps.setInt(3, id_viaggio);
			
			int i = ps.executeUpdate();
			if (i != 1)
            {
                throw new RuntimeException("INSERT error.");
            }
			return true;
		} catch (SQLException e) {
			System.out.println("error addCartTicket :" + e.getMessage());
			return false;
		}
	}
	
	public boolean removeViaggioTicket(int id_viaggio, int quantita) {
		try {
			Connection con = DbConnection.getConnection();
			
			PreparedStatement ps = con.prepareStatement(
					"SELECT nposti FROM viaggio "
					+ "WHERE id=?;"
			);
			ps.setInt(1, id_viaggio);
			ResultSet rs = ps.executeQuery();
			rs.next();
			int q=rs.getInt("nposti");
			if(q==0)return false;
			q= q - 1;

			ps = con.prepareStatement(
					"UPDATE viaggio "
					+ "SET nposti = ? "
					+ "WHERE id=?;"
			);
			ps.setInt(1, q);
			ps.setInt(2, id_viaggio);
			
			int i = ps.executeUpdate();
			if (i != 1)
            {
                throw new RuntimeException("INSERT error.");
            }
			return true;
		} catch (SQLException e) {
			System.out.println("error add :" + e.getMessage());
			return false;
		}
	}
	
	public boolean buyCart(int id_viaggio, String username) {
		try {
			Connection con = DbConnection.getConnection();
			
			PreparedStatement ps = con.prepareStatement(
					"SELECT quantita FROM acquista "
					+ "WHERE  profile_user = ? AND id=?;"
			);
			ps.setString(1, username);
			ps.setInt(2, id_viaggio);
			
			ResultSet rs = ps.executeQuery();
			rs.next();
			int q = rs.getInt("quantita");
			if(!removeViaggioTicket(id_viaggio, q))return false;
			
			con = DbConnection.getConnection();
			
			ps = con.prepareStatement(
					"UPDATE acquista "
					+ "SET pagato = 1 "
					+ "WHERE  profile_user = ? AND id=?;"
			);
			ps.setString(1, username);
			ps.setInt(2, id_viaggio);
			
			int i = ps.executeUpdate();
			if (i != 1)
            {
                throw new RuntimeException("INSERT error.");
            }
			return true;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			return false;
		}
	}
	
	public ArrayList<Viaggio> selectCart(String username, int pagato) {
		Connection con;
		try {
			con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM viaggio, acquista WHERE viaggio.id=acquista.id AND acquista.profile_user=? AND pagato=?");
			
			ps.setString(1, username);
			ps.setInt(2, pagato);
			ResultSet rs = ps.executeQuery();
			ArrayList<Viaggio> lv = new ArrayList<Viaggio>();
			Viaggio v;
			while(rs.next()) {
				v=new Viaggio(
					rs.getString("username"),
					rs.getString("cittap"),
					rs.getString("cittaar"),
					rs.getString("orariop"),
					rs.getString("orarioa"),
					rs.getString("scadenza"),
					rs.getInt("id"),
					rs.getInt("nposti"),
					rs.getFloat("costo"),
					rs.getString("descrizione"),
					rs.getString("url")
				);
				lv.add(v);
				
			}
			return lv;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
}