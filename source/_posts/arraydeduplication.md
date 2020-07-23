title:  数组去重的一些方法
author: puppetsheep
tags:
  - JavaScript
categories: [技术]
description: 一些较为常用的方法
mathjax: true
passage_end: true
copyright: true
copy_button: true
date: 2020-7-23 14:16:24
---
## 使用JavaScript进行数组去重的方法有很多，这里就列举一些较为常用的方法，以作参考。

<!-- more -->

## 1、双for循环
> `不推荐使用`依次遍历数组中的每一项,拿当前项和其”后面”的每一项进行比较,如果后面中有和他相同的,则说明这项是重复的,我们把后面中重复的这一项删除掉即可
<div class="note warning"><p>多次循环，性能不好</p></div>
```javascript
let array = [1,1,4,5,1,4,1,9,1,9,8,1,0]
for (let i = 0; i < array.length-1; i++) {
    const item = array[i];
    for(let j = i + 1 ;j < array.length; j++){
        if(item === array[j]){
            array[j]=array[array.length-1]
            array.length--
            j--
        }
    }
}
console.log(array) //[1, 0, 4, 5, 8, 9]
```

## 2、对象的键值对方式
> 利用对象中属性名不能重复的特点,先建立-个空对象,然后依次循环数组中的每一项,把此项作为obj对象的属性名和属性值,在添加的时候如果这个属性名对应的值已经存在,说明此项重复,删除掉此项
<div class="note info"><p>只有一个循环，性能较好</p></div>
<div class="note warning"><p>如果数组中存在数字`10`和字符串`'10'`,则也会认为是重复的（对象中的属性名是数字和字符串没什么区别）</p><p>如果数组中出现对象则存在问题(因为对象的属性名不能是对象，遇到会转换成字符串)</p><p>数组中的值如果是`undefined`可能也会出现问题</p></div>
```JavaScript
let array = [1,1,4,5,1,4,1,9,1,9,8,1,0]
let obj ={}
for (let i = 0; i<array.length;i++) {
    let item = array[i]
    if(obj[item] !== undefined){
        array[i] = array[array.length -1]
        array.length--
        i--
        continue
    }
    obj[item] = item
}
console.log(array) //[1, 0, 4, 5, 8, 9]
```

## 3、indexOf检测的方式
> 创建一个新数组，遍历原数组，如果新数组中没有那一项，就push进去
```javascript
let array = [1, 1, 4, 5, 1, 4, 1, 9, 1, 9, 8, 1, 0]
let newarr = []
for(i in array){
    let item = array[i]
    if(newarr.indexOf(item) == -1)
    newarr.push(item)
}
console.log(newarr) //[1, 4, 5, 9, 8, 0]
```


## 4、Set
> ES6 提供了新的数据结构 Set。它类似于数组，但是成员的值都是唯一的，没有重复的值。
```javascript
let array = [1, 1, 4, 5, 1, 4, 1, 9, 1, 9, 8, 1, 0]
console.log([...new Set(array)]) //[1, 4, 5, 9, 8, 0]
```

> 也可以通过Set实现两个数组的交并差集

```javascript
let a = new Set([1, 2, 3]);
let b = new Set([4, 3, 2]);

// 并集
let union = new Set([...a, ...b]);
// Set {1, 2, 3, 4}

// 交集
let intersect = new Set([...a].filter(x => b.has(x)));
// set {2, 3}

// （a 相对于 b 的）差集
let difference = new Set([...a].filter(x => !b.has(x)));
// Set {1}
```