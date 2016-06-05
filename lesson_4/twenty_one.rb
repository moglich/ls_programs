def create_deck
  deck = {}
  suits = %w(hearts diamonds clubs spades)
  suits.each { |suit| deck[suit.to_sym] = {} }

  deck.each_key do |card_type|
    (2..10).each do |value|
      deck[card_type][value.to_s] = value
    end
    deck[card_type]['jack']  = 10
    deck[card_type]['queen'] = 10
    deck[card_type]['king']  = 10
    deck[card_type]['ace']   = 11
  end

  deck
end

def pull_card(deck)
  suit  = deck.keys.sample
  card  = deck[suit].keys.sample
  value = deck[suit].values_at(card).first
  deck[suit].delete card

  { suit => { card => value } }
end

def count_cards(cards)
  value_total = 0
  ace_cnt = 0

  cards.each do |suit|
    suit.each_value do |card|
      card.each_value do |card_value|
        ace_cnt += 1 if card_value == 11
        value_total += card_value
      end
    end
  end

  while (value_total > 21) && (ace_cnt > 0)
    value_total -= 10
    ace_cnt -= 1
  end

  value_total
end

def show_cards(cards, all_cards = true)
  if !all_cards
    puts cards.first
  else
    puts cards
  end
end

def play_game
  deck = create_deck
  cards_player = []
  cards_dealer = []

  2.times { cards_player << pull_card(deck) }
  2.times { cards_dealer << pull_card(deck) }

  loop do
    system 'clear screen'
    value_player_cards = count_cards(cards_player)
    if value_player_cards > 21
      puts 'You are busted!'
      break
    end

    puts "Your cards (#{value_player_cards}):"
    show_cards(cards_player)

    puts
    puts 'Dealer cards:'
    show_cards(cards_dealer, false)

    puts 'Hit or Stay [h/s]?'
    hit_or_stay = gets.chomp

    break if hit_or_stay == 's'
    cards_player << pull_card(deck)
  end
end

play_game
