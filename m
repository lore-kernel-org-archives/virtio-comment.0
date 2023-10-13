Return-Path: <virtio-comment-return-7714-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A10CDB47E
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 11:41:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 8469D1318CF
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 11:41:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 687BF98683F
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 11:41:25 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4EDD3986836; Fri, 13 Oct 2023 11:41:25 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3E575986837
	for <virtio-comment@lists.oasis-open.org>; Fri, 13 Oct 2023 11:41:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cysCYsLivturjKQAH9d/CGW8wmLPZs0fvJFdSI40Vru1zOucgP0uZEGUK/XEh+ApNj5WH+m9jU3qLCfqRqihWUS/RM/uvKFbwiOHDPq8EJdD4uDA7w2W1xH0GBarhtWSblQFzaETxEIX10yq1DTqrRiULD4QQtu2nQVchY8kk07uCVbmNe6bNJSnOeSE+Qm9DCBQ3rF9C/SccwHWdUasmyD7klPt9Q+iU9r/5jS23sWKfToSloYt3yXRlCcI+lDsO793jgv2RUOEO8xnYGwgm+gcBm4XU+bdiwf/wqhclTKvJ9SjwmtjfvWSXAeNJU6gnwHLbgmHnAUVCH7fjTynuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CeMKo0ruxndh3mHxLFrtsNxOEhxTIX4HaM1mmXvuRlw=;
 b=Jsg3tJKbfAermu+vVY/MErQKVhmNb3E3AqG7Gm6yDu2GC7dLZc617kXdpj8sXcGEhYGCbja2KbZOKep8CHLG0SGGSR99paAscSar5KHdqPJ2/WQMxDjApPjc2Di7nmPt5LKn3HfLKsHqWCvitUahnrEO62JLyuQBljtfCC/bt3X6IJRCUh7s4dZHjXbmw5diPdWXBSejTG2y4LBXNjDFiR2uGxN+TLyyziti0iryEL+4XhbOihpe/HtNIh4tUILPieCq4gLFl78IH7YVLckasB8QpJyfYFuokLjdwisxgyv+XwsqhpWuOKKlPBZ6zYLrDO7DAqn/nP/SC7+DpsxVgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
CC: "Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com"
	<sburla@marvell.com>, Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb
	<maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Thread-Topic: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration
Thread-Index:
 AQHZ+dpD+jj/KUeLHUaMn2y+w39Cb7BBJzcAgAA1HlCAAEi6gIAAERjwgAEF2ACAAAjm4IABoeMAgAAIQWCAAYjxAIAAAHqAgAD5sYCAAKpSgIAAAOPg
Date: Fri, 13 Oct 2023 11:41:21 +0000
Message-ID:
 <PH0PR12MB54815DBB53ACE0C91A915B4DDCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <DM8PR12MB54801E873241AA02CC32CDCBDCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231009121638-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5480E0F15A1BBDD745EE3AF4DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <25375529-9c40-9ea9-692e-f557c514c72f@intel.com>
 <PH0PR12MB54812E59B581546FFB118F3FDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f875fa3b-4b33-71c2-e612-bc2a674a1e59@intel.com>
 <PH0PR12MB548171A06CCE458C913E4961DCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <97aa9108-0715-2483-f5cf-02698c745d60@intel.com>
 <PH0PR12MB5481F4F3B4FADD79770ADEA6DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEt-pUSazfjfROukZdaLdmeX1xP7_OxQaQ=Se=jV5NXkDA@mail.gmail.com>
 <20231013071610-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231013071610-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SA1PR12MB5669:EE_
