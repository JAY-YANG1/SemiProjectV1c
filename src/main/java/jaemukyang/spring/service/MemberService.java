package jaemukyang.spring.service;

import jaemukyang.spring.vo.Member;

public interface MemberService {

	int newMember(Member m);
	
	int loginMember(Member m);
	
	Member readOneMember(String mno);
	
}
