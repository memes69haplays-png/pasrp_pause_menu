window.addEventListener('message', function(event){

    if(event.data.action === "open"){

        document.body.style.display = "block";

        document.getElementById("players").innerText =
            event.data.playerCount;

        document.getElementById("time").innerText =
            event.data.time;
    }

    if(event.data.action === "close"){
        document.body.style.display = "none";
    }
});

function switchTab(id){

    document
        .querySelectorAll('.page')
        .forEach(page => page.classList.remove('active'));

    document
        .getElementById(id)
        .classList.add('active');
}

function closeMenu(){

    fetch(
        `https://${GetParentResourceName()}/close`,
        { method:'POST' }
    );
}

function discord(){
    window.open(
        "https://discord.gg/885Q4jt6Zh",
        "_blank"
    );
}

function mapPage(){

    fetch(
        `https://${GetParentResourceName()}/openMap`,
        { method:'POST' }
    );
}

function settingsPage(){

    fetch(
        `https://${GetParentResourceName()}/settings`,
        { method:'POST' }
    );
}

function disconnectServer(){

    fetch(
        `https://${GetParentResourceName()}/disconnect`,
        { method:'POST' }
    );
}

document.addEventListener('keydown', function(e){

    if(e.key === "Escape"){
        closeMenu();
    }
});
