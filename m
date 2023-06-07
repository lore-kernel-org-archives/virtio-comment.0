Return-Path: <virtio-comment-return-6201-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3414C7EE25
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 03:33:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 14BE444545
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 03:33:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 02AFF986642
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 03:33:49 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E205D9840BF; Wed,  7 Jun 2023 03:33:49 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BD26B986603;
	Wed,  7 Jun 2023 03:33:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NW6wWKbgRCfcvKPhf2m2q6HYRG90/Bz7SmQIJXkjGodSMVlg07pmAh+bFo3sJScd/WVDMp2WnnVW5VcNnatFJXsAauS2bEVuXKOtTt24uTuqPEfZdQjWEbNo34BhRoCXHKtT/ldqsaQ6TzO886UbYGf4i0JjNFAAj6gNMF1Hd/jqe9XLx6pbGLJ9G8jEc1XELqdshVA2RHcXWVjnvfbw9jd93PsXoNVQaozH3i2CPsSaHRh2edQ3Hrsm4DpEFulgNsDeEf/u+7w6sIvSg7eAbMDzb2KB6nJnUf0w7zZ1ojQjgdO4MbFd0cdWW/YpDHnLFrkHLFJdfWULXr1A6zXIbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IhknHZg5mzI2dO+cUNvrGBGVXpHOgNr4Du4oKRj5Ddw=;
 b=LkkRQ3wG2Ux5G/5pmMauKpKt4rGCCOcSU2KEK8264dbpH8WM/xth8tZor+kVYagm6XfUZNPexK2NHWqfLpmcgtcRl3ITMWKbe1gZEAV6K5kqgIJtP2OyI3529m8E7melJhwBnStUyWKf16/Lu1HzTSHw962QlV8oeLU0M8cqVqh6dIlTe1Oit12gxT13/3AU9rZxzTyd4Z6q3DBHissN71rxnsVVrnhNclIq8ZacNtkCCm5o/iRN/afsk/fqMfDO9ufKudRWFkoCDjxmiS9jZU6QXFLy9rXYfD/wDa5OQ0hF7ier6NLbiNemGiYmHV9VX/sDNNdiV6u813BNE3RV1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Jason Wang <jasowang@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>
Thread-Topic: [virtio-comment] [PATCH requirements 0/7] virtio net new
 features requirements
Thread-Index: AQHZlNTogbXhoh8UHEyoUtrHwJbXYq9+q72AgAALKvA=
Date: Wed, 7 Jun 2023 03:33:44 +0000
Message-ID:
 <PH0PR12MB548125D56B332AF2ADF9DCE3DC53A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230601220305.587034-1-parav@nvidia.com>
 <CACGkMEsqPFOGPWFKeqMZD-Uj2P5qDYK_FGc2w0ri+0LsQ1N1dA@mail.gmail.com>
In-Reply-To:
 <CACGkMEsqPFOGPWFKeqMZD-Uj2P5qDYK_FGc2w0ri+0LsQ1N1dA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DS0PR12MB7745:EE_
