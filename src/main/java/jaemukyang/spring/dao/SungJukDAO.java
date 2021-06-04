package jaemukyang.spring.dao;

import java.util.List;

import jaemukyang.spring.vo.SungJuk;

public interface SungJukDAO {
	int insertSungJuk(SungJuk sj);

	List<SungJuk> selectAllSungJuk();

	SungJuk selectOneSungJuk(int sjno);

	int updateSungJuk(SungJuk sj);

	int deleteSungJuk(int sjno);
}
