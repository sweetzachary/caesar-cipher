require 'pry-byebug'

def caesar_cipher(str, offset)
    str.split('').map {|c| shift_letter c, offset}.join('')
end

def shift_letter(l, offset)
    types = {upper: Array('A'..'Z'),
             lower: Array('a'..'z'),
             number: Array('0'..'9')}
    binding.pry
    type = types.filter_map {|t, val| t if val.include? l}[0]
    if type != nil && l.ord + offset > types[type].last.ord then
        (types[type].first.ord - 1 + (l.ord + offset - types[type].last.ord)).chr
    elsif type != nil then
        (l.ord + offset).chr
    else
        l
    end
end

puts caesar_cipher(gets, gets.to_i)