"""
Test routes for routes for authorizing users, app/main/routes
"""
# pylint: disable=redefined-outer-name,unused-argument

def test_index_route_to_login(client):
    """
    Test redirect to login when go to index and not authorized
    """
    response = client.get("/", follow_redirects=True)
    assert response.status_code == 200
    assert b"Please log in to access this page." in response.data
    assert b"Sign In" in response.data



def test_index_post(client, user_post_response, user_dict):
    """
    Test redirect to login when go to index and not authorized
    """
    response = user_post_response
    assert b"Say something" in response.data
    assert b"Submit" in response.data
    assert response.status_code == 200
    assert str.encode("Hi, " + user_dict["username"]) in response.data
    assert b"This is my first post" in response.data
    assert b"Your post is now live" in response.data
    assert b"Submit" in response.data
