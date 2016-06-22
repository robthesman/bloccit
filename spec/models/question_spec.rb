require 'rails_helper'

RSpec.describe Question, type: :model do
  
  context "attributes" do
      let(:question) { Question.new(title: "New question", body: "Insert question here", resolved: false) }
      
      it "should respont to title" do
          expect(question).to respond_to(:title)
      end
      
      it "should respond to body" do
          expect(question).to respond_to(:body)
      end
      
      it "should respond to resolved" do
          expect(question).to respond_to(:resolved)
      end
  end

end
