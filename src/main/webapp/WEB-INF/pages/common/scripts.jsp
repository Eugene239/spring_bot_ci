<script>
     function $_GET(param) {
        var regex = new RegExp("(?:[?&]+" + param + "=)([^&]*)?", "i");
        var match = regex.exec(window.location.href);
        return match === null ? match : match[1];
    }
</script>