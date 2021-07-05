package com.haroot.mvc;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IWalkScoreViewDAO {

	public ArrayList<WalkScoreViewDTO> list() throws SQLException;

}
