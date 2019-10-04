"""
Fixtures for integration tests
"""
# pylint: disable=redefined-outer-name,unused-argument
import pytest

@pytest.fixture
def user_dict():
    """
    Dictionary with user data
    """
    data = {
        "username": "doe",
        "password": "test",
        "password2": "test",
        "email": "doe@example.com",
    }
    return data



@pytest.fixture
def post_dict():
    """
    Dictionary with post data
    """
    data = {
        "post": "This is my first post",
    }
    return data



@pytest.fixture
def register_user_response(client, user_dict):
    """
    Register user from user_dict
    """
    response = client.post(
        '/register',
        data=user_dict,
        follow_redirects=True,
    )
    return response



@pytest.fixture
def login_user_response(client, register_user_response, user_dict):
    """
    Register user from user_dict
    """
    response = client.post(
        '/login',
        data=user_dict,
        follow_redirects=True,
    )
    return response



@pytest.fixture
def user_post_response(client, login_user_response, user_dict, post_dict):
    """
    Register user from user_dict
    """
    response = client.post(
        "/",
        data=post_dict,
        follow_redirects=True,
    )
    return response
