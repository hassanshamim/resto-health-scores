require 'spec_helper'

describe Audit do
  describe "validations" do
    it { should_validate_presence_of :score }
    it { should_validate_presence_of :date }
  end
  describe "associations" do
    it { should_belong_to :restaurant }
  end
end
