require 'method_decorators'
require 'pp'
module SnooDecorators
class PermissionCondition < MethodDecorators::Decorator
  
  def initialize(permission)
    @permission=permission
  end
  def call(wrapped,this,*args,&blk)
    m=args[0]
    
    if Permission.has? m.user.authname,@permission
      wrapped.call(*args,&blk)  
    else
      m.reply "Sorry, you do not have permission to do that."
    end
    
  end
  

end
end