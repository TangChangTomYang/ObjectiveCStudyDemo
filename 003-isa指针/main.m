/** OC中的对象(实例对象/ 类对象/ 元类对象)

 1. 实例对象
 1> 每个实例对象的内存地址是不同的
 2> 实例对象中存储的是 isa 指针和其他成员变量
 
 2. 类对象
 1> 一个类有且只有一个类对象
 2> 类对象中存储有isa 指针/ superclass指针/ 属性(@property)/ 实例方法/ 协议信息/ 成员变量ivar等
 
 3. 元类对象
 1> 每个类有且只有一个元类对象, 元类对象和类对象的数据结构是一样的, 只是功能不一样(存储的数据内容不同)
 2> 元类对象内存储有isa指针/ superclass指针/ 类方法等
 
 */


/** isa 指针

 1. 对象的isa指针指向哪里?
 
 2. oc 的类信息存放在哪里?
 
 
 */

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