x-ms-office365-filtering-correlation-id: 9840c433-9cdc-418b-da21-08db6707ff38
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 0tNd8y++GFQ90o2o6grYhPQU6iOfmI008BSuzeBn2hUFmyM3WDYFCaRBJ44AVAwT2fWyrYov++h/5ZQcz9iNm8uJy+VNyXaNSqbX6dEZ/cN1J2W5cBaXQfKKFhb0tpCx7X4ZgQccPpMq58WYg6MRcjkInU4la2AozaPQz4x0o9NxjulVlG6hv9+NqzgI4IbdwV6VWCg3U3Dg5p8/Jn8ZnNGuMkztanVQn8ysu9EU3i7K7V1tYt2CkSViJWeHZi7GuCsnC8ZuJ9tArr/R/2G1qSbJuwuYBD3DWDtITeIaKxT3ohpLhKsrNq8g5RxOkWkpIzosL9hktcmx4m+DXGcyuK91CDU4j2YmWnUQrD4y/aMznEUK5qFtO9v0bqeVES4Wed5a6c/J6iNTEKYnpoaetpSTMs077txGRYHFus+DzMCcBiVR+SqN78f9y1jXhM0v6QS/k82ptGYZyisbog/ggxn9WLtvKPh3FTDubM+wWhh+yWw/g6JVUgu/475hQmHdjn78Nu1Fp/utYBtfTGAsY6Q9B10AJ3+3tp+7wzmmsPn5U3EQwTvilGFcRRnXbUqDYC+KtaJoxApGV+4mxNOjTVmihd5ya+jK7WDzxSwKjT5/Hr7j1usLyAzBexgnlp4G
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(346002)(396003)(366004)(376002)(451199021)(55016003)(7696005)(66556008)(76116006)(66446008)(122000001)(6916009)(64756008)(66946007)(66476007)(2906002)(4326008)(54906003)(52536014)(5660300002)(86362001)(38070700005)(38100700002)(41300700001)(33656002)(8936002)(316002)(8676002)(71200400001)(478600001)(186003)(83380400001)(53546011)(9686003)(26005)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cjh1SnRaWWNXTWZpL3Jnc0s0S09leFQ4a0EyWU8wc1VWcFNoR3gxcno0OTFJ?=
 =?utf-8?B?R0luQnl0eTRQYW9OY0Vja3NCUUdKcHJnaTMyYUYwVmlVck9tODU3ZkdoZWpM?=
 =?utf-8?B?d2RKMHBkQVNNZEZ6aHZrL0tQQTB3WndqeGEyN2k1N2N2bzJZTUxCSDRnU25p?=
 =?utf-8?B?Z282ZDVZa2NVcDhxdzgyNmVXL3d4bWRtaENvSTNIb05TTVQ4d2plOE5wYjJz?=
 =?utf-8?B?Z01RSENvWHFWajJpQ05vU282VUorZHIyMG9Gdzh4Z29BL2p5MlQvWkE2RURV?=
 =?utf-8?B?OEsra2NsS2FEb1ZnQ2FsbVFiNG11SHRseWtNUXhCcWd3TFRWTURKT09LVWpw?=
 =?utf-8?B?V1NsRlBtWllOd0VKVm9iTk1PSVpja1JYbWpmUXpBaUdzSWtQL1lZWFMvMEJS?=
 =?utf-8?B?K24wYWhtME5vbFdmNHlpSUZ6WlNERndlNi9UMzRJTUkwWFhDNTZQSGlHRnZp?=
 =?utf-8?B?MTg4ZFlOUU02eDd1SGRGNVhLcnVQRW5yUWtoaDkwZXZlWHlsd2Y1ajBDODNB?=
 =?utf-8?B?UnFZWnZIZG05d3hkbDJEcGVRRmZyWFlJbHlSdFNybnhONDJNZDhuc3VBVlNl?=
 =?utf-8?B?bGo2ajNJNU5wQnRtOS94UGJBYVFvdzB6bFJNMkh0bS9pZkVkWDFCMVNyT2h3?=
 =?utf-8?B?ajlmc04yMDJacEpRQnpmZUFUeFFJYXNLYXFJdklyd0J3bEJLT0RlaUdGZWV1?=
 =?utf-8?B?MXM5cW96dnVWcG5mRVduY3RkdndKZTFWWCtJTitUZGNsaUxoVGd0MWVjTUVJ?=
 =?utf-8?B?a0lnSUZEZmNvMUhYM0hSTlJrbU9lbTFQVGZkMTV2cnhIV1M4RW9mSnZTVTg1?=
 =?utf-8?B?dXJrZFd6OW9lWTMvSjJnejlCbXBEYnl6dmtqa1FpVGlKNWdkSE84eGVaRjMv?=
 =?utf-8?B?VWRzbzY2RjFhVDFyelgxTCsvT3I3ZVBReFpteGxLWko2WlRUQVZrbE5xbVVu?=
 =?utf-8?B?ZjFRTXlhRldqOTFkbXVYSUQxM1UrTk9sNkxxUSticVA2RXQyQTNWWjM2UlNE?=
 =?utf-8?B?RTUxNk94cE8rYjlSSXp1cVdYV2tndWVIMXMvNUJwVzdLWjFBYmVIRm9VM3F4?=
 =?utf-8?B?Y0xrZTVWbGNxK2c0NDdtQkhUaFI5eHBDOTcybUhyNzRYMzJycCt0aDZmN1U4?=
 =?utf-8?B?VjhwdmQ3bDRTYTJISDhoSncwYUUzaGhmTlRXMlNzVUhKT2VmSWhuc0JzRHNI?=
 =?utf-8?B?cTdPRTl2ek9NS0ZvbUdMMzNBNG1VZkxtc05oSVVUM0NIZFpja3NaQmd5SVg1?=
 =?utf-8?B?M1d5dDJTWFNWL2wzK0EzRGg0RlZIMTh6MnQwWG5PWjNCVjl0SDB6STJxZm52?=
 =?utf-8?B?ZFh3THJYVXYwSTNzK0t3OGxrVm5KVHNqaGlkTnRDbTVZUWJvQmF5YjB6S3F5?=
 =?utf-8?B?aDVpcTg2RzhGQ0wwK0xuckFzOWZjWWs1V09yajAwMHZzV2hVbHFhQlR1UlRP?=
 =?utf-8?B?ckNLeGUreVBBOU8xczl6bUtxRmRxOVJuWS95RHhVUlZPQVhaVUpFOGs1eWtK?=
 =?utf-8?B?dlErSkY1ZmZrMG9STzczeGVMS3l5bDE4L2plK3BnU2ZWWlViSVA5OHBadHRL?=
 =?utf-8?B?Q3lib1dMYzB5VDcwMmx5dGNocVFhSzZPSDlkRDRVKzR2REw0UDJ4Wm4xVTU4?=
 =?utf-8?B?Q0pRbDg5QmRaR1lUYVlhY1lRdW91WDBOU3RUTDRIeFFNYUltaTYrdWtqVExM?=
 =?utf-8?B?Vm1YQit3Y0R4ZS9Wdi9OcWVNYVl6U3Y3SnJGWUJ4SFlLQzlqN2VUZTJwQkRy?=
 =?utf-8?B?bGVPMEY5dFJWcVVhSmZIQXd5N0ZXdzlzU2VMODFXOUEyaWs4SC9zczcwSDMx?=
 =?utf-8?B?WVZJMTBKZG8wbktjZTNGNEh6VjJGVVZnajRKczJKV0t2K2V5WXZOaVlTeUJY?=
 =?utf-8?B?ejQwKzFrSm9YNDMzdktZQktrY3N5T1J0Q3ZORFg3UGVzY2tXTVc5U2lNU1Zm?=
 =?utf-8?B?M3NhdjhHZWh5NUQraldLZjNRakw5U1ZUcmI5M2QvU2ljQWw5bjRPR2szbko4?=
 =?utf-8?B?L0ErS0FnSnhWNDB3RjQzdU55MFNhbUNubU50Nk10OWQ4VlJZdnk1R0QzNlhx?=
 =?utf-8?B?Rm1ZZE03MFRuZkgybkFPWmJLN1RoTEp2SWJQMENFK1FLemxlVTF2dXRCRmNx?=
 =?utf-8?Q?oM+Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9840c433-9cdc-418b-da21-08db6707ff38
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2023 03:33:44.7010
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x8zuwfaeOWsVNwm0g3VbGTpJ2gjx5i9oeZJQ80kJqatS8R5inf4QocxX9Ky3FLias+IgualTM3PctjkDt6+iWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7745
Subject: RE: [virtio-comment] [PATCH requirements 0/7] virtio net new features
 requirements

