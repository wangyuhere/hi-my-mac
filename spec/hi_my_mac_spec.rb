require "spec_helper"

describe HiMyMac do

  describe "path" do
    it "should return correct path" do
      expect(HiMyMac.logs_path).to eql(File.join HiMyMac.path, "logs")
    end

    it "should raise runtime exception if path not exists" do
      expect { HiMyMac.not_exists_path }.to raise_error(RuntimeError)
    end
  end

end
