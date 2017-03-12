class CodeMatch

  def self.encrypt(message)
    encrypted_message=""

    message.downcase.each_char do |c|
      encrypted_char = self.code_table[c]
      if encrypted_char
        encrypted_message +=  encrypted_char
      elsif self.code_table.value?(c)
        encrypted_message +=  "\\#{c}"
      else
        encrypted_message += c
      end
    end

    return encrypted_message
  end

  def self.decrypt(message)
    decrypted_message=""
    downcased_message_array=message.downcase.split('')

    downcased_message_array.each_with_index do |c,i|
      decrypted_char = self.code_table.key(c)
      if decrypted_char
        decrypted_message +=  decrypted_char
      elsif c == "\\"
        decrypted_message += downcased_message_array[i+1]
        downcased_message_array.delete_at(i+1)
      else
        decrypted_message += c
      end
    end

    return decrypted_message
  end

  def self.code_table

    {
      'a': '@',
      'b': '%',
      'c': '€',
      'd': '_',
      'e': '~',
      'f': '#',
      'g': '^',
      'h': ';',
      'i': '|',
      'j': "'",
      'k': '>',
      'l': '*',
      'm': '<',
      'n': '£',
      'o': '0',
      'p': '"',
      'q': '=',
      'r': '+',
      's': '$',
      't': '/',
      'u': '&',
      'v': '?',
      'w': '!',
      'x': '-',
      'y': '¥',
      'z': ','
    }.with_indifferent_access

  end

end
