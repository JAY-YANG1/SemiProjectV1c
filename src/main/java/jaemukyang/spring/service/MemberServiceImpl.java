package jaemukyang.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jaemukyang.spring.dao.MemberDAO;
import jaemukyang.spring.vo.Member;

@Service("msrv")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO mdao;
	
	@Override
	public int newMember(Member m) {
		
		return mdao.insertMember(m);
	}

	@Override
	public int loginMember(Member m) {
		
		return mdao.selectLogin(m);
	}

	@Override
	public Member readOneMember(String userid) {
		return mdao.selectOneMember(userid);
	}

}
