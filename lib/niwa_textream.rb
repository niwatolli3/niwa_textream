require "niwa_textream/version"

%w[ models/category ].each do |file|
  require "niwa_textream/#{ file }"
end

