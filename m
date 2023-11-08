Return-Path: <virtio-comment-return-8256-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9147FC4332F
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Nov 2023 06:36:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C3B0C2AD7E
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Nov 2023 06:36:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A1B8D986C94
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Nov 2023 06:36:56 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 895A9986C91; Wed,  8 Nov 2023 06:36:56 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 76FD3986C92;
	Wed,  8 Nov 2023 06:36:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yp7Dum84RwOOy/9I9J2L1uDe9FF6Aq63lnzUZvRv9+F5OsBY/+/U0/PHxjTXBmKfgt/BEa2x3ntWxo/DVL/B+0Gjj66vl/xsroiPHhv3Nf8vMpF80X3Dl4tPjrMhuxcC5+ERzBXkQSQJ0WhncU/8+fPEy0/p8qjs+RY12ig6D0NX0Qx8GzmW9JfldpfabNjk4TsNukoLdmrTq1n95BQ4Ims9d3G0cD9morQJMXR5dD7PVxHwlHvhh+2P0TeMaqaSh1oVHum7p1CAaWYZfU6ECGyysGG518mCG1lM/K53b2S1/Pmb+dWpBhq+BEooiLPo4MDOncdwdnWQwin95iup9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TGbNJofF3lRTmqRCrHRYyrxgi8KR7txNZh5C9Fr6ZC4=;
 b=asK8kw4dAv18cw8YMdLBqkJO3dJ580xeuqEip82cJv/uAwxN8zkHIyJFQOTuayMol2nT7Evqv+QZELXoGfRCJBGzVI/JlJlUg1xlCDbpf7Ohv4SQzirLQmw4oN6MoKrqTmWUy9lLTAYA274qhi3oGCRtNXV9IvmXFngy05f3CI9fqlUdEh7+rCJvq1IHnIEyJNZwVvfbP2wUYTzDbzMCP/NL1b/TD+2OD8S8ldV8GXmj0goGBss+qJf28ORyyKVt4lYl9ii4zr2oEljig97M42jN+CtTpCTCrTiX9QKVSm50j0gmlpLwf6dYqcWBGTL+IBTsAhzL1vMZQ2UWNIDy7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Parav Pandit <parav@nvidia.com>, "hengqi@linux.alibaba.com"
	<hengqi@linux.alibaba.com>, "sburla@marvell.com" <sburla@marvell.com>,
	"si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>
Thread-Topic: virtio-net collaboration bi-weekly
Thread-Index: AQHaEg31NCmiLI1Cb0mZFEhgSB4G1w==
Date: Wed, 8 Nov 2023 06:36:53 +0000
Message-ID:
 <PH0PR12MB5481164A637B7A91138C3FABDCA8A@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <PH0PR12MB5481DBEAA12D6B22289D99E6DC4EA@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To:
 <PH0PR12MB5481DBEAA12D6B22289D99E6DC4EA@PH0PR12MB5481.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SN7PR12MB6672:EE_
