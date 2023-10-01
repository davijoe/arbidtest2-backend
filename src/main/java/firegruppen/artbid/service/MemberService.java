package firegruppen.artbid.service;

import org.springframework.stereotype.Service;

import firegruppen.artbid.repository.MemberRepository;

@Service
public class MemberService {
    MemberRepository memberRepository;

    public MemberService(MemberRepository memberRepository) {
        this.memberRepository = memberRepository;
    }

    
}
