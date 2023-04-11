require 'rails_helper'

# we group together our users tests
# RSpec.describe '/posts', type: :request do
#   context 'GET /index' do
#     it 'renders a successful response' do
#       get user_posts_path(5)
#       expect(response).to be_successful
#     end

#     it 'renders the correct template' do
#       get user_posts_path(5)
#       expect(response).to render_template('index')
#     end

#     it 'includes correct placeholder text' do
#       get user_posts_path(5)
#       expect(response.body).to include('<h1>Users Posts</h1>')
#     end
#   end

#   context 'GET /show' do
#     it 'renders a successful response' do
#       get user_post_url(5, 7)
#       expect(response).to be_successful
#     end

#     it 'renders the correct template' do
#       get user_post_url(5, 7)
#       expect(response).to render_template('show')
#     end

#     it 'includes correct placeholder text' do
#       get user_post_url(5, 7)
#       expect(response.body).to include('<h1>Show post</h1>')
#     end
#   end
# end
