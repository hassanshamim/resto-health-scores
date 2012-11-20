require 'spec_helper'

describe Audit do
  describe "validations" do
    it { should validate_presence_of :score }
    it { should validate_presence_of :date }
    it { should valiadate presence of :restaurant }
  end
  describe "associations" do
    it { should belong_to :restaurant }
  end
end
