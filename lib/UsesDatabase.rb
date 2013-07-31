require 'method_decorators'
module SnooDecorators
  class UsesDatabase < MethodDecorators::Decorator
  
    def call(wrapped,this,*args,&blk)
      ActiveRecord::Base.connection_pool.with_connection do
        wrapped.call(*args,&blk)  
      end
    end
  end
end