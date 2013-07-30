base=DbObject.new(name: "Base",group:true)
base.save!

chanOp=DbObject.new(name: "ChanOp",group: true)
chanOp.parent=base
chanOp.save!

sysOp=DbObject.new(name: "SysOp",group: true)
sysOp.parent=chanOp
sysOp.save!

nekosune=DbObject.new(name: "nekosune",group: false)
nekosune.parent=sysOp
nekosune.save!