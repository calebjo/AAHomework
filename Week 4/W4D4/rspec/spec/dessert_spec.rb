require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Voldemort") }
  let(:dessert) { Dessert.new("Cake", 6, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("Cake")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(6)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("Pie", "three", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("Flour")

      expect(dessert.ingredients).to include("Flour")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      dessert.add_ingredient("Flour")
      dessert.add_ingredient("Sugar")
      dessert.add_ingredient("Salt")
      dessert.add_ingredient("Vanilla extract")

      expect(dessert.ingredients).to eq(["Flour", "Sugar", "Salt", "Vanilla extract"])
      dessert.mix!
      expect(dessert.ingredients).not_to eq(["Flour", "Sugar", "Salt", "Vanilla extract"])
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(1)

      expect(dessert.quantity).to eq(5)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { dessert.eat(10000) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Voldemort the Great Baker")

      expect(dessert.serve).to eq("Chef Voldemort the Great Baker has made 6 Cakes!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)

      dessert.make_more
    end
  end
end