x-ms-office365-filtering-correlation-id: e79d786f-462b-4ce0-dbeb-08dbcbe15284
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 PdTGOUKvy1OLT3fc543NU4sITVjoGbVSM0SkuKblV5iy1YWLaygFwxwOgpZOTGdXguZxjbKJhh+RRoDQh3bVUCnbXL2rEF3QBO03Tx0y/6PQjHJZ8atJPJk+GhblZCQWUP8wQ2NNO0OkT61TimhMRVvXpyjtCXBgYXYbZSbtP1cTKsgxbDGRSEKIae7n3AYxcE2LZm+VSnPMrwnD3kx9Di3l8UYFOhHsebH7Hcz1ObCatZslHoRbNg8mtxqxa1MyA3U5+wEjGYnxrJ2wBWo6+SLc+qVOI9Xp42VWtMtpSJTkHJlPRgrD/WzDpRbnh89cSS/Rm9zJ8cxIU9XX/s3+6O6IJjNKaSi4ujFLH2uzkvSOO1NhUItzqXhzGCBSm18Cpi8uieoLHV60ZKjvhXq5kVhGO/FZ4bANlP15bBiXekA6KOf/l0nKEufFGuE8ayUZ0KWBTymli0imhEdk0/nv61srn8frzOwrfCw4/ppwnnp05BUkefE0e2ad4f5qynR6hZtVQCt+nLaC2loEk9eFRP1DbUV+ByxbW2vB0U01tEhIsa2YQrS9sNxe09t1wzbPdexMvpukue4XJJlj50GZzd2VmQGuNF0XMm0A48Gyf8dyCUl72c62xrXyTEfm4MBz
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(39860400002)(376002)(366004)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(66899024)(2906002)(86362001)(33656002)(122000001)(55016003)(38100700002)(38070700005)(26005)(478600001)(71200400001)(8936002)(8676002)(4326008)(9686003)(7696005)(6506007)(41300700001)(64756008)(107886003)(76116006)(66476007)(66556008)(66946007)(316002)(66446008)(83380400001)(5660300002)(54906003)(110136005)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OC9oMCt6Z05qOGVsRURYbEpaMno2czVvM0FzaThnTXU3WVZDWmxneEhYTEpD?=
 =?utf-8?B?M2xGNWZWblNmaHU5TkpVZE1CdjlpL2d1QTRQcUVEZ2JsNnNnd045RHI1R3ZN?=
 =?utf-8?B?VVk4QzBMU1dNa0ZOUHlMSmF2YmJNL1p3QjA2NjZ0bEI3U3NNTFFuczBpdFI0?=
 =?utf-8?B?b1J2elRUV1JlWkNWZ0dId1FOeE1ORVVHcllpdHE3MkNWaWZsOFBYMHRvQlZG?=
 =?utf-8?B?UG1jNHRsSlB5ZytpMnNMUExRT1BaWkppSEtTZkNKSi9WRXJWTXY5YWxiT2hU?=
 =?utf-8?B?Y0Y1cC9meER4RXRycCt3eFFRNGRCemtSdUVXUnJ4eDBWbTNpbWRrVVlURFl2?=
 =?utf-8?B?SFdJZnk2RktIN0N5dnF6TzNWaUw3VjNPd0hUbnA2bzhndjVud0pZWEFZV3Ix?=
 =?utf-8?B?UzVOODVZcGdoeFpkeC9WTXkzOW9pTXRSM3JNbnNtc3c4ellTWis0aE1lcnFq?=
 =?utf-8?B?N3B3SzdQa1lLTmR5VHdQcmNwU1RMeFNhM2tHRGR2R2J2aTNNMkJxT25TaWxa?=
 =?utf-8?B?eXhRN2kyYmNjc1RWZlB6UFZCS0Yyajd3MnFTbkEvTk9XQXRidi9tb1ErV1ls?=
 =?utf-8?B?L3hLakQwSTV0akxybHk3MmZOSFppRllrK0o3UHpiUDRIUU9Tem4rdXc2Y3dh?=
 =?utf-8?B?LzkremJlRzBUTmhKNUhDanh4ZnY4V2JaL2dTNklCaVYwSGx6VHlZb1dKQWxP?=
 =?utf-8?B?VU1QbU96S2Y1eDZ5WG5jY0tteDFLYjhJbFJMbmtyN3QvbW45bnoyVCtzUE9q?=
 =?utf-8?B?UXVJbGxlbVhRZjhRWGFKaWJHNy9xcUxQanEyUzRvcGYyYzdtdjErclNIbUNZ?=
 =?utf-8?B?eFllanZPRzlLWlhMVTB1MWlNRFgvcXpweFNmVXVGUjNxUjBjTGhFOFpTeE5R?=
 =?utf-8?B?L1BMR1NVZDgrckpxNlM4OHdxcmt4Z25lczBEQlM1elJDVjh2TFUyeDV2aUR6?=
 =?utf-8?B?V0NldU5FOVpWa3QvOXlaTnU5ZUptRjVYeVFTTGFjL0ZnRGZMSjhySnBPMHI4?=
 =?utf-8?B?WEE2enNqZEtUSU51Wi9RU1ZmT0tMYjlaWUcrUE5GZnFkYmtzdkFGdERyRVJz?=
 =?utf-8?B?L09nSVQyb21HU3c3N0t3bUlueDhNM1RoWi9obnpoRURIOE9HNTNUYXpKV1p5?=
 =?utf-8?B?eDFLa2M1VkpScEMzZ2tGMnpZRW9ETmJtdHVDRWptYkNNdzBJT0FpbUhWVE42?=
 =?utf-8?B?NC9yMEtpdFZmc2JKMW8yaGtaQlpxaFBpQUx5Mk95NlZzdG9rclVGaHRuY2FM?=
 =?utf-8?B?c21nYzJyMkZHVXFUdFJsN0Z4emNLeHFiVFVJK1RYT2dVMzB2ZTFONU5QSkRx?=
 =?utf-8?B?MTFWSnV4MW9WSlVLSURZdFJYYk1NU2gzblY1Y3BKTGhoRXdJNEpIRitMZExv?=
 =?utf-8?B?QTFNdmtULzhWK0Q5U2RzT1M0RUJVOGVXMXFEREh5UnhNK1VQR2NaMlZzc2Nr?=
 =?utf-8?B?aERRMm5waVhCdzBFZGlhbGd2N2x3Q3JQRVlpUGVic1hXUlR1RmQ5TmhjUWEr?=
 =?utf-8?B?ZEhtbmkwVTh2LzJVbUpyNVhaUmVSUXNkL0w5MW9rZnh6VlI1dWh0aUVUZXVl?=
 =?utf-8?B?OE5zbG92RmZGTW50Nkt3QXBUb1o0OGRHckNVTHIyMDVnKzBCZmJuR200dnp1?=
 =?utf-8?B?YWhyVDZTa0FLd0xwaldZc0RHNWdMeE5QaTVlblNPUll4ZTB3NWxtbVlpNEZs?=
 =?utf-8?B?NnZEL2d3K1BYUXJhUE1KeFNjRzEzSGJwZzUzL1ZQcVcvcUdPSUR6SWh1QmdX?=
 =?utf-8?B?LzZSUGhjREVIdG1sN2VVOVBtekRFVWlSSkZPK05neFJDeXBvMitKb1ZGbTBI?=
 =?utf-8?B?ckdMbmJYUXZEOHdtMUQ3aThleTM5ZHFmbTVTWHQ1YUZEMGYyUzBUdGljREZj?=
 =?utf-8?B?ZlRHNCtoOUFUVngwM3hISzJsRERmNXBMa1l3aGdCL2oyZnVGUFNtL3d0VlBz?=
 =?utf-8?B?MVNNekdyaDBFSDlJM256aVFxNlBxMjBNUXgzK1dyd0tPRTFCMGpkNmlLRkFE?=
 =?utf-8?B?OXM4UlFpNmZCb0pEU1d0Z3dPdEg4bTFiaDJkc3NQaDV6OUxmdFczV0FYdEFZ?=
 =?utf-8?B?TkZ0SEs1bG5qeFlBbVZTT2R3RWs0T1hXRUorUDh3Sjk4cGc1VjlYYjhmRXV0?=
 =?utf-8?Q?vyfI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e79d786f-462b-4ce0-dbeb-08dbcbe15284
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2023 11:41:21.5381
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jcTpC2W3L4UDzD7ULqK8E/gyAX2CmLWhOqrVLP3JTeFasr4KEe9w8/IL+p3k7ea1aM3+D9sYGvj/a8E2uhyQjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5669
Subject: RE: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

