package player;

public class officers {
	private int id;
	private String name, lname, email, pwd, phone;

	int getId() {
		return this.id;
	}

	void setId(int id) {
		this.id = id;
	}

	String getName() {
		return this.name;
	}

	void setName(String name) {
		this.name = name;
	}

	void setPhone(String phone) {
		this.phone = phone;
	}

	String getPhone() {
		return this.phone;
	}

	void setLname(String lname) {
		this.lname = lname;
	}

	String getLname() {
		return this.lname;
	}

	void setEmail(String email) {
		this.email = email;
	}

	String getEmail() {
		return this.email;
	}

	void setPwd(String pwd) {
		this.pwd = pwd;
	}

	String getPwd() {
		return this.pwd;
	}

}