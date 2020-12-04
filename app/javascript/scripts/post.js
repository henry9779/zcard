document.addEventListener("DOMCotentLoaded", function() {
    const favorite_btn = document.querySelector('#favorite_btn')
    if (favorite_btn) {
        favorite_btn.addEventListener("click", function(exe) {
                exe.preventDefault()
                    // 開API,送資料,AJAX
                const ax = require('axios')
                    // 引入axios套件
                const token = document.querySelector('[name=csrf-token]').content
                    // 頁面一開始 header 就會生成 token, 在lay_out csrf_meta_tags直接拿來用
                ax.defaults.headers.common['X-CSRF-TOKEN'] = token
                    // 拿取 header 的 token
                ax.post(`/posts/${postId}/favorite`, {})
                    //對這個路徑送,不給參數
                    .then(funcion(resp)) {
                        //成功走這條
                        console.log(resp)
                    })
            .catch(function(err) {
                //失敗
                console.log(err)
            })
        })
}
})