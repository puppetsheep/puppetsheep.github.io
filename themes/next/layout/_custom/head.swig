{#
Custom head.
#}

<script type="text/javascript" >
	if ('serviceWorker' in navigator) {
  window.addEventListener('load', () => {
    navigator.serviceWorker.register('/sw.js').then(() => {
      console.log('注册成功!')
    })
  })
}
</script>