class CaesarCipher
  def initialize; end

  def use(str, offset)
    str.split('').map { |c| shift_letter c, offset }.join('')
  end

  private

  def shift_letter(l, offset)
    types = {
      upper: %w[A Z],
      lower: %w[a z],
      number: %w[0 9]
    }
    type = types.filter_map { |t, val| t if l.between? val.first, val.last }[0]

    if !type.nil? && l.ord + offset > types[type].last.ord
      (types[type].first.ord - 1 + (l.ord + offset - types[type].last.ord)).chr
    elsif !type.nil?
      (l.ord + offset).chr
    else
      l
    end
  end
end

