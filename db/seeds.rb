# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(name: 'Tom', photo: 'https://wallpapers.com/images/featured/87h46gcobjl5e4xu.jpg',
                         bio: 'Teacher from Mexico.', posts_counter: 0)
second_user = User.create(name: 'Lilly',
                          photo: 'https://newprofilepic2.photo-cdn.net//assets/images/article/profile.jpg',
                          bio: 'Teacher from Poland.', posts_counter: 0)
third_user = User.create(name: 'Opondo', photo: 'https://media.sproutsocial.com/uploads/2022/06/profile-picture.jpeg',
                         bio: 'Teacher from Kenya.', posts_counter: 0)

first_post = Post.create(author: first_user, title: 'Two Down, One to Go',
                         text: 'He wondered if she would appreciate his toenail collection.',
                         comments_counter: 0, likes_counter: 0)
second_post = Post.create(author: first_user, title: 'Rain on Your Parade',
                          text: 'She found it strange that people use their cellphones to actually talk to one another.',
                          comments_counter: 0, likes_counter: 0)
third_post = Post.create(author: first_user, title: 'Raining Cats and Dogs',
                         text: 'Separation anxiety is what happens when you can\'t find your phone.',
                         comments_counter: 0, likes_counter: 0)
fourth_post = Post.create(author: first_user, title: 'Ride Him, Cowboy!',
                          text: 'Boulders lined the side of the road foretelling what could come next.',
                          comments_counter: 0, likes_counter: 0)
fifth_post = Post.create(author: first_user, title: 'Between a Rock and a Hard Place',
                         text: 'The thick foliage and intertwined vines made the hike nearly impossible.',
                         comments_counter: 0, likes_counter: 0)
sixth_post = Post.create(author: second_user, title: 'A Busy Bee',
                         text: 'It was a slippery slope and he was willing to slide all the way to the deepest depths.',
                         comments_counter: 0, likes_counter: 0)
seventh_post = Post.create(author: second_user, title: 'High And Dry',
                           text: 'It had been sixteen days since the zombies first attacked.',
                           comments_counter: 0, likes_counter: 0)
eighth_post = Post.create(author: second_user, title: 'Not the Sharpest Tool in the Shed',
                          text: 'For the 216th time, he said he would quit drinking soda after this last Coke.',
                          comments_counter: 0, likes_counter: 0)
nineth_post = Post.create(author: second_user, title: 'A Busy Body',
                          text: 'Strawberries must be the one food that doesn\'t go well with this brand of paint.',
                          comments_counter: 0, likes_counter: 0)
tenth_post = Post.create(author: third_user, title: 'A Guinea Pig',
                         text: 'He turned in the research paper on Friday; otherwise, he would have not passed the class.',
                         comments_counter: 0, likes_counter: 0)
eleventh_post = Post.create(author: third_user, title: 'All Greek To Me',
                            text: 'Bill ran from the giraffe toward the dolphin.',
                            comments_counter: 0, likes_counter: 0)
twelveth_post = Post.create(author: third_user, title: 'On the Same Page',
                            text: 'There is no better feeling than staring at a wall with closed eyes.',
                            comments_counter: 0, likes_counter: 0)

Comment.create(post: first_post, user: first_user,
               text: 'Searching for arena partner,
                               looking for skilled rogue or mage, I need someone to control enemy healer.')
Comment.create(post: first_post, user: third_user,
               text: 'I didn’t expect much from you, but I’m still very upset with your decision.')
Comment.create(post: first_post, user: second_user,
               text: 'We all said that 2019 was a bad year,
                               we were saying the same thing about 2018,
                                but things that happen in 2020 are just totally insane.')
Comment.create(post: first_post, user: first_user,
               text: 'Comfort zone is death to all beginnings,
                                if you are in a warm place and everything is comfortable
                                  all the time you start to become lazy and unmotivated.')
Comment.create(post: sixth_post, user: third_user,
               text: 'Why I have to be ashamed, everyone else is doing it.
                                Why should I be only exception here?')
Comment.create(post: sixth_post, user: second_user,
               text: 'Very inconvenient case, I had hard tasks before,
                               but this one is different. Will do my best anyway.')
Comment.create(post: sixth_post, user: first_user,
               text: 'Who else enjoys sea as much as I do?
                                 Any diving fans here? Let me know.')
Comment.create(post: tenth_post, user: first_user,
               text: 'Awww, so cute, you wrote this article for me honey?')
Comment.create(post: tenth_post, user: third_user,
               text: 'My hobby is related with computer technologies, what is yours?')
Comment.create(post: tenth_post, user: second_user,
               text: 'When did you last have a deep conversation with someone?
                                I believe it was a long time ago.')
Comment.create(post: tenth_post, user: first_user,
               text: 'Trusting someone is really hard these days,
                                   people are not like what they used to be in the past, morality is rare...')
Comment.create(post: second_post, user: third_user,
               text: 'Inner peace, find it in your heart,
                                  in your soul and you will understand the true meaning of this life.')
Comment.create(post: seventh_post, user: second_user,
               text: 'Bought new gadget and it is not working as it should.
                                    What should I do? Whom should I contact?')
Comment.create(post: first_post, user: first_user,
  text: 'Wow, this is amazing! I never thought I could learn so much in such 
                                  a short amount of time. Thank you for teaching me!')
Comment.create(post: first_post, user: first_user,
  text: 'I\'m sorry, but I have to disagree with you. Your argument seems 
                                  flawed and lacks evidence to support it.')                                                       

Like.create(post: first_post, user: second_user)
Like.create(post: first_post, user: second_user)
Like.create(post: second_post, user: second_user)
Like.create(post: second_post, user: second_user)
Like.create(post: sixth_post, user: third_user)
Like.create(post: sixth_post, user: third_user)
Like.create(post: sixth_post, user: third_user)
Like.create(post: tenth_post, user: first_user)
Like.create(post: tenth_post, user: first_user)
Like.create(post: tenth_post, user: first_user)
