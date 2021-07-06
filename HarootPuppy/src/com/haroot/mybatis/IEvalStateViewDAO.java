package com.haroot.mvc;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IEvalStateViewDAO {

	public ArrayList<EvalStateViewDTO> list() throws SQLException;

}
