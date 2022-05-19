// swap_password 事件，修改 password input 的type
window.addEventListener("swap_password",
    e => {
        console.log("target swap_password!", e.target);
        if(e.target.type == "text"){
            e.target.type="password";
        }else{
            e.target.type="text";
        }
    })

// 测试 JS.dispatch("modal-open", to: selector, detail: %{x: 100, y: 200})
window.addEventListener("modal-open",
    e =>
    {
        console.log("modal-open event!", e.detail)
        console.log("modal-open event!", e.target)
    }
)