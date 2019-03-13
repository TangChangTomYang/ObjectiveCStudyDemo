






#import <Foundation/Foundation.h>
#import <objc/runtime.h> // 通过运行时, 可以获取一个实例对象的类对象

/** 对象
 在Objective-C中, 有3种类型的对象
 - 实例对象instance
 - 类对象 class
 - 元类对象 meta-class
 */



/** 实例对象
 1> 什么是实例对象?
 通过类对象 alloc 出来的对象就是实例对象, 不同的实例对象的内存地址是不一样的
 2> 实例对象中存储的是自己的成员变量(包含从父类继承过来的成员变量)
 */
// 获取实例对象
void instanceObjc(){
    NSObject *obj1 = [[NSObject alloc]init];
    NSObject *obj2 = [[NSObject alloc]init];
    NSLog(@"%p, %p", obj1, obj2);
}

/** 类对象
 1> 什么是类对象?
类对象就是描述实例对象的类, 每个类在内存中有且只有一个类对象
 2> 类对象内存中存储的信息主要有:
 - isa 指针
 - superclass指针
 - 类的属性信息(property)/ 类的对象方法信息(instance Method)
 - 类的协议信息(protocol)/ 类的成员变量信息(ivar(类型名称))
 ... ...
 */
//获取类对象
void classObj(){
    NSObject *obj1 = [[NSObject alloc]init];
    NSObject *obj2 = [[NSObject alloc]init];
    
    //clsObj1~clsObj5 都是同一个类对象
    Class clsObj1 = [obj1 class];
    Class clsObj2 = [obj2 class];
    
    Class clsObj3 = [NSObject class];
    
    Class clsObj4 = object_getClass(obj1); // runtime API
    Class clsObj5 = object_getClass(obj2); // runtime API
    
    NSLog(@"%p, %p, %p, %p, %p",clsObj1, clsObj2, clsObj3, clsObj4, clsObj5 );
   
}



/** 元类对象 meta-class
1> 什么是元类对象?
- 元类对象就是描述对象的对象, 在内存中每个类有且只有一个元类对象
- 类对象的数据结构和元类对象的数据结构是一样的,只是用途不一样, 包含的信息不一样

 2> 元类对象内存中存储的信息主要有
 - isa 指针
 - superclass 指针
 - 类的类方法信息
 ... ...

 */

// 获取元类对象, 将类对象作为参数获取的就是元类对象
void MetaClass(){
    NSObject *obj = [[NSObject alloc]init];
    
    Class clsObj1 = [obj class];
    Class clsObj2 = [NSObject class];
    Class clsObj3 = object_getClass(obj);
    
    
    
    Class mCls1 = object_getClass(clsObj1);
    Class mCls2 = object_getClass(clsObj2);
    Class mCls3 = object_getClass(clsObj3);
    
    NSLog(@"%p, %p, %p",mCls1,mCls2,mCls3);
    
    
    // 注意:
    // 只有通过runtime的运行时方法,将类对象作为参数才能获取到元类对象
    //NSLog(@"%s",object_getClassName(obj2));
    
    // 查看一个类是否为元类对象
    BOOL isMetaClass = class_isMetaClass(mCls3);
    
    // 为什么通过 object_getClass 方法可以获取一个实例对象的类对象, 获取一个类对象的元类对象呢?
    // 如果obj是一个instance 返回的就是 类对象
    // 如果obj 是一个类对象 返回的就是元类对象
    // 如果obj 是一个元类对象 返回的就是NSObject
    //Class object_getClass(id obj){
    //    if(obj) return obj->getIsa();
    //   return nil;
    //}
    
}



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 实例对象
        instanceObjc();
        // 类对象
        classObj();
        // 元类对象
        MetaClass();
        
    }
    return 0;
}

/**
 1. Class objc_getClass(const char *aClassName)
 1> 传入字符串类名
 2> 返回对应的类对象
 
 2. Class object_getClass(id obj)
 1> 传入的obj 可能是instance对象/ class对象/ meta-class 对象
 2> obj = instance对象, 返回类对象
    obj = Class 对象, 返回元类对象
    obj = meta-class, 返回NSObjec 基类
 */




