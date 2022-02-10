class PostDetails {
  late int id;
  late String itemName;
  late int userId;
  late int categoryId;
  late int genreId;
  late int unitId;
  late int unitPrice;
  late int qty;
  late int minimumOrderQty;
  late int colorMin;
  late int colorMax;
  late int sizeTypeId;
  late int sizeInchesMin;
  late int sizeInchesMax;
  late int sizeCmMin;
  late int sizeCmMax;
  late String description;
  late String status;
  late String publishedAt;
  late String unpublishedAt;
  late String suspendedAt;
  late int totalInterest;
  late int liveTime;
  late double postCost;
  late bool isFeatured;
  late bool isUrgent;
  late bool isSettled;
  late String createdAt;
  late String updatedAt;
  late List<PostImages> postImages;
  late List<PostSizes> postSizes;

  PostDetails.empty(){
    id=0;
    itemName='';
    userId=0;
    categoryId=0;
    genreId=0;
    unitId=0;
    unitPrice=0;
    qty=0;
    minimumOrderQty=0;
    colorMin=0;
    colorMax=0;
    sizeTypeId=0;
    sizeInchesMin=0;
    sizeInchesMax=0;
    sizeCmMin=0;
    sizeCmMax=0;
    description='';
    status='';
    publishedAt='';
    unpublishedAt='';
    suspendedAt='';
    totalInterest=0;
    liveTime=0;
    postCost=0.0;
    isFeatured=false;
    isUrgent=false;
    isSettled=false;
    createdAt='';
    updatedAt='';
    postImages=[];
    postSizes=[];
  }



  PostDetails.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    itemName = json['item_name']??'';
    userId = json['user_id']??0;
    categoryId = json['category_id']??0;
    genreId = json['genre_id']??0;
    unitId = json['unit_id']??0;
    unitPrice = json['unit_price']??0;
    qty = json['qty']??0;
    minimumOrderQty = json['minimum_order_qty']??0;
    colorMin = json['color_min']??0;
    colorMax = json['color_max']??0;
    sizeTypeId = json['size_type_id']??0;
    sizeInchesMin = json['size_inches_min']??0;
    sizeInchesMax = json['size_inches_max']??0;
    sizeCmMin = json['size_cm_min']??0;
    sizeCmMax = json['size_cm_max']??0;
    description = json['description']??'';
    status = json['status']??'';
    publishedAt = json['published_at']??'';
    unpublishedAt = json['unpublished_at']??'';
    suspendedAt = json['suspended_at']??'';
    totalInterest = json['total_interest']??0;
    liveTime = json['live_time']??0;
    postCost = json['post_cost']??0.0;
    isFeatured = json['is_featured']??false;
    isUrgent = json['is_urgent']??false;
    isSettled = json['is_settled']??false;
    createdAt = json['created_at']??'';
    updatedAt = json['updated_at']??'';
    if (json['post_images'] != null) {
      postImages = <PostImages>[];
      json['post_images'].forEach((v) {
        postImages.add(PostImages.fromJson(v));
      });
    }
    if (json['post_sizes'] != null) {
      postSizes = <PostSizes>[];
      json['post_sizes'].forEach((v) {
        postSizes.add(PostSizes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['item_name'] = this.itemName;
    data['user_id'] = this.userId;
    data['category_id'] = this.categoryId;
    data['genre_id'] = this.genreId;
    data['unit_id'] = this.unitId;
    data['unit_price'] = this.unitPrice;
    data['qty'] = this.qty;
    data['minimum_order_qty'] = this.minimumOrderQty;
    data['color_min'] = this.colorMin;
    data['color_max'] = this.colorMax;
    data['size_type_id'] = this.sizeTypeId;
    data['size_inches_min'] = this.sizeInchesMin;
    data['size_inches_max'] = this.sizeInchesMax;
    data['size_cm_min'] = this.sizeCmMin;
    data['size_cm_max'] = this.sizeCmMax;
    data['description'] = this.description;
    data['status'] = this.status;
    data['published_at'] = this.publishedAt;
    data['unpublished_at'] = this.unpublishedAt;
    data['suspended_at'] = this.suspendedAt;
    data['total_interest'] = this.totalInterest;
    data['live_time'] = this.liveTime;
    data['post_cost'] = this.postCost;
    data['is_featured'] = this.isFeatured;
    data['is_urgent'] = this.isUrgent;
    data['is_settled'] = this.isSettled;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['post_images'] = this.postImages.map((v) => v.toJson()).toList();
    data['post_sizes'] = this.postSizes.map((v) => v.toJson()).toList();

    return data;
  }
}

class PostImages {
  late int id;
  late int postId;
  late String imageUrl;
  late bool isFeatured;
  late String createdAt;
  late String updatedAt;

  PostImages.empty(){
    id=0;
    postId=0;
    imageUrl='';
    isFeatured=false;
    createdAt='';
    updatedAt='';
  }



  PostImages.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    postId = json['post_id']??0;
    imageUrl = json['image_url']??'';
    isFeatured = json['is_featured']??false;
    createdAt = json['created_at']??'';
    updatedAt = json['updated_at']??'';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['post_id'] = this.postId;
    data['image_url'] = this.imageUrl;
    data['is_featured'] = this.isFeatured;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class PostSizes {
  late int id;
  late int postId;
  late int sizeTypeId;
  late int sizeId;
  late String sizeValue;
  late String createdAt;
  late String updatedAt;

  PostSizes.empty(){
    id=0;
    postId=0;
    sizeTypeId=0;
    sizeId=0;
    sizeValue='';
    createdAt='';
    updatedAt='';
  }



  PostSizes.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    postId = json['post_id']??0;
    sizeTypeId = json['size_type_id']??0;
    sizeId = json['size_id']??0;
    sizeValue = json['size_value']??'';
    createdAt = json['created_at']??'';
    updatedAt = json['updated_at']??'';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['post_id'] = this.postId;
    data['size_type_id'] = this.sizeTypeId;
    data['size_id'] = this.sizeId;
    data['size_value'] = this.sizeValue;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}