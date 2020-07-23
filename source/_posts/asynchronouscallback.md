title: 微信小程序request异步问题解决方案
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
date: 2020-5-19 01:10:10
---

## 问题简介
- <div class="note info no-icon"><p>在`onLoad()`的同时又需要控制一个新定义的数组长度，此时会存在`wx.request()`的异步问题，即无法取到`this.data.xxx`。</p></div>
<!-- more -->
```javascript
//已在data中定义section
var that = this;
var list = [{}];
wx.request({
      url: 'https:（你所需要请求的地址）',
      header: {
        'content-type': 'application/json'
      },
      method: 'GET',
      dataType: 'json',
      responseType: 'text',
      success: function (res) {
        if (res.statusCode == 200) {
          that.setData({
            section: res.data
          })  
        }
      }
    })
    console.log(this.data.section)//输出结果为空，即原始定义
```

## 解决方案
- <div class="note info"><p>直接将`this.data.section`的相关操作移到外部去。</p></div>
```JavaScript
createList(){
    console.log(this.data.section)
},
onLoad(){
    ……省略
    success: function (res) {
        if (res.statusCode == 200) {
          that.setData({
            section: res.data
          })  
        }
        that.createList() //输出为 section ，即res.data
      }
    ……省略
}
```

## 拓展思路
- <div class="note info"><p>如果需要创建数组，其实可以进行套用此方法</p></div>
```javascript
createlist(){
    var list = [{}];
    for (let i = 0; i < this.data.section.length; i++) {
      list[i] = {};
      list[i].name = String.fromCharCode(65 + i);
      list[i].id = i;
    }
    this.setData({
      list: list,
      listCur: list[0]
    })
  },
  onLoad() {
    var that = this;
    wx.request({
      url: 'https://（你所需要请求的地址）',
      data: '',
      header: {
        'content-type': 'application/json'
      },
      method: 'GET',
      dataType: 'json',
      responseType: 'text',
      success: function (res) {
        if (res.statusCode == 200) {
          // console.log(res.data)
          that.setData({
            section: res.data
          })  
          that.createlist()
        }
      },
      fail: function (res) { },
      complete: function (res) { },
    })
    
  },
```
- 此时`this.data.section`可用于`onLoad()`地方。简单来说，就是由此所产生的问题，可直接将需要进行的操作移到`onLoad()`外部，然后再进行调用。

> 好了就这样啦~~ψ(｀∇´)ψ