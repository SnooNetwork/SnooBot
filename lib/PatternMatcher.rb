require 'singleton'
class PatternMatcher
  include Singleton
  
  @patternCache={}
  def initialize
    
    @patternCache={}
  end
  def isMatches(expression,permission)
    regex=@patternCache[expression]
    
    if regex.nil?
      regex=@patternCache[expression]=createPattern(expression)
    end
    return regex.match(permission)
  end
  
  
  def createPattern(expression)
    Regexp.new prepareRegex(expression) , Regexp::IGNORECASE
  end
  
  def prepareRegex(expression)
    if expression.start_with?('-')
      expression=expression[1,expression.length]
    end
    
    expression=expression.sub(/\./,'\\.').sub(/\*/,"(.*)")
  end
end