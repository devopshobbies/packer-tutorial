## Documentation

* Explore the Packer for Packer [CLI](https://www.packer.io/downloads) >= v1.8.0+


Add your AWS credentials as two environment variables, AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY, replacing AAAAAA with each respective values.
```shell
$ export AWS_ACCESS_KEY_ID=AAAAAA
$ export AWS_SECRET_ACCESS_KEY=AAAAA
```

# packer-aws-eks-image

Build basic eks image with packer hashicorp

## Usage

Install project dependencies

```shell
packer init .
```

The packer fmt command updates templates in the current directory for readability and consistency.

```shell
packer fmt .
```


You can now edit the `main.ts` file if you want to modify any code.

```typescript
vim main.ts
import { Construct } from 'constructs';
import { App, TerraformOutput, TerraformStack } from 'cdktf';
import { AwsProvider, s3 } from './.gen/providers/aws';

class MyStack extends TerraformStack {
  constructor(scope: Construct, name: string) {
    super(scope, name);

    new AwsProvider(this, 'aws', {
      region: 'us-east-1',
    });

    const BUCKET_NAME = 'cdktf-typescript-demo-us-east-1';

    const bucket = new s3.S3Bucket(this, 'aws_s3_bucket', {
      bucket: BUCKET_NAME,
      lifecycleRule: [
        { enabled: true, id: 'abort-multipart', prefix: '/', abortIncompleteMultipartUploadDays: 7 },
        { enabled: true, transition: [{ days: 30, storageClass: 'STANDARD_IA' }] },
        { enabled: true, noncurrentVersionTransition: [{ days: 30, storageClass: 'STANDARD_IA' }] },
        { enabled: false, transition: [{ days: 90, storageClass: 'ONEZONE_IA' }] },
        { enabled: false, noncurrentVersionTransition: [{ days: 90, storageClass: 'ONEZONE_IA' }] },
        { enabled: false, transition: [{ days: 365, storageClass: 'GLACIER' }] },
        { enabled: false, noncurrentVersionTransition: [{ days: 365, storageClass: 'ONEZONE_IA' }] },
      ],
      tags: {
        Team: 'Devops',
        Company: 'Your compnay',
      },
      policy: `{
        "Version": "2012-10-17",
        "Statement": [
          {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
              "s3:GetObject"
            ],
            "Resource": [
              "arn:aws:s3:::${BUCKET_NAME}/*"
            ]
          }
        ]
      }`,
    });

    new TerraformOutput(this, 'S3 id', {
      value: bucket.id,
    });

    new TerraformOutput(this, 'S3 arn', {
      value: bucket.arn,
    });
  }
}

const app = new App();
new MyStack(app, 'aws-s3');
app.synth();
```

Compile the TypeScript application

```bash
tsc
```
At this step you can run code with two different way:

# The first way:

Generate Terraform configuration

```bash
cdktf synth
```

The above command will create a folder called `cdktf.out` that contains all Terraform JSON configuration that was generated.

Run Terraform commands

```bash
cd cdktf.out
terraform init
terraform plan
terraform apply
```

# The second way:

Run cdktf commands

```bash
cdktf deploy
```
