require 'spec_helper'

describe Comuna do
  
  let(:comuna){ create :comuna}

  it("tiene un factory valido") { expect(comuna).to be_valid }

end
