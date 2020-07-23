title: 离站替换ico与title(恶搞向技术指南)
author: puppetsheep
tags:
  - JavaScript
  - WEB
categories: [技术]
description: 点其他标签页试试
mathjax: true
passage_end: true
copyright: true
copy_button: true
date: 2020-5-21 17:16:10
---

### 简介
- <div class="note info no-icon"><p>一次突发奇想，我能不能搞点有趣的。例如说离站时自动变成P站。如本站。</p></div>
<!-- more -->
### 实现
```JavaScript
<script type="text/javascript">
var OriginTitile = document.title;
var titleTime;
document.addEventListener('visibilitychange', function () {
    if (document.hidden) {
		$('[rel="icon"]').attr('href', "/images/TEP.ico");
        document.title = 'Free Porn Videos & Sex Movies - Porno, XXX, Porn Tube and Pussy Porn';
        clearTimeout(titleTime);
    }
    else {
		$('[rel="icon"]').attr('href', "/favicon.ico");
        document.title = ' ヾ(◍°∇°◍)ﾉﾞ欢迎回来 ' + OriginTitile;
        titleTime = setTimeout(function () {
            document.title = OriginTitile;
        }, 2000);
    }
});
</script>
```

<div class="note danger no-icon"><p>图标和title是让朋友帮我找的，因为我确实没法科学上网。</p></div>



