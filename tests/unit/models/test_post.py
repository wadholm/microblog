"""
Contains tests for app.models.Post class
"""
# pylint: disable=redefined-outer-name
import pytest
from app.models import Post

@pytest.fixture
def post1():
    """
    POst object
    """
    return Post(
        title='First post',
        body='Hello this is my firtst post',
    )



def test_new_post(post1):
    """
    Test that post contain correct value
    """
    assert post1.title == 'First post'
    assert post1.body == "Hello this is my firtst post"
    assert str(post1) == "<Post: First post: Hello this is my firtst post By user_id None>"
