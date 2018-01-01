package player;

import java.sql.*;
import java.util.ArrayList;

public class connection {
	private String user = "root";
	private String pwd = "";

	private Connection conn = null;
	private PreparedStatement prepare = null;
	private ResultSet resultSet = null;

	public connection() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost/portal?" + "user=" + user + "&password=" + pwd);
	}

	public String checkPlayerLogin(String uname, String pwd) {
		String res = null;
		try {
			prepare = conn.prepareStatement("select * from playerdetail where Email=?,Password=? ");
			prepare.setString(1, uname);
			prepare.setString(2, pwd);
			resultSet = prepare.executeQuery();
			while (resultSet.next()) {
				res = resultSet.getString("id");
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print(e.getMessage());
		} finally {
			close();
		}
		return res;
	}

	public String checkOfficerLogin(String uname, String pwd) {
		String res = null;
		try {
			prepare = conn.prepareStatement("select * from officerdetail where Email=?,Password=? ");
			prepare.setString(1, uname);
			prepare.setString(2, pwd);
			resultSet = prepare.executeQuery();
			while (resultSet.next()) {
				res = resultSet.getString("id");
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print(e.getMessage());
		} finally {
			close();
		}
		return res;
	}

	public boolean playerRegister(String[] val) {
		boolean res=false;
		try {
			prepare = conn.prepareStatement("insert into playerdetail(Name,LastName,Email,Password,Age,Phone,Address) values(?,?,?,?,?,?,?)");
			prepare.setString(1, val[0]);
			prepare.setString(2, val[1]);
			prepare.setString(3, val[2]);
			prepare.setString(4, val[3]);
			prepare.setString(5, val[4]);
			prepare.setString(6, val[5]);
			prepare.setString(7, val[7]);
			if(prepare.executeUpdate()==1) {
				res=true;
			}
		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.print(e.getMessage());
		}
		finally {
			close();
		}
		return res;
	}

	public boolean officerRegister(String[] val) {
		boolean res=false;
		try {
			prepare = conn.prepareStatement("insert into officerdetail(Name,LastName,Email,Password,Phone) values(?,?,?,?,?)");
			prepare.setString(1, val[0]);
			prepare.setString(2, val[1]);
			prepare.setString(3, val[2]);
			prepare.setString(4, val[3]);
			prepare.setString(5, val[4]);
			if(prepare.executeUpdate()==1) {
				res=true;
			}
		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.print(e.getMessage());
		}
		finally {
			close();
		}
		return res;
	}
	
	public boolean editPlayer(String[] val) {
		boolean res=false;
		try {
			prepare = conn.prepareStatement("update playerdetail set(Name=?,LastName=?,Email=?,Password=?,Age=?,Phone=?,Address=?) where id=?");
			prepare.setString(1, val[0]);
			prepare.setString(2, val[1]);
			prepare.setString(3, val[2]);
			prepare.setString(4, val[3]);
			prepare.setString(5, val[4]);
			prepare.setString(6, val[5]);
			prepare.setString(7, val[7]);
			if(prepare.executeUpdate()==1) {
				res=true;
			}
		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.print(e.getMessage());
		}
		finally {
			close();
		}
		return res;
	}
	public ArrayList<players> getPlayers() {
		ArrayList<players> al = new ArrayList<players>();
		try {
			prepare = conn.prepareStatement("select * from playerdetail");
			resultSet = prepare.executeQuery();
			while (resultSet.next()) {
				players obj = new players();
				obj.setId(resultSet.getInt("id"));
				obj.setName(resultSet.getString("Name"));
				obj.setLname(resultSet.getString("LastName"));
				obj.setEmail(resultSet.getString("Email"));
				obj.setPwd(resultSet.getString("Password"));
				obj.setAge(resultSet.getInt("Age"));
				obj.setPhone(resultSet.getString("Phone"));
				obj.setAdd(resultSet.getString("Address"));
				al.add(obj);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print(e.getMessage());
		} finally {
			close();
		}
		return al;
	}

	public ArrayList<players> getSinPlayers(String id) {
		ArrayList<players> al = new ArrayList<players>();
		try {
			prepare = conn.prepareStatement("select * from playerdetail where id=?");
			prepare.setString(1, id);
			resultSet = prepare.executeQuery();
			while (resultSet.next()) {
				players obj = new players();
				obj.setId(resultSet.getInt("id"));
				obj.setName(resultSet.getString("Name"));
				obj.setLname(resultSet.getString("LastName"));
				obj.setEmail(resultSet.getString("Email"));
				obj.setPwd(resultSet.getString("Password"));
				obj.setAge(resultSet.getInt("Age"));
				obj.setPhone(resultSet.getString("Phone"));
				obj.setAdd(resultSet.getString("Address"));
				al.add(obj);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print(e.getMessage());
		} finally {
			close();
		}
		return al;
	}

	private void close() {
		// TODO Auto-generated method stub
		try {
			if (conn != null) {
				conn.close();
			}
			if (prepare != null) {
				prepare.close();
			}
			if (resultSet != null) {
				resultSet.close();
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print(e.getMessage());
		}

	}

}
