module Metrika
  module Api
    module Traffic
      
      def get_stats	counter_id
        self.get "http://api-metrika.yandex.ru/stat/traffic/summary", {"id" => counter_id}
      end

      def get_stats_by_site	site
        counters = self.get_counters
        counters.each do |counter|
          if counter["site"] == site
            break self.get "http://api-metrika.yandex.ru/stat/traffic/summary", {"id" => counter["id"]}
          end
        end
      end

    end
  end
end