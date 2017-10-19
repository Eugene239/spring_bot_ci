function Rest() {
    this.data = [];
    this.fields = [];

    this.GET = "";
    this.DELETE = "";
    this.UPDATE = "";
    this.CREATE = "";
    this.table=undefined;


    this.restGet = function () {
        window.fields = this.fields;
        window.REST = this;
        if (this.GET !== "") {
            console.log(this.GET);
            $.when(
                $.ajax({url: this.GET, type: 'GET'})).then(function (response) {
                window.REST.data=[];
                for(let i=0; i<response.length; i++){
                    window.REST.data.push(getRow(response[i]));
                }
                console.log(window.REST.data);
            });
        }
    };

    function getRow(responseEntity) {
        var elements = {};
        for(const i in responseEntity){
            if (window.fields.indexOf(i)!==-1){
                elements[i]=responseEntity[i];
            }
        }
        return elements;
    }
}