x-ms-office365-filtering-correlation-id: e1d45856-6f5b-4ed3-6a2f-08dbe025186f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 syK9vxbXi7b8s3eUbPJgibNeRJWVojorDzNKFKqXMpufv85lbXN+eU4sxbw4vH2yU93NGH52UdnszOEXY3Tj6TvmcqizJ8r7i7iHSbK3aRWwIm9ejm6VcB28FI4jeKHKvHFa/P3NpNzdWfvX7JsmOpH6e+eHsnIm4W8D7J0UXds/6Gq5IAIOTtsqWqHJgKyoBKgKWUJbpXyVA5emHuSwAZFsoKwGQoHA/ToKgh81SEAsQSbMQ2lSsfnQEFGmDd01yRFAz0rYZIc+GYldGtI3Q8wGxdUtjlHE41zKDUo/jmLbZoqc+oakUYfQfm3cr7M6xObMyO119SOx8N49ZOsTLI3DAcDLrY+UpsOUgzlQFBaOoysstVgMZNZaQiaag1D6sjh0kKVTuJrTXK+RwIpojEwVaV08U+MbqRiDO7mukXCx4WCHjdNwsG7XBPcrU+HGnhZuQbAIon6Rnd47bQUcL+G0jWZAt+C0qkk3msdsBD97F1XP5DQclS1X85lCfRNJPhCgSwpN8uUX38xaWE99k59w4rsqCdDuRpCup8xI+YV+lNmdvDrdeDxlPRNPWCn8iTE0x0i4NcQGFCq5NtLIRHZpiRzLQk3PuzYearS8xDygOcRlH68fXK/dyuqnjlUBT4iD+NhjTQcCfHWt+p+npKg/aW3DFO8XoQQIY78vz4FrHN7POfZSuTsFDllZ9T8i+SdUCve4AnDQW05OnsIv2P0tuStpBalp30qZ73oJCmw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(396003)(346002)(366004)(136003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(5930299018)(55016003)(9686003)(966005)(7696005)(6506007)(71200400001)(45080400002)(53546011)(478600001)(38100700002)(3480700007)(33656002)(40140700001)(122000001)(86362001)(316002)(5660300002)(66476007)(76116006)(66556008)(66446008)(64756008)(66946007)(83380400001)(2906002)(41300700001)(26005)(110136005)(38070700009)(8676002)(8936002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NGxrWmk2V1kwVWdzeHM1Rjd6VEgwLzk3M09UWXlXOHV2cENndkQxMkYyVU1V?=
 =?utf-8?B?UUdyakV1d0MvalllRkxiaDhpdW9mZldUUkQ5Q3k3RXNQclVkajRyYXc3WEpD?=
 =?utf-8?B?dGU5b21ZRitHU2NRMjFIRTY2K0FycXgvUnNmekpRQ3RRTFBNdlZycFJCVHRT?=
 =?utf-8?B?TFREYS84ZDhvcXViMmFFWGJWZE96aVRsRHN3U0RyODRTaFcyOU9ZYUNZUnQz?=
 =?utf-8?B?bUN5TFdveWUrQjYyWkhoaVdsZ0h1ZUY0b1FiaU4zN0xwSkswZWQvYUp1dzFX?=
 =?utf-8?B?MTZYMTByUmE1bHFzcjk2aW1VclFoZ2lBZlI2SFY2L09FWVRPT0tpZXR2MUgw?=
 =?utf-8?B?UTcrVExGZU1WOGJkVEtYSTc1MWY5Uk1ubURDUUFudXVDaHRQOWxrSUMxZkhK?=
 =?utf-8?B?SXJjNk1MTlVSalFKU3paRFAranpiZkVVR0Q0dHNZbk5JbGpnWmxqUGhKRkp5?=
 =?utf-8?B?bEV0K2RLVE1rbWQxcTFVQUw0RlVFVHN0VWVqTjl1TXZaQm5KQUhYL0Q3YUx5?=
 =?utf-8?B?YVJsZXJ6NldadzlYVllzU0I0Tk9aR3BBMjk0bm94RVVEd0hRZllWbytUUWN4?=
 =?utf-8?B?K3BXZk5SYjZqYUErVHQ4TGZUaFlNVnRFU2daNlBlUU5tVW9kUFViMDQ3WDFP?=
 =?utf-8?B?czBsRWUyOUhUVHBJTk1yK3kzVkZ5akxnKzJKeDRva0pkSk9vZld2OXhJYTlZ?=
 =?utf-8?B?TEVZT2lSUis5aDBvYlBrTFhibWtKV1drUCtIY3N4VDdDVEJnZU4zVENiei9n?=
 =?utf-8?B?VDhqL1F4OFdTUVhMM0kvYmtVSGxlUVZzaHE0Q1ZTamIrZ09JN0p6b1RCQllo?=
 =?utf-8?B?b2VPS0oyQTJxVTdHVkJEYVI0ZGFrM0tzeWNwWEs4cjkrSVVLNExqYVo5c1I4?=
 =?utf-8?B?NFVHd0wyNUpXTU0rUlozL3gyMGQxdVdhVUxMT21BRUNKd2NLclpSUGFPTTJB?=
 =?utf-8?B?cjV1RU4ya1ZPd0lDbjVYcEQydVc2WEhFR1BmU3hxRmRvMGhQR3pqZzFaQlZI?=
 =?utf-8?B?SlJSOTd5aURudEV4UFN1TlJsQVVXcnZKYS93a1M0TUhnUmcxOWN4N011STk2?=
 =?utf-8?B?eEphVERoUzZZaXY2S2lua2RjNVpJU3hvVG1pa2grVHpLclNvZTRSZlVBMnFS?=
 =?utf-8?B?eUQ2R0M0K0ZxUXlKTHVZTlJqR2JMUlNsUUdHaFBSWitiU3M2Q2taSDhIZ0xt?=
 =?utf-8?B?alY3MkNPT1FhZEZMdjRodWU3MSs0NXY4NnFPUFo2U2hKTDVzbEVDbkU3dGVW?=
 =?utf-8?B?RVZDNUV4YnMwVHZmeHhNYmUrTFBZRlBCYUwyb1BNQmRKN0JMZjZORDVlZ2Ur?=
 =?utf-8?B?b3FpUk1UM1BoV0k1VHpjN3hUN0VVT0JPV0N2THJTVWhnU29pS0VGU0xuOVMx?=
 =?utf-8?B?RDlBaU84OE9UdnMwZkxwZ3l1RkhmUzh3SkgvVXNiWFprdVNNZmFacWFNOTFU?=
 =?utf-8?B?NHFsekptT3pHYzRPL1JLRHJTcjJxek41Y0FOQTIzMFhpNWRCcDhlT29LS2dD?=
 =?utf-8?B?RUtWSWk0SG1ZcUQ4N0pVbHVjcWR5ZlhBZ3ExOEdtTWJKYnZLbmtsRnBVSU5v?=
 =?utf-8?B?RnM2TlliU0ptL3UxSkhUQm1UN3JUWmw0Z2FuMmdtSkVJWVJnQWxpTng2clJa?=
 =?utf-8?B?VEpMSitMQ2ZUS2VDNTlDUTBXZ20wY2JmOVd2TFNNNk9EVFRxL0p3aG8wQWto?=
 =?utf-8?B?QXVSUjNvbE9oemtpQkJ5cllCcGtlN2JWUkMraVhNVllDR0xjNUVZdGh0WlRa?=
 =?utf-8?B?eGRLMUJWSUthdWVhbkpidlZ3U2VEeWdFYTNwZmVDejRYYmIrQnFMZHo1aG5o?=
 =?utf-8?B?eWd2N2NqSXRCRjZPWWhWK2I4SkJZTFdTV2piZzNFY1QvQkJKVHRXQy9rcmE5?=
 =?utf-8?B?eFNxM05kNTFVKzRHeSsxYlB6R256YjNBcE5lNHVCWVFTcjZqNUNRczVlcUdY?=
 =?utf-8?B?YzY0S3ZmNUNSLzV5dVROaXFCZFNZOVk3NmloWmJQdjFGcDJpMFpMOGZzVXJj?=
 =?utf-8?B?UnJCNThkMVBJWlRZYk5FOXlVRHdqNHcwQUV5N3ZoQjdEOWJKWURMTlBzUmJF?=
 =?utf-8?B?NVlKRlZXRWlnanNwR0V6eXhaZURZUlVNZ3VqcmdhM3dqdlNGZW9XUXBRRS9I?=
 =?utf-8?Q?2smg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1d45856-6f5b-4ed3-6a2f-08dbe025186f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2023 06:36:53.0963
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mcsHKRpcU+MjDo7sDQ9ttEj5cnm0AZ1gzGF5P/9rcM+rRTgkQeeLlHeynFKK6q/6OJD0j3pGzC0DTkzfC7VuCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6672
Subject: [virtio-comment] RE: virtio-net collaboration bi-weekly

SGkgQWxsLA0KDQpJIGFtIGNhcHR1cmluZyB0aGUgbWVldGluZyBkaXNjdXNzaW9ucyBhdCBjb21t
dW5pdHkgc2hhcmVkIGRvY3VtZW50Lg0KDQpodHRwczovL2RvY3MuZ29vZ2xlLmNvbS9kb2N1bWVu
dC9kLzFNRS1qRm5jdlBNd0hfR3llTGhoSVlncW1GaFRBYmxzSW9wcUhDWlp4dWZNL2VkaXQ/dXNw
PXNoYXJpbmcNCg0KUGFyYXYNCg0KLS0tLS1PcmlnaW5hbCBBcHBvaW50bWVudC0tLS0tDQpGcm9t
OiBwYXJhdkBudmlkaWEuY29tIDxwYXJhdkBudmlkaWEuY29tPiANClNlbnQ6IEZyaWRheSwgSnVu
ZSAyLCAyMDIzIDg6MzAgUE0NClRvOiBwYXJhdkBudmlkaWEuY29tOyBwYW5kaXQucGFyYXZAZ21h
aWwuY29tOyBoZW5ncWlAbGludXguYWxpYmFiYS5jb207IHNidXJsYUBtYXJ2ZWxsLmNvbTsgc2kt
d2VpLmxpdUBvcmFjbGUuY29tOyB2aXJ0aW8tY29tbWVudEBsaXN0cy5vYXNpcy1vcGVuLm9yZzsg
dmlydGlvQGxpc3RzLm9hc2lzLW9wZW4ub3JnOyB4dWFuemh1b0BsaW51eC5hbGliYWJhLmNvbQ0K
U3ViamVjdDogdmlydGlvLW5ldCBjb2xsYWJvcmF0aW9uIGJpLXdlZWtseQ0KV2hlbjogV2VkbmVz
ZGF5LCBOb3ZlbWJlciA4LCAyMDIzIDU6MDAgQU0tNTo0NSBBTSB0em9uZTovL01pY3Jvc29mdC9V
dGMuDQpXaGVyZTogDQoNCnZpcnRpby1uZXQgY29sbGFib3JhdGlvbiBiaS13ZWVrbHkNCkpvaW4g
d2l0aCBHb29nbGUgTWVldCDigJMgSGkgQWxsLFRoaXMgaXMgYSBiaS13ZWVrbHkgY29sbGFib3Jh
dGlvbiBtZWV0aW5nIGZvciB2aXJ0aW8gbmV0IHNwZWNpZmljYXRpb24gZGV2ZWxvcGVycy5UaGlz
IHdlZWsgYWdlbmRhOjEuIERpc2N1c3MgdmlydGlvIG5ldCAxLjQgZmVhdHVyZSByZXF1aXJlbWVu
dHMgcG9zdGVkIGF0IFsxXSBhbmQgYW55IG90aGVycy5odHRwczovL2xpc3RzLm9hc2kNCsKgIA0K
DQpodHRwczovL21lZXQuZ29vZ2xlLmNvbS9na2otcmF3aS11ZnA/aHM9MjI0DQoNCk1lZXRpbmcg
bGluaw0KaHR0cHM6Ly9tZWV0Lmdvb2dsZS5jb20vZ2tqLXJhd2ktdWZwP2hzPTIyNA0KSm9pbiBi
eSBwaG9uZQ0KKFVTKSB0ZWw6KzEtOTc4LTQwMy0wNTg0JTNCNzU2OTY5NzY0JTIzIA0KUElOOiA3
NTY5Njk3NjQNCg0KaHR0cHM6Ly90ZWwubWVldC9na2otcmF3aS11ZnA/cGluPTc1NzM2ODA3ODMz
MjYmaHM9MA0KDQoNCkhpIEFsbCwNCg0KVGhpcyBpcyBhIGJpLXdlZWtseSBjb2xsYWJvcmF0aW9u
IG1lZXRpbmcgZm9yIHZpcnRpbyBuZXQgc3BlY2lmaWNhdGlvbiBkZXZlbG9wZXJzLg0KDQpUaGlz
IHdlZWsgYWdlbmRhOg0KMS4gRGlzY3VzcyB2aXJ0aW8gbmV0IDEuNCBmZWF0dXJlIHJlcXVpcmVt
ZW50cyBwb3N0ZWQgYXQgWzFdIGFuZCBhbnkgb3RoZXJzLg0KaHR0cHM6Ly93d3cuZ29vZ2xlLmNv
bS91cmw/cT1odHRwcyUzQSUyRiUyRmxpc3RzLm9hc2lzLW9wZW4ub3JnJTJGYXJjaGl2ZXMlMkZ2
aXJ0aW8tY29tbWVudCUyRjIwMjMwNiUyRm1zZzAwMDE1Lmh0bWwmc2E9RCZ1c3Q9MTY4NjE0OTk0
MDAwMDAwMCZ1c2c9QU92VmF3MGhwMmJzWEw0RmZQX2lPLUVMNHlXbA0KwqANCjIuIGlubmVyIGhh
c2ggb3Blbg0KwqANCi0tLS0tLS0NCmEuIEFsbCBkZWNpc2lvbnMgYXJlIHN0aWxsIG1hZGUgYnkg
VEMgZWxlY3Ryb25pYyBiYWxsb3QgYXN1c3VhbC4gUHJvcG9zZWQgY29sbGFib3JhdGlvbiBtZWV0
aW5nc2FyZSB1bnJlbGF0ZWQgdG8gVEMgYmFsbG90Lg0KYi4gQWxsIGRpc2N1c3Npb25zIGZvbGxv
dyBPQVNJUyBmZWVkYmFjayBsaWNlbnNlLiBodHRwczovL3d3dy5nb29nbGUuY29tL3VybD9xPWh0
dHBzJTNBJTJGJTJGd3d3Lm9hc2lzLW9wZW4ub3JnJTJGcG9saWNpZXMtZ3VpZGVsaW5lcyUyRmlw
ciUyRiUyM2FwcGVuZGl4YSZzYT1EJnVzdD0xNjg2MTQ5OTQwMDAwMDAwJnVzZz1BT3ZWYXcyQy1R
T2NXUGhFUVNodG5OSHV1NGMxDQpXaGVuDQpFdmVyeSAyIHdlZWtzIGZyb20gMTJhbSB0byAxMjo0
NWFtIG9uIFdlZG5lc2RheSAoQ2VudHJhbCBUaW1lIC0gQ2hpY2FnbykNCkd1ZXN0cw0KbWFpbHRv
OnBhcmF2QG52aWRpYS5jb20gLSBvcmdhbml6ZXINCm1haWx0bzpwYW5kaXQucGFyYXZAZ21haWwu
Y29tDQptYWlsdG86aGVuZ3FpQGxpbnV4LmFsaWJhYmEuY29tDQptYWlsdG86c2J1cmxhQG1hcnZl
bGwuY29tDQptYWlsdG86c2ktd2VpLmxpdUBvcmFjbGUuY29tDQptYWlsdG86dmlydGlvLWNvbW1l
bnRAbGlzdHMub2FzaXMtb3Blbi5vcmcNCm1haWx0bzp2aXJ0aW9AbGlzdHMub2FzaXMtb3Blbi5v
cmcNCm1haWx0bzp4dWFuemh1b0BsaW51eC5hbGliYWJhLmNvbQ0KaHR0cHM6Ly9jYWxlbmRhci5n
b29nbGUuY29tL2NhbGVuZGFyL2V2ZW50P2FjdGlvbj1WSUVXJmVpZD1OM0kxTVdkaU5qQnNhblkx
TVRKd04yZHVkREYwWm1KdWFXWWdkbWx5ZEdsdkxXTnZiVzFsYm5SQWJHbHpkSE11YjJGemFYTXRi
M0JsYmk1dmNtYyZ0b2s9TVRZamNHRnlZWFpBYm5acFpHbGhMbU52YldSbVlUQmlNemt6TnpNeU9U
SXpaamcwTW1VeE16aGxZakZoTkRWaE5EZ3lObUk0WVRoa1pqayZjdHo9QW1lcmljYSUyRkNoaWNh
Z28maGw9ZW4mZXM9MA0KUlNWUCBmb3IgbWFpbHRvOnZpcnRpby1jb21tZW50QGxpc3RzLm9hc2lz
LW9wZW4ub3JnIGZvciBhbGwgZXZlbnRzIGluIHRoaXMgc2VyaWVzDQpodHRwczovL2NhbGVuZGFy
Lmdvb2dsZS5jb20vY2FsZW5kYXIvZXZlbnQ/YWN0aW9uPVJFU1BPTkQmZWlkPU4zSTFNV2RpTmpC
c2FuWTFNVEp3TjJkdWRERjBabUp1YVdZZ2RtbHlkR2x2TFdOdmJXMWxiblJBYkdsemRITXViMkZ6
YVhNdGIzQmxiaTV2Y21jJnJzdD0xJnRvaz1NVFlqY0dGeVlYWkFiblpwWkdsaExtTnZiV1JtWVRC
aU16a3pOek15T1RJelpqZzBNbVV4TXpobFlqRmhORFZoTkRneU5tSTRZVGhrWmprJmN0ej1BbWVy
aWNhJTJGQ2hpY2FnbyZobD1lbiZlcz0wDQoNCmh0dHBzOi8vY2FsZW5kYXIuZ29vZ2xlLmNvbS9j
YWxlbmRhci9ldmVudD9hY3Rpb249UkVTUE9ORCZlaWQ9TjNJMU1XZGlOakJzYW5ZMU1USndOMmR1
ZERGMFptSnVhV1lnZG1seWRHbHZMV052YlcxbGJuUkFiR2x6ZEhNdWIyRnphWE10YjNCbGJpNXZj
bWMmcnN0PTImdG9rPU1UWWpjR0Z5WVhaQWJuWnBaR2xoTG1OdmJXUm1ZVEJpTXprek56TXlPVEl6
WmpnME1tVXhNemhsWWpGaE5EVmhORGd5Tm1JNFlUaGtaamsmY3R6PUFtZXJpY2ElMkZDaGljYWdv
JmhsPWVuJmVzPTANCg0KaHR0cHM6Ly9jYWxlbmRhci5nb29nbGUuY29tL2NhbGVuZGFyL2V2ZW50
P2FjdGlvbj1SRVNQT05EJmVpZD1OM0kxTVdkaU5qQnNhblkxTVRKd04yZHVkREYwWm1KdWFXWWdk
bWx5ZEdsdkxXTnZiVzFsYm5SQWJHbHpkSE11YjJGemFYTXRiM0JsYmk1dmNtYyZyc3Q9MyZ0b2s9
TVRZamNHRnlZWFpBYm5acFpHbGhMbU52YldSbVlUQmlNemt6TnpNeU9USXpaamcwTW1VeE16aGxZ
akZoTkRWaE5EZ3lObUk0WVRoa1pqayZjdHo9QW1lcmljYSUyRkNoaWNhZ28maGw9ZW4mZXM9MA0K
DQoNCmh0dHBzOi8vY2FsZW5kYXIuZ29vZ2xlLmNvbS9jYWxlbmRhci9ldmVudD9hY3Rpb249VklF
VyZlaWQ9TjNJMU1XZGlOakJzYW5ZMU1USndOMmR1ZERGMFptSnVhV1lnZG1seWRHbHZMV052Ylcx
bGJuUkFiR2x6ZEhNdWIyRnphWE10YjNCbGJpNXZjbWMmdG9rPU1UWWpjR0Z5WVhaQWJuWnBaR2xo
TG1OdmJXUm1ZVEJpTXprek56TXlPVEl6WmpnME1tVXhNemhsWWpGaE5EVmhORGd5Tm1JNFlUaGta
amsmY3R6PUFtZXJpY2ElMkZDaGljYWdvJmhsPWVuJmVzPTANCg0KDQoNCg0KDQoNCkludml0YXRp
b24gZnJvbSBodHRwczovL2NhbGVuZGFyLmdvb2dsZS5jb20vY2FsZW5kYXIvDQpZb3UgYXJlIHJl
Y2VpdmluZyB0aGlzIGVtYWlsIGJlY2F1c2UgeW91IGFyZSBhbiBhdHRlbmRlZSBvbiB0aGUgZXZl
bnQuIFRvIHN0b3AgcmVjZWl2aW5nIGZ1dHVyZSB1cGRhdGVzIGZvciB0aGlzIGV2ZW50LCBkZWNs
aW5lIHRoaXMgZXZlbnQuDQpGb3J3YXJkaW5nIHRoaXMgaW52aXRhdGlvbiBjb3VsZCBhbGxvdyBh
bnkgcmVjaXBpZW50IHRvIHNlbmQgYSByZXNwb25zZSB0byB0aGUgb3JnYW5pemVyLCBiZSBhZGRl
ZCB0byB0aGUgZ3Vlc3QgbGlzdCwgaW52aXRlIG90aGVycyByZWdhcmRsZXNzIG9mIHRoZWlyIG93
biBpbnZpdGF0aW9uIHN0YXR1cywgb3IgbW9kaWZ5IHlvdXIgUlNWUC4gaHR0cHM6Ly9zdXBwb3J0
Lmdvb2dsZS5jb20vY2FsZW5kYXIvYW5zd2VyLzM3MTM1I2ZvcndhcmRpbmcNCg0KDQo=

