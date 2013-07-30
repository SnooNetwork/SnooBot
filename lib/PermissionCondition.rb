require 'method_decorators'
module MethodDecorators
class PermissionCondition < MethodDecorators::Decorator
  
  def initialize(permission)
    @permission=permission
  end
  def call(wrapped,this,*args,&blk)
    m=args[0]
    user=User.find_by_account(m.user.authname)
    if user==nil
      user=User.find_by_account("dummyFake")
    end
    
    if Permission.has? user,@permission
      wrapped.call(*args,&blk)  
    else
      m.reply "Sorry, you do not have permission to do that."
    end
    
  end
  

end
end