require 'spec_helper'

describe FormsHelper do
  describe '#percent_to_color' do
    [[0, '#fefefe'], [0.5, '#dedede'], [1, '#bebebe']].each do |percent, hex|
      it "converts #{hex}" do
        percent_to_color(percent).should == hex
      end
    end
  end
end