DQoNCj4gRnJvbTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4NCj4gU2VudDogVHVl
c2RheSwgSnVuZSA2LCAyMDIzIDEwOjUwIFBNDQo+IA0KPiBPbiBGcmksIEp1biAyLCAyMDIzIGF0
IDY6MDPigK9BTSBQYXJhdiBQYW5kaXQgPHBhcmF2QG52aWRpYS5jb20+IHdyb3RlOg0KPiA+DQo+
ID4gSGkgQWxsLA0KPiA+DQo+ID4gVGhpcyBkb2N1bWVudCBjYXB0dXJlcyB0aGUgdmlydGlvIG5l
dCBkZXZpY2UgcmVxdWlyZW1lbnRzIGZvciB0aGUNCj4gPiB1cGNvbWluZyByZWxlYXNlIDEuNCB0
aGF0IHNvbWUgb2YgdXMgYXJlIGN1cnJlbnRseSB3b3JraW5nIG9uLg0KPiA+DQo+ID4gSSB3b3Vs
ZCBsaWtlIHRvIGNhcHR1cmUgaWYgdGhlcmUgYXJlIGFueSBvdGhlciByZXF1aXJlbWVudHMgbGlu
a2VkIHRvDQo+ID4gdGhlIGZlYXR1cmVzIGNhcHR1cmVkIGluIHRoaXMgZG9jdW1lbnQgdG8gY29u
c2lkZXIgaW4gdGhlIGludGVyZmFjZSBkZXNpZ24uDQo+ID4NCj4gPiBUaGUgb2JqZWN0aXZlcyBh
cmU6DQo+ID4gMS4gdG8gY29uc2lkZXIgdGhlc2UgcmVxdWlyZW1lbnRzIGluIGludHJvZHVjaW5n
IG5ldyBmZWF0dXJlcyBsaXN0ZWQNCj4gPiBpbiB0aGUgZG9jdW1lbnQgYW5kIHdvcmsgdG93YXJk
cyB0aGUgaW50ZXJmYWNlIGRlc2lnbiBmb2xsb3dlZCBieQ0KPiA+IGRyYWZ0aW5nIHRoZSBzcGVj
aWZpY2F0aW9uIGNoYW5nZXMuDQo+ID4NCj4gPiAyLiBEZWZpbmUgcHJhY3RpY2FsIGxpc3Qgb2Yg
cmVxdWlyZW1lbnRzIHRoYXQgY2FuIGJlIGFjaGlldmVkIGluIDEuNA0KPiA+IHRpbWVmcmFtZSBp
bmNyZW1lbnRhbGx5IGFuZCBhbHNvIGhhdmUgdGhlIGFiaWxpdHkgdG8gaW1wbGVtZW50IHRoZW0u
DQo+ID4NCj4gPiBUaGlzIGlzIG5vdCBhIHNwZWNpZmljYXRpb24gZG9jdW1lbnQuIEl0IGlzIGEg
cHJlLXdvcmsgZG9jdW1lbnQgdGhhdA0KPiA+IGhlbHBzIHRvIHVuZGVyc3RhbmQgdGhlIGRyYWZ0
IHNwZWNpZmljYXRpb24gYWRkcmVzc2luZyB0aGVzZQ0KPiA+IHJlcXVpcmVtZW50cy4NCj4gPg0K
PiA+IFBsZWFzZSByZXZpZXcuDQo+ID4NCj4gPiBQYXJhdiBQYW5kaXQgKDcpOg0KPiA+ICAgbmV0
LWZlYXR1cmVzOiBBZGQgcmVxdWlyZW1lbnRzIGRvY3VtZW50IGZvciByZWxlYXNlIDEuNA0KPiA+
ICAgbmV0LWZlYXR1cmVzOiBBZGQgbG93IGxhdGVuY3kgdHJhbnNtaXQgcXVldWUgcmVxdWlyZW1l
bnRzDQo+ID4gICBuZXQtZmVhdHVyZXM6IEFkZCBsb3cgbGF0ZW5jeSByZWNlaXZlIHF1ZXVlIHJl
cXVpcmVtZW50cw0KPiA+ICAgbmV0LWZlYXR1cmVzOiBBZGQgbm90aWZpY2F0aW9uIGNvYWxlc2Np
bmcgcmVxdWlyZW1lbnRzDQo+ID4gICBuZXQtZmVhdHVyZXM6IEFkZCBuLXR1cGxlIHJlY2VpdmUg
ZmxvdyBzdGVlcmluZyByZXF1aXJlbWVudHMNCj4gPiAgIG5ldC1mZWF0dXJlczogQWRkIHBhY2tl
dCB0aW1lc3RhbXAgcmVxdWlyZW1lbnRzDQo+ID4gICBuZXQtZmVhdHVyZXM6IEFkZCBoZWFkZXIg
ZGF0YSBzcGxpdCByZXF1aXJlbWVudHMNCj4gPg0KPiA+ICBuZXQtd29ya3N0cmVhbS9mZWF0dXJl
cy0xLjQubWQgfCAyMjQNCj4gPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4g
DQo+IEkgZmVlbCB0aGF0IHNvbWUgcGF0Y2hlcyBnbyBpbnRvIHRvbyBtYW55IGRldGFpbHMgb2Yg
dGhlIHByb3Bvc2VkIHNvbHV0aW9uDQo+IHdoaWNoIG1ha2VzIGl0IG1vcmUgbGlrZSBSRkMgaW5z
dGVhZCBvZiBhIHJlcXVpcmVtZW50Lg0KPiANCj4gSXQgd291bGQgYmUgZWFzaWVyIHRvIHN0YXJ0
IHdpdGggdG8gZGVzY3JpYmUgd2h5IGEgZmVhdHVyZSBpcyBuZWVkZWQgYW5kIHdoeSBpdA0KPiBj
YW4ndCB3b3JrIHdlbGwgaW4gY3VycmVudCBzcGVjLg0KDQpJdCBpcyB3b3JkZWQgZGlmZmVyZW50
bHkgYXMgZmVhdHVyZXMvcmVxdWlyZW1lbnRzLiBUaGlzIHByb2JhYmx5IG9ubHkgYXBwbGllcyB0
byB0eCBhbmQgcnggcS4NClJlc3QgYWxsIGFyZSB0aGUgbmV3IGZlYXR1cmVzIHNvIGl0cyBub3Qg
YWJvdXQgImNhbm5vdCB3b3JrIHdlbGwiLCBiZWNhdXNlIGl0IGp1c3QgZG9lc250IGV4aXN0Lg0K
DQpJbnN0ZWFkIG9mIGV4cGxhaW5pbmcgbmVnYXRpdmVseSAid2h5IGp1c3QgeWV0IGFkZCBuZXcg
ZGVzY3JpcHRvciBmb3IgdHJhbnNtaXQgdGltZXN0YW1wIiwgaXQgaXMgd3JpdHRlbiB3aXRoIG9w
dGltaXNtIGluIG1pbmQsIGhvdyBpdCBzaG91bGQgYmUgZG9uZSBpbiBvbmUgZG1hIC4uLg0KDQpC
dXQgSSBhZ3JlZSB0aGF0IHNtYWxsIHBvcnRpb24gY2FuIGhhdmUgcmF0aW9uYWxlIHNlY3Rpb24s
IGlmIGl0cyB1bmNsZWFyLg0K

