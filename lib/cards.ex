defmodule Cards do
  
  def create_deck do
    
    values = ["Ace", "Two", "There", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
    suits = ["Spades", "Diamonds", "Hearts", "Clubs"]

    for suit <- suits, value <- values do
        "#{value} of #{suit}"
    end
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def save(deck, filename) do
    bianary = :erlang.term_to_binary(deck)
    File.write(filename, bianary)
  end

  def load(filename) do
    {status, bianry} = File.read(filname)

    case status do
      :ok -> :erlang.bianary_to_term bianary
      :error -> "File does not exisit"
    end
  end

end
