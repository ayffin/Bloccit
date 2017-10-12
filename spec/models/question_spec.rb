require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question){Question.create!(title:"New Question Title",body:"New Question body",resolve: false)}

  describe "attributes" do
    it "has attributes" do
      expect(question).to have_attributes(title:"New Question Title",body:"New Question body",resolve: false)
    end
  end
end
