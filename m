Return-Path: <virtio-comment-return-8209-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6437BC4167D
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 11:14:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A61067410C
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 11:14:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8F33A986728
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 11:14:02 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 78D5D98671A; Mon,  6 Nov 2023 11:14:02 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6A22698671B
	for <virtio-comment@lists.oasis-open.org>; Mon,  6 Nov 2023 11:14:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P3d2L49OkZ853Jxrje1LSjjtM7NiqGiYYDsJoTH7onjsGgD4Z+RWnSRiubTtnf5xGO9Y4oAqOHqeaRRTsi31xBwqFUcI1GCHZtXyVQy5zUUJU/hWwrhXSVUdjGTxVGBJUSM7dTegnF+7M4l2diXCetLWyln6Rr2c5Qn2t6VAoGgbkw710+yw9iB/tlno58huO7Y5NCzpxG/zgUpzcuO5GoBS7syBIY06iiz9PuxSspsn9F1EgIz8sbNDcVM7sTGz8j9qswCHVFrVoxV17+nd/SVSFRwUP/TaL8jQ+ov9CjqCOZi6SvwD9wCgVYRAM2JQC+s17qmuSO22SQtKRdz92Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bOYAwWq9QkuDYjP5HoCirXL8jyCpm4OmXylsFteOc4s=;
 b=Ucy/i8j8+Fm6tXb23kTXvlqGQpmQ3M3zUOn8as0xk9XgX29x1y+1ZL3/dzOgLM0CgX3+S18e/YCdICDBrbKqFZsduBMdq7R79J6Ex62YVsEW4RC+X5d0q2aF3gQaoNq7Ms10yMErBAfXgZ7zOAZucmAVRzAHSTiguVO6OQG+lVEDSS3nT+0y9i6ucdFprSgOwLv5RPWOLqT94gfONyEC4w9ODx8JBAZ5wn9beqi8mqIV+TWUDHOKC/ToJhlBCWmxQZw8k83MlOznW6v/wo9BzGAeAJNg6A7+QB7MlVuHKgYrVLk/Y5jpleQYah7lDIo4/+oyNXYSnfpxJdnjg/ZzLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "Michael S. Tsirkin"
	<mst@redhat.com>
CC: "jasowang@redhat.com" <jasowang@redhat.com>, "eperezma@redhat.com"
	<eperezma@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Thread-Topic: [PATCH V2 6/6] virtio-pci: implement dirty page tracking
Thread-Index:
 AQHaDkFr7w3tkrCqqkSwyxm5dwAptLBoapSAgAABpXCAAETRAIAACO2QgAPyz4CAAAX1wIAAWYwAgAAWBzA=
Date: Mon, 6 Nov 2023 11:13:58 +0000
Message-ID:
 <PH0PR12MB54810847007367DD75FA3D60DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-7-lingshan.zhu@intel.com>
 <20231103064730-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D028E63E6CB0AA7F4149DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fdfda658-e89c-41f4-9f4c-77d5d9b1b642@intel.com>
 <PH0PR12MB54818179419B06412D7A9C84DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <445ff573-72c3-4fe4-9e07-e7fdd2dc5750@intel.com>
 <PH0PR12MB54818BAE4BD33983E6108FE5DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2615baa2-9450-4504-aa8a-e46fdbb332b8@intel.com>
