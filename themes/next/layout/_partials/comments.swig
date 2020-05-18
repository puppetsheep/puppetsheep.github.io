{% if page.comments %}

	<script src="//cdn.jsdelivr.net/npm/leancloud-storage/dist/av-min.js"></script>
  <div class="comments" id="comments"></div>
    <script src='//cdn.dode.top/Hitalk.min.js'></script>
   <script type="text/javascript">
    var GUEST = ['nick','mail','link'];
    var guest = '{{ theme.hitalk.guest_info }}';
    guest = guest.split(',').filter(function (item) {
      return GUEST.indexOf(item)>-1;
    });
    new Hitalk({
        el: '#comments',
        appId: '{{ theme.hitalk.appid }}',
        appKey: '{{ theme.hitalk.appkey }}',
        placeholder: '{{ theme.hitalk.placeholder }}',
        avatar:'{{ theme.hitalk.avatar }}',
        guest_info:guest
    });
  </script>
  <script type="text/javascript">
    function UA(_this) {
    function _indexOf(name) {
      return $(_this).text().indexOf(name) == 0
    }

    function _prepend(name) {
      $(_this).prepend('<img class="' + name + '" src="https://cdn.dode.top/ua_icon/' + name + '.svg">')
    }

    if (_indexOf('Safari')) {
      _prepend("Safari")
    } else if (_indexOf('Mac') || _indexOf('iOS')) {
      _prepend("Apple")
    } else if (_indexOf('Chrome')) {
      _prepend("Chrome")
    } else if (_indexOf('Firefox')) {
      _prepend("Firefox")
    } else if (_indexOf('Windows 10')) {
      _prepend("Windows10")
    } else if (_indexOf('Windows') || _indexOf('Windows 7') || _indexOf('Windows 8') || _indexOf('Windows 9')) {
      _prepend("Windows7")
    } else if (_indexOf('Android')) {
      _prepend("Android")
    } else if (_indexOf('Ubuntu')) {
      _prepend("Ubuntu")
    } else if (_indexOf('Linux')) {
      _prepend("Linux")
    } else if (_indexOf('Microsoft Edge') || _indexOf('MSIE')) {
      _prepend("IE")
    } else if (_indexOf('Sogou')) {
      _prepend("Sogou")
    } else if (_indexOf('XiaoMi')) {
      _prepend("Xiaomi")
    }
    addUBZime_g()
  }

  function isUA(_this) {
    if ($(window).width() <= 520) {
      $(_this).text($(_this).text().split(' ').shift())
    }
    UA(_this)
  }
  var addUVTime_g = setInterval(function() {
    if ($('.vhead:first .vsys>img').length == 0) {
      $('.vhead .vsys').each(function() { isUA(this) })
    } else {
      clearInterval(addUVTime_g)
    }
  }, 100)

  function addUBZime_g() {
    $('.vhead a[href*="puppetsheep.cn"]:not(.bozhu)').addClass('bozhu').after('<span class = "bozhu vsys">博主</span>')
  }

  // 点击提交
  $('.vsubmit.vbtn').on('click', function() {
    var addUVTime = setInterval(function() {
      if ($('.vhead:first .vsys>img').length == 0) { $('.vhead:first .vsys').each(function() { isUA(this) }) } else { clearInterval(addUVTime) }
    }, 1000)
  })

  // 点击翻页
  $(document).on('click', '.vpage .page-numbers', function() {
    var addUVTime = setInterval(function() {
      if ($('.vhead:last .vsys>img').length == 0) { $('.vhead .vsys').each(function() { if ($(this).html().indexOf('img') == -1) { isUA(this) } }) } else { clearInterval(addUVTime) }
    }, 1000)
  })
  </script>



  {% if theme.facebook_sdk.enable and theme.facebook_comments_plugin.enable %}
    <div class="comments" id="comments">
      <div class="fb-comments"
           data-href="{{ page.permalink }}"
           data-numposts="{{ theme.facebook_comments_plugin.num_of_posts }}"
           data-width="{{ theme.facebook_comments_plugin.width }}"
           data-colorscheme="{{ theme.facebook_comments_plugin.scheme }}">
      </div>
    </div>

  {% elif theme.vkontakte_api.enable and theme.vkontakte_api.comments %}
    <div class="comments" id="comments">
      <div id="vk_comments"></div>
    </div>

  {% elif theme.disqus.enable %}
    <div class="comments" id="comments">
      <div id="disqus_thread">
        <noscript>{#
        #}Please enable JavaScript to view the comments powered by Disqus.{#
      #}</noscript>
      </div>
    </div>

  {% elif theme.livere_uid %}
    <div class="comments" id="comments">
      <div id="lv-container" data-id="city" data-uid="{{ theme.livere_uid }}"></div>
    </div>

  {% elif theme.changyan.enable and theme.changyan.appid and theme.changyan.appkey %}
    <div class="comments" id="comments">
      <div id="SOHUCS"></div>
    </div>

  {% elif theme.gitment.enable %}
    <div class="comments" id="comments">
      {% if theme.gitment.lazy %}
        <div onclick="showGitment()" id="gitment-display-button">{{ __('gitmentbutton') }}</div>
        <div id="gitment-container" style="display: none"></div>
      {% else %}
        <div id="gitment-container"></div>
      {% endif %}
    </div>

  {% elif theme.valine.enable and theme.valine.appid and theme.valine.appkey %}
    <div class="comments" id="comments">
    </div>

  {% elif theme.gitalk.enable %}
    <div class="comments" id="gitalk-container">
    </div>

  {% endif %}

{% endif %}
