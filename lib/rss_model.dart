

class Feeds {
  String _title, _description, _imgUrl, _webLink;

  Feeds(this._title, this._description, this._webLink,this._imgUrl);



get getTitle => _title;

  set setTitle(value) {
    _title = value;
  }

  get getUrlImg => _imgUrl;

  set setUrlImg(value) {
    _imgUrl = value;
  }

  get getDescription => _description;

  set setDescription(value) {
    _description = value;
  }

  get getWebLink => _webLink;
  set setWebLink (value){
    _webLink=value;

  }
}