In-Reply-To: <2615baa2-9450-4504-aa8a-e46fdbb332b8@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DS0PR12MB8527:EE_
x-ms-office365-filtering-correlation-id: e50a8a3b-df8b-4dda-835f-08dbdeb9796e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 aJm2sdVvXNWSfokkC9ZtENGHgjLKoK0nuooAamzRymg8FaCI8QgN+zfSWEDBkdhzo+8DNUKk57O1Urle3UWmuL6mtURKNJHbdF8j9erBmJX/zXx8cxDvYSzaxV9894P98pufcmfd9qtaqU8QZtYpZgdyzM0kjsgrvgPrzWcxJbRlJwFlwQw/GFHgElFkMtQ52OYjaUWaY/l6h4kygXdDeX5zIJN1tUvsIFnBWxSedl7N3eKcC2FxC+3V3eCP3SBmx8yR5mozO+S3hbXYcG3KWcWWGiO97Z18n7b/c9WePAHc8hHm8e7uiLRiaTs6VNU/eADeia5asPtGm8MLjpLLGSxBowkPARAXfosQKboomxIB7zWEFhSJ3uBEPAgM8prnM2qA3ROXi/G9iylvknpgLjpqgOpW6EPlR9pOsjecOUEd9O+Av8z8FnK3BUuXQVgIqlT+BkqG2xjtruEiFQiex40MYYQ0Czo4Kz6pZfvm4uK2fxpayUIM3CuYPfiLxGchmKfDCByM4Y9ajP0v4bia14GRawPGopoc4X6V98lD4gy1a0m2wnqNfg0hyGljRkpUkW6bRObTiffpcHEGMQfl/qeFzb+mBEBVU7tXo3FCHwSgD3PexK9DzYzGsw7UpdMqAHJ8zs7/ySGXXqJD3OSvew==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(136003)(396003)(366004)(376002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(55016003)(71200400001)(9686003)(7696005)(6506007)(478600001)(33656002)(86362001)(122000001)(38100700002)(5660300002)(2906002)(26005)(83380400001)(8676002)(38070700009)(4326008)(110136005)(66446008)(64756008)(66476007)(66946007)(316002)(54906003)(76116006)(8936002)(41300700001)(66556008)(52536014)(14143004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WEhJekl0RlgrZDlaeld6THVqTUI0d3k4N3d5ZFE1Zy80cmZHQ1V2YkxLblhV?=
 =?utf-8?B?WG9SbG5XRXhEL3pCMmxEQVNab0RaeHZ4SG9BUHIySW55TlQ4MStuemFKVGZx?=
 =?utf-8?B?bDFPVFBXOWk5M2xlSVhuUVE3U0ZHK0dMdWhmbnFrK3l4WGdGaXVXTG12N3dT?=
 =?utf-8?B?QkJjYW0wSVUweUdEOWxOLzB0NG1xMFdYSEQ0QXlUMXN6cjhDYjQ0SklKMktl?=
 =?utf-8?B?dElGcmtrcjR0dER5WWc2ZjMrdE5VRkN2cDhmS0FSWkRVY2JhMWVvZHR6UFcw?=
 =?utf-8?B?TzM4NUhIZGlyUFQxVnNiZERaejc5Wndrc212MGNDS0FJYzgveHkwRndPMzdh?=
 =?utf-8?B?UVlXNnpiL0s2VHJ2Q082ekp5YmpncmpwUElJY2pyZjVpZWpGaHBqS21xdlJ1?=
 =?utf-8?B?K2JWYjBXeVNWWUtkZDUzcU5Yb3J4T2kva0pDbnhlRHlIRElYWkFYdlc2TGw5?=
 =?utf-8?B?Z2J0aXRxVHpZaXEwUFRTaFBHbmlQQzVONnZmTVVWZjg5bytVZmM0b3orNEU5?=
 =?utf-8?B?QjZOL2IzN2c0YXJZL0Q1V0Fpa2xueHNLN2hKOTVJU3NNK2Fic3Vzd3QwNkcx?=
 =?utf-8?B?dndNVDVLekxoSiswUi8zNzdlRi9HbXgvMXYyQlJkWXlhdVZXMFkzbldGM1Rh?=
 =?utf-8?B?Mk5aMUlHenJGYXdOYmVhNXJXbmZmQVpFQjkyS3pvdnZGSzZlQ3E0VE1Fb2wy?=
 =?utf-8?B?ZE14Y0RiWGtFMWZ0WHFTRm9tNTFBWlNtZzFXd01INDMzVFlkUFBsK0hKY0Ft?=
 =?utf-8?B?VitrOE1GYzhrOE1Wdk1YNXVpRDU2VUwxQUNtb2hHYnNraDA4MXZyTG85UURW?=
 =?utf-8?B?dVZDa0luaDdKWVp0ajFRYkJCcERpR3UrQzF1OUN5YzV0Q01DcWtxbWIwNlkr?=
 =?utf-8?B?RUNJV2xkV2padnFVY3ZxV1ZPaElQYkxNdUM2aElMN1NiQ0NyQmoyRFhPVW5G?=
 =?utf-8?B?Nng0T0REZmtXUzR5dXo4UFZGUW11cGtRYjcwSEUzMnBKTG51TWhoWEwydUY0?=
 =?utf-8?B?Wjd1a3dBR3FhMThHRmw5NEdnZERyMG9iTWJtT1doMjY2SXpKZHduN1E3bU1M?=
 =?utf-8?B?VXZNcFdrTCtScHJkZG9KejVXODJPRDhxM3NzcVByZFdwYTBSY1g3R2lKM0lK?=
 =?utf-8?B?N3BvbWhmcVJJa2c4OTArTXVkQVNPbGtTS0dMRTEwalg1YnNVME1Wb3VLQ3Jx?=
 =?utf-8?B?TmxSbDd6MW41VHNZS2I5bmNuMzAyWHFFRGtKb0NrNFNaeHZiS1Y4VVlVci9H?=
 =?utf-8?B?YUJOeGd3RDJCNC9uRFFyVVBRcENXVTh0OGNhclpWcmpCNzBxS3pGaXBFL2FN?=
 =?utf-8?B?WWFuWDE5MTQvbUFycDZXZGdwYk5ZUE9veGtQNld2NzJhTnlDa0VvaFNqVnlW?=
 =?utf-8?B?SUNxcUxiNlJ5anBzVGI2ZWFRdnBFV0FPQ09XNXNDR2U0aXFLRUZQWWpONVd1?=
 =?utf-8?B?bFhVSDRwMVB5ODQwRmVSVityR1FHOThWSU9yWVk3S3VMMXZoVXpKQVZGZmc3?=
 =?utf-8?B?MkhDV3JIWStrcU1QOU5JK2pFMVQxY1ZQTDZFanhZYlNHWmUzQlFIL3NMNmJY?=
 =?utf-8?B?VWxzYjFFdDFnenNoN2c5VzJ0TnRJaUFTN3doa3IxNm9PeEo5VE0ydytJNzEw?=
 =?utf-8?B?QmRWRkJ5cHp1ZnE5cmViYnp6Sm1GV3ZjUFp5clQ0MWZMMEdhTTkxMHE0cHdT?=
 =?utf-8?B?cXhEVkRqTEJZUW9DZWNaYUl3NE9CQnhnbnBPOWlvcUpvanl6TlQ2NDg3K0V2?=
 =?utf-8?B?YjJVbU1tUnZkeHozVno0TzR6T293Qms5TVlZaHIrN3IxVkx2RjlPSHFzTk4y?=
 =?utf-8?B?SzhNWjF5WXR1Y0YwT1AzTkxTSzdxSy9OMGJRUlNiQnh4Y1dxRU05TS9EQ0Jn?=
 =?utf-8?B?N21JWlIvRG81TEJSQ1lLdzhiZTA4dzhWOGlPR2FXM0k0YzdMTi9XNlZYaUJi?=
 =?utf-8?B?VWR4Q0ZvalhBRkJ2dUNnSDM0NFU2NmF4WWoybEprTjhqL2JWOTZyVHIyd24z?=
 =?utf-8?B?QWhiZzFQM1ZzWExJYXNGeUV5bGQyTThVZDRrV2w5WWlqNGhzOHhHSTNMM3ZQ?=
 =?utf-8?B?VWpwV1pDTmorb0dUN2k0cXdNajNIa2p4UFBHRG5lVXUyVFVmUENBVFlHQXQv?=
 =?utf-8?Q?+wMk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e50a8a3b-df8b-4dda-835f-08dbdeb9796e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2023 11:13:59.0087
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rUCRLOP1mg5ioeWwpxABN1v2AJp+Y9daWmoDGzkllAbJZ966uSgzqNlhRSymX9ND1UjPVyzPCAXL/LNMFz/p0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8527
Subject: [virtio-comment] RE: [PATCH V2 6/6] virtio-pci: implement dirty page tracking

DQo+IEZyb206IFpodSwgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+DQo+IFNlbnQ6
IE1vbmRheSwgTm92ZW1iZXIgNiwgMjAyMyAzOjA0IFBNDQoNCj4gU28sIHBsZWFzZSBubyBwYXNz
LXRocm91Z2ggZGlzY3Vzc2lvbiBhbnltb3JlLg0KDQpJZiB5b3UgY29tbWVudCBsaWtlIHRoaXMs
IG5vdGhpbmcgY2FuIHByb2dyZXNzLg0KDQpXaGF0IHlvdSBhcmUgaW1wbHlpbmcgd2l0aCBhYm92
ZSBsYW5ndWFnZSBpczogDQoiaGV5IGEgdmlydGlvIGNhbiBkbyBsaXZlIG1pZ3JhdGlvbiBPTkxZ
IGJ5IGNyZWF0aW5nIHZkcGEgZGV2aWNlIG9uIHRvcCBvZiBBTFJFQURZIHZpcnRpbyBkZXZpY2Us
IGFuZCB5b3UgZ2V0IGFub3RoZXIgdmlydGlvIGRldmljZSBieSBydW5uaW5nIHRocm91Z2ggMyBs
YXllcnMgb2Ygc3RhY2sgeW91IGdldCB2aXJ0aW8gZGV2aWNlIG9uIG90aGVyIHNpZGUhIi4NCg0K
VGhlbiBmb3Igc3VyZSwgSSBkaXNhZ3JlZSB0byBpdCBmb3IgMTAwJSBmb3Igc3VjaCBhIHNpbmds
ZS1taW5kZWQgZGVzaWduLg0KDQpBdCBsZWFzdCBJIGFtIHRyeWluZyB0byBwcm9wb3NlIGlmIGEg
c29sdXRpb24gY2FuIHdvcmsgZm9yIGdlbmVyaWMgcGFzc3Rocm91Z2ggd2hlcmUgbGVhc3QgYW1v
dW50IG9mIGh5cGVydmlzb3IgbWVkaWF0aW9uIGlzIGRvbmUuDQoNCkFuZCBhbiBleHRlbnNpb24g
d2hlcmUgaHlwZXJ2aXNvciBoYXMgY2hvaWNlIHRvIG1vcmUgbWVkaWNhdGlvbiBsYXllcnMgYXMg
aXQgZmluZHMgc3VpdGFibGUuDQpBbmQgaWYgdGhlcmUgYXJlIHRlY2huaWNhbCBpc3N1ZXMsIG1h
eSBiZSB0d28gZGlmZmVyZW50IGludGVyZmFjZXMgb3IgbW9yZSBhZG1pbiBjb21tYW5kcyBuZWVk
ZWQgZm9yIHR3byBtb2Rlcy4NClRoZSBpZGVhIGlzIHRvIGF0dGVtcHQgdG8gY29udmVyZ2UgYW5k
IGRpc2N1c3MgdGhvc2UgZGV0YWlscywgbm90IHRoZSBvcHBvc2l0ZS4NCg0KWW91ciBhYm92ZSBj
b21tZW50IHNob3dzIGEgY2xlYXIgc2lnbiBvZiBub24tY29sbGFib3JhdGlvbiB0byBtYWtlIGJv
dGggbW9kZSB3b3Jrcy4NCkF0IG9uZSBwb2ludCBJIG1heSBwcm9iYWJseSBzdG9wIHJlc3BvbmRp
bmcgdG8geW91ciBjb21tZW50cyB0aGF0IHJlcGVhdGVkbHkgc2F5czoNCg0KIkdvIHJlYWQgUUVN
VSBjb2RlLCBEbyB5b3Uga25vdyB3aGF0IGlzIFBBU0lEPywgRG8geW91IGtub3cgbnVtX3F1ZXVl
cywgR28gcmVhZCBQQ0kgc3BlYyIuLi4NCg0KVGFraW5nIGRlZXAgYnJlYXRoIG5vdyB0byBkbyBz
b21lIHByb2R1Y3RpdmUgd29yayBpbiBUQy4uLg0K

