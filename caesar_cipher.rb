def caesar_cipher(str, offset)
    str.split('').map {|c| shift_letter c, offset}.join('')
end

def shift_letter(l, offset)
    types = {
        upper: ['A', 'Z'],
        lower: ['a', 'z'],
        number: ['0', '9']}
    type = types.filter_map {|t, val| t if l.between? val.first, val.last}[0]

    if type != nil && l.ord + offset > types[type].last.ord then
        (types[type].first.ord - 1 + (l.ord + offset - types[type].last.ord)).chr
    elsif type != nil then
        (l.ord + offset).chr
    else
        l
    end
end

puts caesar_cipher(gets, gets.to_i)