DQo+IEZyb206IHZpcnRpby1jb21tZW50QGxpc3RzLm9hc2lzLW9wZW4ub3JnIDx2aXJ0aW8tY29t
bWVudEBsaXN0cy5vYXNpcy0NCj4gb3Blbi5vcmc+IE9uIEJlaGFsZiBPZiBNaWNoYWVsIFMuIFRz
aXJraW4NCj4gU2VudDogRnJpZGF5LCBPY3RvYmVyIDEzLCAyMDIzIDQ6NTYgUE0NCg0KPiA+IFRo
aXMgaXMgdGhlIHF1ZXN0aW9uIHlvdSBuZXZlciBhbnN3ZXIgZXZlbiBpZiBJIGtlZXAgYXNraW5n
Lg0KPiANCj4gSXQgaXMsIGZ1bmRhbWVudGFsbHksIGEgcXVlc3Rpb24gb2Ygc3VwcG9ydGluZyBh
cyBtYW55IGFyY2hpdGVjdHVyZXMgYXMgd2UgY2FuDQo+IGFzIG9wcG9zZWQgdG8gYmVpbmcgb3Bp
bmlvbmF0ZWQuDQo+IA0KPiBPbiB0aGUgb25lIGVuZCBvZiB0aGUgc3BlY3RydW0sIGRldmljZSBp
cyBjb21wbGV0ZWx5IHVuZGVyIGd1ZXN0IGNvbnRyb2wgYW5kDQo+IGFueXRoaW5nIGV4dGVybmFs
IGhhcyB0byB0cmFwIHRvIGh5cGVydmlzb3IuDQo+IE5vbmUgb2YgZXhpc3RpbmcgaW1wbGVtZW50
YXRpb25zIGFyZSB0aGVyZSwgYXQgbGVhc3QgcGNpIGNvbmZpZyBzcGFjZSBpcyB0eXBpY2FsbHkN
Cj4gdW5kZXIgaHlwZXJ2aXNvciBjb250cm9sLg0KPiBXaGF0IFBhcmF2IGNhbGxzICJwYXNzdGhy
b3VnaCIgaXMgYnVpbHQgSSB0aGluayBhbG9uZyB0aGVzZSBsaW5lczoNCj4gbWVtb3J5IGFuZCBp
bnRlcnJ1cHRzIGdvIHN0cmFpZ2h0IHRvIGd1ZXN0LCBjb25maWcgc3BhY2UgaXMgdHJhcHBlZCBh
bmQNCj4gZW11bGF0ZWQuDQo+IE9uIHRoZSBvdGhlciBzaWRlIG9mIHRoZSBzcGVjdHJ1bSBpcyB0
cmFwcGluZyBldmVyeXRoaW5nIGluIGh5cGVydmlzb3IuDQo+IFlvdXIgIjIgdG8gMyByZWdpc3Rl
cnMiIGlzIGFsc28gbm90IHRoZXJlLCBidXQgaXMgSSB0aGluayBjbG9zZXIgdG8gdGhhdCBlbmQg
b2YgdGhlDQo+IGFyYy4NCj4gDQo+IEFueSBuZXcgZmVhdHVyZSBzaG91bGQgaWRlYWxseSBiZSBh
IGJ1aWxkaW5nIGJsb2NrIHN1cHBvcnRpbmcgYXMgbWFueQ0KPiBhcHByb2FjaGVzIGFzIHBvc3Np
YmxlLiBGdW5kYW1lbnRhbGx5IHRoYXQgcmVxdWlyZXMgYSBsZXZlbCBvZiBpbmRpcmVjdGlvbiwg
YXMNCj4gdXN1YWwgOikgSGF2aW5nIHR3byBjb21wbGV0ZWx5IGRpc3RpY3QgaW50ZXJmYWNlcyBm
b3IgdGhhdCBzdHJhaWdodCBvZmYgdGhlIGJhdD8NCj4gR2ltbWUgYSBicmVhay4NCg0KVGhlcmUg
YXJlIHR3byBhcHByb2FjaGVzLg0KDQoxLiBQYXNzdGhyb3VnaCBhIHZpcnRpbyBtZW1iZXIgZGV2
aWNlIHRvIGd1ZXN0DQpPbmx5IFBDSSBjb25maWcgc3BhY2UgYW5kIE1TSS1YIHRhYmxlIGlzIHRy
YXBwZWQuDQpNU0ktWCB0YWJsZSBpcyBhbHNvIHRyYXBwZWQgZHVlIHRvIGEgY3B1L3BsYXRmb3Jt
IGxpbWl0YXRpb24uIEkgd2lsbCBub3QgZ28gaW4gdGhhdCBkZXRhaWwgZm9yIGEgbW9tZW50Lg0K
QWxsIHRoZSByZXN0IG9mIHRoZSB2aXJ0aW8gbWVtYmVyIGRldmljZSBpbnRlcmZhY2UgaXMgcGFz
c3Rocm91Z2ggdG8gdGhlIGd1ZXN0Lg0KVGhpcyBpbmNsdWRlcywNCihhKSB2aXJ0aW8gY29tbW9u
IGNvbmZpZyBzcGFjZQ0KKGIpIHZpcnRpbyBkZXZpY2Ugc3BlY2lmaWMgY29uZmlnIHNwYWNlDQoo
YykgY3ZxIGlmIHByZXNlbnQNCihkKSBpbyB2cXMgYW5kIG1vcmUgdnFzDQooZSkgYW55IHNoYXJl
ZCBtZW1vcnkNCihmKSBhbnkgbmV3IGNvbnN0cnVjdCB0aGF0IGFyaXNlIGluIGNvbWluZyB5ZWFy
cw0KDQpJZiBvbmUgd2FudHMgdG8gZG8gbmVzdGluZywgdGhlIG1lbWJlciBkZXZpY2Ugc2hvdWxk
IHN1cHBvcnQgbmVzdGluZyBhbmQgaXQgd2lsbCBiZSBzdGlsbCBhYmxlIHRvIGRvIHRvIG5leHQg
bGV2ZWwuDQpUbyBteSBrbm93bGVkZ2UsIG1vc3QgY3B1cyBzdXBwb3J0IHNpbmdsZSBsZXZlbCBu
ZXN0aW5nLCB0aGF0IGlzIFZNTSBhbmQgVk0uDQpBbnkgaGlnaGVyLWxldmVsIG5lc3RpbmcgaW52
b2x2ZXMgZ29vZCBhbW91bnQgb2YgZW11bGF0aW9uIGluIHByaXZpbGVnZWQgb3BlcmF0aW9ucy4N
Cg0KSWYgdmlydGlvIHRvIGRvIGV2ZW4gbW9yZSBlZmZpY2llbnQgdGhhbiByZXN0IG9mIHRoZSBw
bGF0Zm9ybSwgSSBwcm9wb3NlIHRoYXQgbWVtYmVyIGRldmljZSBjYW4gc3VwcG9ydCBuZXN0aW5n
LCBzbyBWTU0tPlZNX0wxIGFuZCBWTV9MMS0+Vk1fTDIgY29uc3RydWN0cyBhcmUgc2FtZS4NClRo
aXMgZ2l2ZXMgdGhlIGJlc3Qgb2YgYm90aC4gTmVzdGluZyBzdXBwb3J0IGFuZCBwYXNzdGhyb3Vn
aCBib3RoLg0KQW5kIHNpbmNlIGl0cyBsYXllcmVkIGFwcHJvYWNoLCBpdCBuYXR1cmFsbHkgd29y
a3MgZm9yIG5lc3RlZCBjYXNlLg0KDQoyLiBEYXRhIHBhdGggYWNjZWxlcmF0ZWQgaW4gZGV2aWNl
LCByZXN0IGFsbCBlbXVsYXRlZC4NClRoaXMgbWV0aG9kIG1ha2Ugc2Vuc2Ugd2hlbiB1bmRlcmx5
aW5nIGRldmljZSBpcyBub3QgYSBuYXRpdmUgdmlydGlvIGRldmljZS4NCg0KQnV0IGZvciBzb21l
IHJlYXNvbiwgb2ssIG9uZSB3YW50cyB0byBidWlsZCB0aGUgaW5mcmFzdHJ1Y3R1cmUsIHdlIGNh
biBhdHRlbXB0IHRvIGZpbmQgY29tbW9uIHBpZWNlcyBiZXR3ZWVuICMxIGFuZCAjMiBtZXRob2Rz
Lg0K

