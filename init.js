window.addEventListener("DOMContentLoaded", function() {
    const section = document.querySelector('section');
    let controller = null;
    
    hljs.addPlugin(
        new CopyButtonPlugin({
            autohide: false
        })
    );
    
    marked.use({
        async : true,
        gfm : true
    });
    
    function getPage() {
        return new Promise((resolve, reject) => {
            if(controller != null) {
                controller.abort();
            }
            controller = new AbortController();
            const params = new URLSearchParams(window.location.search);
            let page = params.get("p");
            if(!page || page == "" || page == "home")
                page = "getstarted";
    
            fetch(new URL("./Docs/" + page + ".md", window.location.href), { signal : controller.signal }).then(response => {
                if(response.ok)
                    return response.text();
            }).then(result => {
                marked.parse(result).then(formatted => {
                    resolve(document.createRange().createContextualFragment(`<div class="content" id="top">${formatted}</div>`));
                })
            }).catch(err => {
                reject();
            })
        })
    }
    
    document.querySelector("button#download").addEventListener("click", e => {
        e.preventDefault();
        let a = Object.assign(document.createElement('a'), {
            href : new URL("./xs/Rs.xs", window.location.href).toString(),
            download : "Rs.xs"
        });
        a.click();
        a = null;
    });
    
    Array.from(document.querySelectorAll("nav a")).forEach(v => {
        v.addEventListener("click", e => {
            e.preventDefault();
            history.pushState({}, "", e.target.href);
            getPage().then(response => {
                if(section.firstChild)
                    section.firstChild.remove();
                section.append(response);
                hljs.highlightAll();
            });
        })
    });
    
    getPage().then(response => {
        section.append(response);
        hljs.highlightAll();
    });
});
