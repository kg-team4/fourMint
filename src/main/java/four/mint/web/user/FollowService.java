package four.mint.web.user;

public interface FollowService {

	FollowCountVO getFollowCount(String nickname);

	FollowingVO getCheck(FollowingVO fchVO);

	void insertFollow(FollowingVO fVO);

	void deleteFollow(FollowingVO fVO);
}
