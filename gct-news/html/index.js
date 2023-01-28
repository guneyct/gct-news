$(document).ready(function(){
    
    window.addEventListener("message", function(event){
        switch (event.data.action) {
            case "open":
                OpenImage(event.data.url);
                break;
        }
			
    })
    
    var modal = document.getElementById("myModal");
    OpenImage = function (url) {
    
        
        var modalImg = document.getElementById("img01");
    
        modal.style.display = "block";
        modalImg.src = url;
    };
    
    var span = document.getElementsByClassName("close")[0];
    
    span.onclick = function () {
        modal.style.display = "none";
        $.post('https://gct-news/ClosePaper');
    }
});