require 'pry'
require './lib/generate_barcode' 

describe GenerateBarcode do
  describe "#generate barcode" do
    it "if the end number is not 10" do
      expect do
        GenerateBarcode.new("978014300723").create

      end.to output("9780143007234\n").to_stdout
    end

    it "if the end number is 10" do
      expect do
        GenerateBarcode.new("978014300721").create
      end.to output("9780143007210\n").to_stdout
    end
  end
end
