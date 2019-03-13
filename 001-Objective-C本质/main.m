/** Objective-C 本质
 
我们平时编写的Objective-C 代码, 底层实现,其实都是基于 C/C++代码实现的
 
Objective-C --> C/C++ --> 汇编语言 --> 机器语言
 
所以,Objective-C 代码的面向对象是基于 C/C++ 数据结构实现的
 
 */

/** 将Objective-C 代码转换为 C/C++ 代码

 1> 方式1:(不推荐)
 clang -rewrite-objc main.m -o mian.cpp
 
 2> 方式2:(推荐),
 xrun -sdk iphoneos clang -arch arm64 -rewrite-objc main.m -o mian.cpp
 
 // 指令分3段记:
 // xcrun -sdk iphoneos
 // clang -arch arm64
 // -rewrite-objc main.m -o main-objc.cpp
 //模拟器(i386)/ 32bit(armv7)/ arm64(arm64)
 
 */

#import <Foundation/Foundation.h>
#import <objc/runtime.h> //class_getInstanceSize 获取实例对象的大小
#import <malloc/malloc.h>//

@interface Person : NSObject // 占用16字节
{
    int _age;
}
@end
@implementation Person
@end

@interface Student : Person // 占用16字节
{
    int _no;
}
@end
@implementation Student
@end


/*******Objective-C 真实的C/C++数据结构******************************/
// NSObject 的真实结构
struct NSObject_IMPL {
    Class isa;
};

// Person 的真实结构
struct Person_IMPL {
    struct NSObject_IMPL NSObject_IVARS;
    int _age;
};

// Student 的真实结构
struct Student_IMPL {
    struct Person_IMPL Person_IVARS;
    int _no;
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSObject *objc = [[NSObject alloc]init];

        // 获取NSObject类实例对象的大小(>=8), 成员变量占用的大小
        NSLog(@"instanceSize:  %zd",class_getInstanceSize([NSObject class]));
        // 获取objc 指针, 指向的内存空间的大小(>=16)
        // CF 规定, 所有的对象最小16字节
        NSLog(@"malloc_size: %zd",malloc_size((__bridge const void *)(objc)));
 
        // 源码: opensource/apple/com/tarballs
    
    }
    return 0;
}
