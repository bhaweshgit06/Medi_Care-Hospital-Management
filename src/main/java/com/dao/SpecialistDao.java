package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import com.entity.Specialist;

public class SpecialistDao {

	private Connection conn;

	public SpecialistDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addSpecialist(String specName) {

		boolean f = false;

		try {

			String sql = "insert into specialist(spec_name) values(?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, specName);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return f;

	}
	public int countSpecialist() {
		int i = 0;

		try {
			String sql = "select * from specialist";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				i++;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}
	
	public List<Specialist> getAllSpecialist() {
		List<Specialist> list = new ArrayList<Specialist>();
		Specialist s = null;

		try {
			String sql = "select * from specialist";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				s = new Specialist();
				s.setId(rs.getInt(1));
				s.setSpecialistName(rs.getString(2));
				list.add(s);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
		
		

}
