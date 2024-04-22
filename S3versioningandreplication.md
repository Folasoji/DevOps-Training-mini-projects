S3 VERSIONING AND REPLICATION-MINI PROJECT
1.	I created 2 buckets, one each using my root user and the other an IAM user Mary. 
2.	To enable bucket versioning, I clicked on the bucket created, clicked, properties, clicked on edit bucket versioning, clicked on enable bucket versioning and saved changes. I did this for the two buckets created.
3.	I created these buckets in different regions, as shown below.;

	mario.source.bucket
Europe (Stockholm) eu-north-1	View analyzer for eu-north-1
April 22, 2024, 15:44:07 (UTC+00:00)
mario.destination.bucket
US East (N. Virginia) us-east-1	View analyzer for us-east-1
April 22, 2024, 15:48:07 (UTC+00:00)

4.	Testing versioning; 

	Version ID	Last modified	Size	Storage class
	Name	Type	Version ID	Last modified	Size	Storage class
	image0 (1).jpeg
jpeg	JR4oZQ3uNfC1fBBmDIe.I0aviwSfnsf0	April 22, 2024, 16:46:51 (UTC+00:00)	80.9 KB	Standard
	image1.jpeg
jpeg	ROMXskymEUWAWan4qcG7odyeJ.jp2rAr	April 22, 2024, 16:46:49 (UTC+00:00)	62.4 KB	Standard
5.	Test Replication; 
•	First I went to my source bucket named mario.source.bucket to configure the replication. I clicked on management, clicked on create replication rules, I gave it a name, I enabled the status, and selected apply to all object in the bucket. For destination, I chose “specify a bucket in another account”. I asked for the 12-digit account ID (IAM ID) 533267383603. I inserted same, I also provided the destination bucket name “mario.source.bucket.’ I selected change ownership to destination bucket owner.  For IAM role I chose create new role. I saved all changes made. I selected do not replicate existing object and submitted. My replication rule was created successfully.
•	I went to the IAM rule created, I saw the policy “s3crr_for_mario.source.bucket_3edb67”created, I expanded it see below the policy;

{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "s3:ListBucket",
                "s3:GetReplicationConfiguration",
                "s3:GetObjectVersionForReplication",
                "s3:GetObjectVersionAcl",
                "s3:GetObjectVersionTagging",
                "s3:GetObjectRetention",
                "s3:GetObjectLegalHold"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:s3:::mario.source.bucket",
                "arn:aws:s3:::mario.source.bucket/*",
                "arn:aws:s3:::mario.destination.bucket",
                "arn:aws:s3:::mario.destination.bucket/*"
            ]
        },
        {
            "Action": [
                "s3:ReplicateObject",
                "s3:ReplicateDelete",
                "s3:ReplicateTags",
                "s3:ObjectOwnerOverrideToBucketOwner"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:s3:::mario.source.bucket/*",
                "arn:aws:s3:::mario.destination.bucket/*"
            ]
        }
    ]
}
•	I went to the destination bucket, I clicked on permission, I clicked edit bucket policy. I clicked on generate policy. Selected all necessary item. See below the policy I created;
{
    "Version": "2012-10-17",
    "Id": "Policy1713803879568",
    "Statement": [
        {
            "Sid": "Stmt1713803875741",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::533267383603:role/service-role/s3crr_role_for_mario.source.bucket"
            },
            "Action": [
                "s3:GetBucketVersioning",
                "s3:PutBucketVersioning"
            ],
            "Resource": "arn:aws:s3:::mario.destination.bucket"
        },
        {
            "Sid": "Stmt1713803875742",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::533267383603:role/service-role/s3crr_role_for_mario.source.bucket"
            },
            "Action": [
                "s3:ReplicateDelete",
                "s3:ReplicateObject"
            ],
            "Resource": "arn:aws:s3:::mario.destination.bucket/*"
        }
    ]
}
•	I copied it and pasted it in the bucket policy and saved same.
•	I went back to source bucket and uploaded two objects. After uploading the object, I clicked on the object and went to properties, I scrolled down to management configuration, the replication status was completed.
Management configurations
Replication status
When a replication rule is applied to an object the replication status indicates the progress of the operation.
COMPLETED
View replication rules

•	I went to destination bucket and refresh the bucket and the object appeared inside the bucket. I clicked on the object and selected properties, went down to management configuration and the status shows “REPLICA”.
Management configurations
Replication status
When a replication rule is applied to an object the replication status indicates the progress of the operation.
REPLICA
View replication rules

