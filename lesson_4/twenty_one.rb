HIDE_DEALER_CARDS = true

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

def show_cards(cards, hide_cards = false)
  puts hide_cards ? cards.first : cards
end

def winner?(cards_player, cards_dealer)
  value_player_cards = count_cards(cards_player)
  value_dealer_cards = count_cards(cards_dealer)

  if value_player_cards == 21 ||
     value_player_cards > value_dealer_cards
    'player'
  elsif value_dealer_cards == 21 ||
        value_player_cards < value_dealer_cards
    'dealer'
  else
    'no one, it is a tie'
  end
end

def display_stats(cards_player, cards_dealer, hide_dealer_cards = false)
  system 'clear screen'

  puts "Your cards (#{count_cards(cards_player)}):"
  show_cards(cards_player)

  puts
  puts "Dealer cards (#{count_cards(cards_dealer) unless hide_dealer_cards}):"
  show_cards(cards_dealer, hide_dealer_cards)
end

def play_game
  deck = create_deck
  cards_player = []
  cards_dealer = []

  2.times { cards_player << pull_card(deck) }
  2.times { cards_dealer << pull_card(deck) }

  loop do
    display_stats(cards_player, cards_dealer, HIDE_DEALER_CARDS)

    value_player_cards = count_cards(cards_player)
    busted = true if value_player_cards > 21

    if busted
      puts 'You are busted!'
      break
    end

    puts 'Hit or Stay [h/s]?'
    hit_or_stay = gets.chomp

    break if hit_or_stay == 's' || value_player_cards == 21

    cards_player << pull_card(deck)
  end

  loop do
    display_stats(cards_player, cards_dealer)

    value_dealer_cards = count_cards(cards_dealer)

    if value_dealer_cards > 21
      puts 'Dealer busted, you win'
      break
    elsif value_dealer_cards <= 17
      cards_dealer << pull_card(deck)
    else
      break
    end
  end

  puts "The winner is #{winner?(cards_player, cards_dealer)}"
end

loop do
  play_game
  puts 'Do you want to play again? [y/n]'
  play_again = gets.chomp
  break unless play_again == 'y'
end
