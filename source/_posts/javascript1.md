title: JavaScript入坑笔记（基础一）
author: puppetsheep
tags:
  - JavaScript
  - WEB
categories: [技术]
description: 技术见拙，如有问题请留言或联系
mathjax: true
passage_end: true
copyright: true
copy_button: true
date: 2019-9-24 12:56:17
---

## 数据类型简介
- <div class="note info no-icon"><p>ECMAScript中有5种简单数据类型（也称为基本数据类型）：Undefined、Null、Boolean、Number和String。还有1种复杂数据类型——Object，Object本质上是由一组无序的名值对组成的。ECMAScript不支持任何创建自定义类型的机制，而所有值最终都将是上述6种数据类型之一。数据类型具有动态性</p></div>

## 标识符
- <div class="note warning"><p>不能把关键字、保留字、true、false和null用作标识符</p></div>

<!-- more -->

## 关键字和保留字
- <div class="note info"><p>可用于表示控制语句的开始或结束，或者用于执行特定操作等。(仅列举ES5)</p></div>
```javascript
//关键字:
break        do            instanceof        typeof        case          
else         new           var               catch         finally       
return       void          continue          for           switch        
while        debugger      function          this          with          
default      if            throw             delete        in            
try

//保留字:
abstract     enum          int               short         boolean       
export       interface     static            extends       long           
super        char          final             native        synchronized 
class        float         package           throws        const         
goto         private       transient         debugger      implements      
protected    volatile      double            import        public 
byte 
```

## 变量
- <div class="note warning no-icon"><p>用var操作符定义的变量将成为定义该变量的作用域中的局部变量。在函数退出后，是会被销毁的</p></div>
```javascript
//例如以下代码
function test(){
    var message = "hi"; // 局部变量
} 
test(); 
alert(message);         // 错误！
```
- <div class="note warning"><p>但如果不使用var定义，则会变成全局（不推荐）</p></div>
```javascript
function test(){
    message = "hi";     // 全局变量
} 
test(); 
alert(message);         // "hi"
```
- <div class="note info"><p>可以使用一条语句定义多个变量</p></div>
```javascript
var message = "hi",     
    found = false,     
    age = 29; 
```

## 数据类型

### typeof操作符
- <div class="note info"><p>对一个值使用typeof操作符可能返回下列某个字符串：</p></div>
- "undefined"——如果这个值未定义；
- "boolean"——如果这个值是布尔值；
- "string"——如果这个值是字符串；
- "number"——如果这个值是数值；
- "object"——如果这个值是对象或null；
- "function"——如果这个值是函数。
```javascript
var message = "some string"; 
alert(typeof message);     // "string" 
alert(typeof(message));    // "string" 
alert(typeof 95);          // "number"
```
- <div class="note warning no-icon"><p>从技术角度讲，函数在ECMAScript中是对象，不是一种数据类型。然而，函数也确实有一些特殊的属性，因此通过typeof操作符来区分函数和其他对象是有必要的。</p></div>

### Undefined类型
- <div class="note info"><p>一般而言，不存在需要显式地把一个变量设置为undefined值的情况。字面值undefined的主要目的是用于比较</p></div>
- <div class="note warning no-icon"><p>即便未初始化的变量会自动被赋予undefined值，但显式地初始化变量依然是明智的选择。如果能够做到这一点，那么当typeof操作符返回"undefined"值时，我们就知道被检测的变量还没有被声明，而不是尚未初始化</p></div>

### Null类型
- <div class="note success"><p>从逻辑角度来看，null值表示一个空对象指针，而这也正是使用typeof操作符检测null值时会返回"object"的原因</p></div>
- <div class="note info"><p>实际上，undefined值是派生自null值的，因此对它们的相等性测试要返回true</p></div>
```javascript
ndefined == null    //true
```

### Boolean类型
- <div class="note default no-icon"><p>true不一定等于1，而false也不一定等于0</p></div>
- <div class="note danger"><p>Boolean类型的字面值true和false是区分大小写的</p></div>

### Number类型
- <div class="note info"><p>浮点数值的最高精度是17位小数，但在进行算术计算时其精确度远远不如整数</p></div>
```javascript
var floatNum1 = 1.1; 
var floatNum2 = 0.1; 
var floatNum3 = .1;  // 有效，但不推荐
var floatNum1 = 1.;        // 小数点后面没有数字——解析为1
var floatNum2 = 10.0;      // 整数——解析为10
var floatNum = 3.125e7;  // 等于31250000
```
- <div class="note danger"><p>0.1加0.2的结果不是0.3,因此，永远不要测试某个特定的浮点数值</p></div>
