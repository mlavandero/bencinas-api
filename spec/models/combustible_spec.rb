require 'spec_helper'

describe Combustible do

  before :each do
    (1..5).each{FactoryGirl.create(:combustible)}
  end
  
  it "should slugify the nombre" do
    Combustible.all.each do |combustible|
      combustible.slug.should match(/^\S*$/)
    end
  end

  it "should find a Combustible by its slug" do
    combustible = Combustible.all.sample
    Combustible.find_by_slug(combustible.slug).should be_eql(combustible)
  end

  it "should find a Combustible by its id or by its slug" do
    combustible = Combustible.all.sample
    Combustible.find_by_id_or_slug(combustible.id).should be_eql(combustible)
    Combustible.find_by_id_or_slug(combustible.slug).should be_eql(combustible)
  end

end