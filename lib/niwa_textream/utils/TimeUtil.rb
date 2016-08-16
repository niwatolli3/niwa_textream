module NiwaTextream
  class TimeUtil
    def self.getDateTime(str_date)
      begin
        ret = DateTime.strptime(str_date, "%Y年%m月%d日 %H:%M")
        return ret if ret != nil
      rescue ArgumentError
        # do nothing
      end

      ret = DateTime.strptime(str_date, "%m月%d日 %H:%M")
    end
  end
end