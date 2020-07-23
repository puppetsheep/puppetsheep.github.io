title: 微信小程序前端实现日期自动化
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
date: 2020-5-21 16:36:10
---

### 问题描述
> json格式被组件所限制，再通过前端的操作方式去实现同接口多页面应用。
<!-- more -->
- json格式如下
```json
[{
    "id": 0,
    "name": "05",
    "day": [*长度为16*] 
},{
    "id": 1,
    "name": "06",
    "day": [*长度为17*] 
},{
    "id": 2,
    "name": "07",
    "day": [*长度为15*] 
}]
```

### 解决方案

> 解决思路：根据现在的时间与起点时间计算已经经过的天数，再对json中的对象截取，最后替代

- 代码如下：
```javascript
exp(){
    //起点时间
    let BirthDay = new Date("05/01/2020 00:00:00");
    //当前时间
    let today = new Date();
    let timeold = (today.getTime() - BirthDay.getTime());
    let sectimeold = timeold / 1000
    let secondsold = Math.floor(sectimeold);
    let msPerDay = 24 * 60 * 60 * 1000
    let e_daysold = timeold / msPerDay
    //已过天数
    let daysold = Math.floor(e_daysold);
    // console.log(daysold, today, timeold, sectimeold, secondsold, msPerDay, e_daysold)
    //json已保存为this.data.section，此处在上一篇博客已说明方法
    let slice = this.data.section;
    let daytemp = daysold+1;
    //将超出部分改为null
    /*
    其实可以通过if判断直接去修改daytemp的值，
    daytemp=daytemp>slice[i].day.length?daytemp-slice[i].day.length:daytemp
    */
    for (let i = 0; i < slice.length; i++) {
      if (daytemp > slice[i].day.length) {
        daytemp -= slice[i].day.length
        continue;
      } else {
        for (let j = 0; j < slice[i].day.length; j++) {
          daytemp -= 1;
          if (daytemp < 0) {
            slice[i].day[j] = null
          }
        }
        //去重
        slice[i].day = [...new Set(slice[i].day)]
        //根据空值去尾
        if (slice[i].day[slice[i].day.length] == null) {
          slice[i].day.pop()
        }
      }
    }
    //去重
    slice = [...new Set(slice)]
    //根据空值去尾
    for (let k = slice.length; k > 0; k--) {
      if (slice[k - 1].day.length == 0) {
        slice.pop()
      }
    }
    //异步问题
    let temp = slice
    // console.log(temp)
    this.setData({
      section: temp
    })
  }
```

> 由此，就能直接达到提前写好数据，后面自动根据日期显示，建议获取当前时间以服务器时间为准，便于控制。

------
- 在其他页面则是直接使用当前时间的day
```JavaScript
if (daytemp == 0) {
     this.setData({
      content: slice[i].day[j]
     })
    break;
  }
//以及
if(daytemp==0){
   break;
}
```


