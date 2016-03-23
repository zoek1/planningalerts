require "spec_helper"

describe Admin::AuthoritiesHelper do
  describe "#load_councillors_response_text" do
    it "all councillors load successfully" do
      valid_councillors = [create(:councillor), create(:councillor)]

      expect(helper.load_councillors_response_text(valid_councillors))
        .to eql "Successfully loaded 2 councillors."
    end

    it "there were no councillors to load" do
      expect(helper.load_councillors_response_text([]))
        .to eql "Could not find any councillors in the data to load."
    end

    it "all councillors failed to load due to errors" do
      invalid_councillors = [
        build(:councillor, email: nil),
        build(:councillor, image_url: "http://example.com")
      ]

      expect(helper.load_councillors_response_text(invalid_councillors))
        .to eql "Skipped loading 2 councillors."
    end

    it "some councillors load successfully and some fail" do
      councillors = [
        build(:councillor),
        build(:councillor, image_url: "http://example.com")
      ]

      expect(helper.load_councillors_response_text(councillors))
        .to eql "Successfully loaded 1 councillor. Skipped loading 1 councillor."
    end
  end
end
