require 'rails_helper'

RSpec.describe SponsoredPostsController, type: :controller do
   let(:my_sponsored_post) { Sponsoredpost.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }
 
   describe "GET show" do
     it "returns http success" do
       get :show, {id: my_sponsored_post.id}
       expect(response).to have_http_status(:success)
     end
 
     it "renders the #show view" do
       get :show, {id: my_sponsored_post.id}
       expect(response).to render_template :show
     end
 
     it "assigns my_sponsored_post to @sponsoredpost" do
       get :show, {id: my_sponsored_post.id}
       expect(assigns(:sponsoredpost)).to eq(my_sponsored_post)
     end
   end
  
    describe "GET new" do
     it "returns http success" do
       get :new, topic_id: my_sponsored_post.id
       expect(response).to have_http_status(:success)
     end
 
     it "renders the #new view" do
       get :new
       expect(response).to render_template :new
     end
 
     it "initializes @sponsoredpost" do
       get :new
       expect(assigns(:sponsoredpost)).not_to be_nil
     end
   end
   
    describe "GET edit" do
     it "returns http success" do
       get :edit, {id: my_sponsored_post.id}
       expect(response).to have_http_status(:success)
     end
 
     it "renders the #edit view" do
       get :edit, {id: my_sponsored_post.id}
       expect(response).to render_template :edit
     end
 
     it "assigns sponsoredpost to be updated to @sponsoredpost" do
       get :edit, {id: my_sponsored_post.id}
       sponsoredpost_instance = assigns(:sponsoredpost)
 
       expect(sponsoredpost_instance.id).to eq my_sponsored_post.id
       expect(sponsoredpost.name).to eq my_sponsored_post.name
       expect(sponsoredpost_instance.description).to eq my_sponsored_post.description
     end
   end

end
