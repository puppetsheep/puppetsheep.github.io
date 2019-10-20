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
- <div class="note default no-icon"><p>NaN，即非数值（Not a Number）是一个特殊的数值，这个数值用于表示一个本来要返回数值的操作数未返回数值的情况（这样就不会抛出错误了）。任何数值除以0会返回NaN</p></div>
- <div class="note danger no-icon"><p>首先，任何涉及NaN的操作（例如NaN/10）都会返回NaN。其次，NaN与任何值都不相等，包括NaN本身。</p></div>
- <div class="note danger no-icon"><p>针对以上特点，定义了isNaN()函数。在基于对象调用isNaN()函数时，会首先调用对象的valueOf()方法，然后确定该方法返回的值是否可以转换为数值。如果不能，则基于这个返回值再调用toString()方法，再测试返回值。</p></div>
- Number()
```javascript
var num1 = Number("Hello world!");      //NaN 
var num2 = Number("");                  //0 
var num3 = Number("000011");            //11 
var num4 = Number(true);                //1
```
- parseInt()
```javascript
var num1 = parseInt("1234blue");    // 1234 
var num2 = parseInt("");            // NaN 
var num3 = parseInt("0xA");         // 10（十六进制数）
var num4 = parseInt(22.5);          // 22 
var num5 = parseInt("070");         // 56（八进制数）
var num6 = parseInt("70");          // 70（十进制数）
var num7 = parseInt("0xf");         // 15（十六进制数）
***
var num1 = parseInt("10", 2);      //2  （按二进制解析）
var num2 = parseInt("10", 8);      //8  （按八进制解析）
var num3 = parseInt("10", 10);     //10 （按十进制解析）
var num4 = parseInt("10", 16);     //16 （按十六进制解析）
```
- parseFloat()
```javascript
//parseFloat()只解析十进制值
var num1 = parseFloat("1234blue");          //1234 （整数）
var num2 = parseFloat("0xA");               //0 
var num3 = parseFloat("22.5");              //22.5 
var num4 = parseFloat("22.34.5");           //22.34 
var num5 = parseFloat("0908.5");            //908.5 
var num6 = parseFloat("3.125e7");           //31250000
```

### String类型
- <div class="note info no-icon"><p>任何字符串的长度都可以通过访问其length属性取得</p></div>
- <div class="note info no-icon"><p>字符串一旦创建，它们的值就不能改变。只能先销毁，后填充。</p></div>
#### toString()方法
```javascript
var age = 11; 
var ageAsString = age.toString();         // 字符串"11" 
var found = true; 
var foundAsString = found.toString();     // 字符串"true"
//****可以用于进制转换**********
var num = 10; 
alert(num.toString());         // "10" 
alert(num.toString(2));        // "1010" 
alert(num.toString(8));        // "12" 
alert(num.toString(10));       // "10" 
alert(num.toString(16));       // "a"
//*****也会直接转换为返回结果*****
var value1 = 10; 
var value2 = true; 
var value3 = null; 
var value4; 
alert(String(value1));     // "10" 
alert(String(value2));     // "true" 
alert(String(value3));     // "null" 
alert(String(value4));     // "undefined"
```
### Object类型
- <div class="note info "><p>对象，其实就是一组数据和功能的集合，需要new一个(你懂的)</p></div>
```javascript
var o = new Object();
var o = new Object; // 有效，但不推荐省略圆括号
```
#### Object的每个实例都具有下列属性和方法
- constructor：保存着用于创建当前对象的函数。对于前面的例子而言，构造函数（constructor）就是Object()。
- hasOwnProperty(propertyName)：用于检查给定的属性在当前对象实例中（而不是在实例的原型中）是否存在。其中，作为参数的属性名（propertyName）必须以字符串形式指定（例如：o.hasOwnProperty("name")）。
- isPrototypeOf(object)：用于检查传入的对象是否是传入对象的原型。
- propertyIsEnumerable(propertyName)：用于检查给定的属性是否能够使用for-in语句来枚举。与hasOwnProperty()方法一样，作为参数的属性名必须以字符串形式指定。
- toLocaleString()：返回对象的字符串表示，该字符串与执行环境的地区对应。
- toString()：返回对象的字符串表示。
- valueOf()：返回对象的字符串、数值或布尔值表示。通常与toString()方法的返回值相同。

### 关于javascript的趣向
```javascript
//可以直接f12尝试一下
> typeof(NaN)
"number"
> 99999999999
99999999999
> 9999999999999999999
10000000000000000000
> 0.5+0.1==0.6
true
> 0.1+0.2==0.3
false
> Math.max()
-Infinity
> Math.min()
Infinity
> []+[]
""
> []+{}
"[object Object]"
> {}+[]
0
> true+true+true===3
true
> true-true
0
> true==1
true
> true===1
false
> (!+[]+[]+![]).length
9
> 9+"1"
"91"
> 91-"1"
90
> []==0
true
> (!(~+[])+{})[--[~+""][+[]]*[~+[]] + ~~!+[]]+({}+[])[[~!+[]]*~+[]]
"sb"
```