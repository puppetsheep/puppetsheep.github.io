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

## 区分大小写
- <div class="note info no-icon"><p>一切（变量、函数名和操作符）都区分大小写。而函数名不能使用typeof，因为它是一个关键字，但typeOf则完全可以是一个有效的函数名。</p></div>

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


