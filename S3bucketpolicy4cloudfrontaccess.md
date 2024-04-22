S3 BUCKET POLICY FOR CLOUDFRONT ACCESS

1.	I created an S3 bucket named kiki.testing.bucket.
2.	To configure static web hosting, I selected the created bucket, I clicked on properties and scroll down to static website hosting, I clicked enable static website hosting and selected host a static website. I typed index documents as index2.html and error document as error.html. I clicked save changes.
3.	I went to the bucket to upload the two files index2.html and error.html.
4.	I went to permissions under the bucket, clicked on edit bucket policy and inserted this permission;

{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity E29JXBFYMVO4QP"
      },
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::kiki.testing.bucket/*"
    }
  ]
}

5.	To create a CloudFront distribution, I searched for CloudFront service, I clicked on create a CloudFront distribution button. In the origin domain name, I chose the bucket I created. 
6.	Testing; I tried to access the object using my S3 URL: http://kiki.testing.bucket.s3-website.eu-north-1.amazonaws.com, I got this error message;

403 Forbidden
•	Code: AccessDenied
•	Message: Access Denied
•	RequestId: W0KJHGWT0VP1RSQ3
•	HostId: SeCg1wLpnzjSONbxBkgjCJUitDF8GuN+RBklfKv96De3iFhg83PZKrXSQ/eUgNo0d77aZ3cPL5U=
An Error Occurred While Attempting to Retrieve a Custom Error Document
•	Code: AccessDenied
•	Message: Access Denied
7.	I was able to access my object through my CloudFront distribution URL: https://d2aennzwiqyxyx.cloudfront.net . See  response I got;

Welcome to My Website
This is the index page.
8.	I had to edit my bucket policy permission to ;

{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::kiki.testing.bucket/*"
        }
    ]
}
Also, I Created a new invalidation to clear the cache. Using  “ /*” to invalidate all files.
