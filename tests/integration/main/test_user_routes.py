"""
Test routes for routes for authorizing users, app/main/routes
"""
# pylint: disable=redefined-outer-name,unused-argument

def test_non_existing_user(client, login_user_response):
    """
    Test that 404 is raised when trying to go to a user page for a non-existing user.
    """
    with client:
        response = client.get("/user/wrong", follow_redirects=True)
        assert b"File Not Found" in response.data
        assert response.status_code == 404



def test_user_page(client, login_user_response, user_dict, user_post_response, post_dict):
    """
    Test that correct info and post are displayed on user profile.
    """
    response = client.get("/user/" + user_dict["username"], follow_redirects=True)
    assert response.status_code == 200
    assert b"Edit your profile" in response.data
    assert str.encode("User: " + user_dict["username"]) in response.data
    assert str.encode(post_dict["post"]) in response.data



def test_get_edit_profile(client, login_user_response, user_dict):
    """
    Test that can edit user profile.
    """
    response = client.get("/edit_profile")
    assert response.status_code == 200
    assert b"Edit Profile" in response.data
    assert str.encode(user_dict["username"]) in response.data



def test_post_edit_profile(client, login_user_response, user_dict):
    """
    Test that can edit user profile.
    """
    response = client.post("/edit_profile",
                           data={
                               "username": "new_doe",
                               "about_me": "This is me"
                           },
                           follow_redirects=True)
    assert response.status_code == 200
    assert b"Edit Profile" in response.data
    assert b"Your changes have been saved." in response.data
    assert b"new_doe" in response.data
    assert b"This is me" in response.data
