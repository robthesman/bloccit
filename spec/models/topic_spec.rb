require 'rails_helper'

RSpec.describe Topic, type: :model do
  let(:name) { RandomData.random_sentence }
   let(:description) { RandomData.random_paragraph }
   let(:public) { true }
   let(:topic) { Topic.create!(name: name, description: description) }

    it { is_expected.to have_many(:posts) }
    it { should validate_length_of(:name).is_at_least(5) }
    it { should validate_length_of(:description).is_at_least(15) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    
    it { is_expected.to have_many(:labelings) }
    it { is_expected.to have_many(:labels) }
    
   describe "attributes" do
     it "has name and description attributes" do
       expect(topic).to have_attributes(name: topic.name, description: topic.description)
     end

     it "is public by default" do
       expect(topic.public).to be(true)
     end
   end
   
   describe "scopes" do
     before do
       @public_topic = Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph)
       @private_topic = Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph, public: false)
     end
 
     describe "visible_to(user)" do
       it "returns all topics if the user is present" do
         user = User.new
         expect(Topic.visible_to(user)).to eq(Topic.all)
       end
 
       it "returns only public topics if user is nil" do
         expect(Topic.visible_to(nil)).to eq([@public_topic])
       end
     end
   end
  
end
