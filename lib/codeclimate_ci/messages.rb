module CodeclimateCi
  class Messages
    def self.result_not_ready
      puts 'Please wait. Code Climate is analyzing your branch.'
    end

    def self.message_for_worse_code
      puts 'Code in your branch became worse'
    end

    def self.message_for_good_code
      puts 'Code in your branch is good. Go on...'
    end
  end
end
