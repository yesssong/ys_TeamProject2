/*

drop table chatroom
drop sequence seq_chatroom_idx

-- 일련 번호 시퀀스 관리객체
create sequence seq_chatroom_idx

create table chatroom
(
	chat_idx		int,					-- 채팅방 식별 번호
	mem_idx			int,					-- 회원 번호(식별번호)
	chat_name		varchar2(100)not null,	-- 채팅방 이름
	chat_date		date default sysdate,	-- 채팅방 생성 날짜
	mes_idx			int						-- 메세지 번호(식별번호)
)


-- 기본키 -> chat_idx
alter table chatroom add constraint pk_chat_idx primary key(chat_idx);

-- 외래키(member 테이블의 mem_idx 참조) member가 chatroom의 부모
alter table chatroom
	add constraint fk_chatroom_mem_idx foreign key(mem_idx)
				   references member(mem_idx)		--member 테이블의 mem_idx 참조하겠다
				   on delete cascade		-- 부모 키 삭제 시 자식도 삭제	
				   on update cascade		-- 부모 키 수정 시 자식도 수정



*/