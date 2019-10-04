"""
Test handlers for request errors, app/errors/handlers
"""

def test_404(client):
    """
    Test that custom 404 page is shown when non existing route is entered.
    """
    response = client.get('/non_existing_route')
    assert response.status_code == 404
    assert b"File Not Found" in response.data
    assert b"Welcome to Microblog" in response.data

# def test_500(client):
#     response = client.get('/wrong')
#     assert response.status_code == 500
#     assert b"An unexpected error has occurred" in response.data
#     assert b"V\xc3\xa4lkommen till min me-sida" in response.data
