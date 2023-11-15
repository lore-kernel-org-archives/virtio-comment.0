Return-Path: <virtio-comment-return-8370-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8599AC072A2
	for <virtio-comment@archiver.kernel.org>; Wed, 15 Nov 2023 17:39:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E941160D27
	for <virtio-comment@archiver.kernel.org>; Wed, 15 Nov 2023 17:39:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DC33D986DC0
	for <virtio-comment@archiver.kernel.org>; Wed, 15 Nov 2023 17:39:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D1DF0986DB5; Wed, 15 Nov 2023 17:39:33 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C3F51986DB6
	for <virtio-comment@lists.oasis-open.org>; Wed, 15 Nov 2023 17:39:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kbkdaV12Ne4jw/ktrOIBdCW7hzHGoq8jrA2bB0/cRGwvP6G4qpI71OgtziOQK7aA4r2GTfPIc74nRZiuHbYwqpfmHC0qxGV64oSdTQkRLWQtyIoVfHuZmSbpl/VT8FruE8AXGfbkvJBNXExACswVSIKNS3f3NGk0ykYwdiJNpEkSaeconxyV8B9xRx6dW05E78S6A+sTztEey4Gi++nt6Ap0pVrv68xYjEHX2G9z2z+kmn0+WnI7yyX3GyocA9qgRGNUW8qP83DkRWws9uhYODC4yoHfjJGmlHO10LFqCM39rFoYkM1I7wXLqpJ8eIbqI5PAFlnEtif7WVfzcZ6HYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gov85CucnoMELEv+NARj+88QFH7lUNpFIPRnzZd2Kd8=;
 b=Wqhcd7t5KsU94r7zkQyAlyBH+qERXP6Ti/fq5JGuh8wDT3jgkqjDTjNq7X9K+4I9oKYUu0yfOGcTMWbf2WnW9gHJeffB59cMtyfwDRAwhefaUc45bGv84pcoCNuUSiRJauZu3OUdZB4NJpC1EICCxK/yyxTDnfRuf9Fe5QR6cnuE8foR6NutG9WKPDcVz4yzU0BncfcyU3s+KMBIDX9G+1dpbHV0zzvolTTRgjuroT2dENX0iFgUAJJ7tbEXcdNiqh1MD2qcvXWQ6OqtoNxiopLVGrNc4ofl/qePWz4/B/CSLIGWOBONhWaXlRcH9KbG6NZngAWwgz/SRJsB97xs0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Jason Wang <jasowang@redhat.com>
CC: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, "eperezma@redhat.com" <eperezma@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "stefanha@redhat.com"
	<stefanha@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
Thread-Topic: [PATCH V2 3/6] virtio: dont reset vqs when SUSPEND
Thread-Index:
 AQHaDkFjDoKRbBsYgkWQI+N8LeuYiLBtEIiAgAGML4CAAh3lAIABD20AgAADyiCABdpcAIAD/JZg
Date: Wed, 15 Nov 2023 17:39:10 +0000
Message-ID:
 <PH0PR12MB54819A6E470D3ABE4BC1F450DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-4-lingshan.zhu@intel.com>
 <20231106044836-mutt-send-email-mst@kernel.org>
 <c6cb6e6b-fd2b-43ac-9be5-c4a8cda1ac13@intel.com>
 <20231108124625-mutt-send-email-mst@kernel.org>
 <b125da70-a769-4662-876b-43664e39c976@intel.com>
 <PH0PR12MB5481577C0492D45C20CF9C62DCAFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvLYgnLtSqx_G=-KMuANEZ=xtAzJjV3pYqAZhA0qqW0sQ@mail.gmail.com>
In-Reply-To:
 <CACGkMEvLYgnLtSqx_G=-KMuANEZ=xtAzJjV3pYqAZhA0qqW0sQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SJ1PR12MB6266:EE_
x-ms-office365-filtering-correlation-id: e1d14dd4-3f30-4cf2-7929-08dbe601c6bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 5bNl9AgChmPfFY9YCH+Oj0e9su2FkUwckfcy0ZUXa3nyjI+OFlpxMXZG6DqAX7f1HoJ5OQWaR450auyHkUNUG5VZYT+KdhgtFfgWFwmvZUW+HSg1R+RfNsatiGXrOF06dsZ8AYl+5+47/4MrdD6Iu3U94c9vkr8YgWa241gFGX1f6eubFYuUPc2VqTEFdys5IIk/G4tJs3qR8pfY2JqzOfCsGCKj4AINzKfSHVlbIFj8JyTYmWU3vTcCzMWV4ILyyYlF+Zvih88v6ED0f8nimfu56gtTDiSnPlQC16u80hxLjKCf4a5/0cPvWJYXqxh22R9jG3YXAErb+PKQbyAH8QSwtrmv1MEhzGB34tCwWJA4Jr9Wi+BF3V2k58Fa/EYXLjYxQYPBj/zFjUsPMCv8Ilqq86JjBHBBovKrMGcmHGESlzn79VgE8mZKJRw+vFTppzfVIn85O2E8lSKH+pqhUEOkfgqFOxDkcpCKJ/oYzIvCr5TAeuNBaxdCxzkiBp8qcH9wtr09OTgA1i8eJZPegf0TxiAXnkGy1vsFSoxF3rJLKBHavbE2KZurS+4xaNAGtEWyDpm1ujhqDgZcqaechlEmLyIQfSE2+33ul1rLPHpjOr9/aySYD9Za32BziquJP2/xGx04YNbcbRjs4PjRgg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(346002)(376002)(366004)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(33656002)(122000001)(83380400001)(55016003)(41300700001)(26005)(53546011)(6506007)(7696005)(9686003)(38070700009)(2906002)(478600001)(15650500001)(86362001)(5660300002)(66476007)(64756008)(52536014)(66946007)(38100700002)(76116006)(66556008)(66446008)(54906003)(6916009)(316002)(8936002)(8676002)(4326008)(71200400001)(192303002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eFVaU2ttYmg1bGQxZDVBN0dWNzBPWHJkamFFZTJ6TXg2ZW95T0RQc21ublp2?=
 =?utf-8?B?OEFtaWJHOFhNQTRhOXB5VjlyZ0ZXamxld2FJUTdTN3lOQnhIZk1XODF4M3JQ?=
 =?utf-8?B?UllQVWUrQ2ZvUHlWVjRseXJGSWNUWCtFbFBYdkM3amRJbWlGV3V1b2JRalBh?=
 =?utf-8?B?YnIxL0VDT0xGWjlKSTBFTS96T3diRkR4ZGhMK28zSXBYT0xyeGtmdjFLZEZB?=
 =?utf-8?B?dThmNithWUJTRThWN2JkeG1GWXpTVkFydmhUc3N3THV3UnZkTjBIdWhqdk5r?=
 =?utf-8?B?ZlBRTUpWM3FlM3paRFA2TEo3VndkR1ZjSWxjTEllZVltcmpobVBBVmcrejRM?=
 =?utf-8?B?U3VCSlB2QjErWUxLVkNQT04vcTN2cjBiMWtha1FpZEhiZy9uamVWalJheXR0?=
 =?utf-8?B?Q2JMMk5WZ3lyYlVxeWtTSE9yZFF5eDI1aU5JNzF3NFdLdExMd3pzR2wwNUdZ?=
 =?utf-8?B?S3JNdXdMKzJzRWJtaGhUNTgyWUM3ZUNDU3pyQ3dGSjdWVm82SUZFQkdqZTh1?=
 =?utf-8?B?dWNZOWtLY0g2ZGdGMko1b1F4TUJGRlBISVlJcTlWYVZsWTR3QmVYbC9IQ3Yr?=
 =?utf-8?B?N2xrZ01zY3JCS3Z6REw0bjdrOGIvNGpNRFd1K3Y5YUluMmJLZDNpOUVpTHJP?=
 =?utf-8?B?N1pqcVlONmhCcWVubUMyTU1KSWtkdGUvS0JvcmRtbG1WVldZbjJoVUQrOHVT?=
 =?utf-8?B?VVBsdTY1ZU1Od090MVFsRFE4WGpJdGVtY2FaWjNHdkRxalBrb20zMm4wM2VO?=
 =?utf-8?B?eGFTWUQzQW9yUmtuZnlRUE80eWluUzFOTnpDMk1nSHNkRnhmZEFKRG5VK2tv?=
 =?utf-8?B?NjhlVWVlTGpkSmwrbE1BUGlSR2xBcGtHMlpDSGVCazM1eCtqcERCdXRVVHhO?=
 =?utf-8?B?NUdlOEVRL3NwYUFUOUFrajR4R2xpaW1ybE5NSU40aGZHS29POFNZSy90MWFQ?=
 =?utf-8?B?eUYyeG5xQjVwWCtVZUNCdkt2bGdhNnNlUlA0aHdjb1NacjhJaHZsZnVpZk9h?=
 =?utf-8?B?YklyVEJXZ3lvOWVReDBob3Q2YmJORUdWK1JLWEpmeThRcmt0MXZUOWNCUkJZ?=
 =?utf-8?B?dkxiczFRK3NucStuMUFvdWkzbXFpUEZiWEhTWWlrSkdyQlFHMkdEV01oK1Ju?=
 =?utf-8?B?MVZCeUk5c0ltZG5zU1dqNmRHb1ozajc2L0pPNTRFRjRsWkNSSmdtdkhtbTI5?=
 =?utf-8?B?Q0Y4c1luVFlFUUt2NjRRL1gvSmtKM0xKdEY2bkVSKzBOWEtqUXhhLzAyTHZR?=
 =?utf-8?B?MkF0SU9mS1RkcXFWTTVNNjJ4L0xocTdOeHdZKzB0N01ndkRzRDFyMk1mdUZX?=
 =?utf-8?B?VzZxS0tZeUhEOVpTV05ld0NIbEtsQlpueEcvNlYzQU1ya2lBQVFqVFFFeW9S?=
 =?utf-8?B?RTdIc2ZnRUNDeTJKVVRFbkozY21nZlpTQUkyeHhMaWM5b1pkaGJhSkkzR2ps?=
 =?utf-8?B?Q1JmaXNHYURGT016Qnk4Q2JSOWhrenppUStPZzk1S0ExYWtvdWgxMXEwVGMz?=
 =?utf-8?B?dE81Ti9VUVUyWnF0WGdORGdLRGFNMCtBSEZpU2MxM0JoaHJ3b2VlSUVWa0Fr?=
 =?utf-8?B?U0JxMndRZ3dFQXM1VXF6azd5UFQ1WHNsL1ZaV2VNSWJ3bjllY250ZWlHR1Ex?=
 =?utf-8?B?dmdPRlJROS9CNlhURTNMTnh4eUIycUg1WVZhVzVnSTMwdllEKysxUFpNZWNQ?=
 =?utf-8?B?YktzRXN5SWM4b0xpMmxjbEZoWFl3eThmTUl6blN0VGcyWmhRQzZ0My90MmtY?=
 =?utf-8?B?aFB6TG41TXNCVVNpcit0emxZQmdhbGV5TVBuaDVPbnJWandqa0twR1pGSGIz?=
 =?utf-8?B?S082NTZJMXBwR05FSjRkaEx5cEZSRG1INzVvUGtuNTNGUkNGaStacWRtaWxB?=
 =?utf-8?B?QjZXMTBOUC82SjVnVFkyTFo5ZnIrUG1WazI1UGxMT1NGcnN6MGQ1Z1NPV1JT?=
 =?utf-8?B?MGM0dUV6SmYwM3ErRjlCSWhPUTVoMUxZYXJjd2x0WnlGN0xTVm90M25lV1BL?=
 =?utf-8?B?a3JrSVdIT3ljbVJVQmNPMGVzaDc2Y0diTmgzT29odGJUdXBaelZGZHhrWm05?=
 =?utf-8?B?bWQySUU5Z1hmTnZjMWY3VUQ0TUlOMzlZVE5uYTlaS3Y1d095aDFoT3J6QkUy?=
 =?utf-8?Q?tBrY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1d14dd4-3f30-4cf2-7929-08dbe601c6bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2023 17:39:10.6632
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XDC4Z1YMoG/iHX4qzHOHprExyo1GCSsdvCzCz2p/rNgq/sgPMHseKvPaFzJO1x1PcX12aJInSACl2B1gqMau7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6266
Subject: [virtio-comment] RE: [PATCH V2 3/6] virtio: dont reset vqs when SUSPEND

DQoNCj4gRnJvbTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4NCj4gU2VudDogTW9u
ZGF5LCBOb3ZlbWJlciAxMywgMjAyMyA5OjA1IEFNDQo+IA0KPiBPbiBUaHUsIE5vdiA5LCAyMDIz
IGF0IDY6MTbigK9QTSBQYXJhdiBQYW5kaXQgPHBhcmF2QG52aWRpYS5jb20+IHdyb3RlOg0KPiA+
DQo+ID4NCj4gPiA+IEZyb206IFpodSwgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+
DQo+ID4gPiBTZW50OiBUaHVyc2RheSwgTm92ZW1iZXIgOSwgMjAyMyAzOjI4IFBNDQo+ID4gPg0K
PiA+ID4gT24gMTEvOS8yMDIzIDE6NDYgQU0sIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToNCj4g
PiA+ID4gT24gVHVlLCBOb3YgMDcsIDIwMjMgYXQgMDU6Mjc6MjNQTSArMDgwMCwgWmh1LCBMaW5n
c2hhbiB3cm90ZToNCj4gPiA+ID4+DQo+ID4gPiA+PiBPbiAxMS82LzIwMjMgNTo0OSBQTSwgTWlj
aGFlbCBTLiBUc2lya2luIHdyb3RlOg0KPiA+ID4gPj4+IE9uIEZyaSwgTm92IDAzLCAyMDIzIGF0
IDA2OjM0OjM0UE0gKzA4MDAsIFpodSBMaW5nc2hhbiB3cm90ZToNCj4gPiA+ID4+Pj4gV2hlbiBT
VVNQRU5EIGlzIHNldCwgZGV2aWNlIHN0YXRlcyBhbmQgdmlydHF1ZXVlIHN0YXRlcyBzaG91bGQN
Cj4gPiA+ID4+Pj4gYmUgc3RhYmxpemVkLCB0aGVyZWZvcmUgdGhlIGRyaXZlciBzaG91bGQgbm90
IHJlc2V0IHZxcyB3aGVuDQo+ID4gPiA+Pj4+IFNVU1BFTkQgaXMgc2V0IGluIGRldmljZSBzdGF0
dXMuDQo+ID4gPiA+Pj4+DQo+ID4gPiA+Pj4+IFNpZ25lZC1vZmYtYnk6IFpodSBMaW5nc2hhbiA8
bGluZ3NoYW4uemh1QGludGVsLmNvbT4NCj4gPiA+ID4+Pj4gLS0tDQo+ID4gPiA+Pj4+ICAgIGNv
bnRlbnQudGV4IHwgMyArKysNCj4gPiA+ID4+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKQ0KPiA+ID4gPj4+Pg0KPiA+ID4gPj4+PiBkaWZmIC0tZ2l0IGEvY29udGVudC50ZXgg
Yi9jb250ZW50LnRleCBpbmRleCBiY2M5ZDRiLi4wNjBiNWMyDQo+ID4gPiA+Pj4+IDEwMDY0NA0K
PiA+ID4gPj4+PiAtLS0gYS9jb250ZW50LnRleA0KPiA+ID4gPj4+PiArKysgYi9jb250ZW50LnRl
eA0KPiA+ID4gPj4+PiBAQCAtNDQ0LDYgKzQ0NCw5IEBAIFxzdWJzdWJzZWN0aW9ue1ZpcnRxdWV1
ZQ0KPiA+ID4gPj4+PiBSZXNldH1cbGFiZWx7c2VjOkJhc2ljDQo+ID4gPiBGYWNpbGl0aWVzIG9m
IGEgVmlydGlvIERldmljZSAvDQo+ID4gPiA+Pj4+ICAgIFRoZSBkZXZpY2UgTVVTVCByZXNldCBh
bnkgc3RhdGUgb2YgYSB2aXJ0cXVldWUgdG8gdGhlIGRlZmF1bHQgc3RhdGUsDQo+ID4gPiA+Pj4+
ICAgIGluY2x1ZGluZyB0aGUgYXZhaWxhYmxlIHN0YXRlIGFuZCB0aGUgdXNlZCBzdGF0ZS4NCj4g
PiA+ID4+Pj4gK0lmIFZJUlRJT19GX1NVU1BFTkQgaXMgbmVnb3RpYXRlZCBhbmQgU1VTUEVORCBp
cyBzZXQgaW4NCj4gPiA+ID4+Pj4gK1xmaWVsZHtkZXZpY2Ugc3RhdHVzfSwgdGhlIGRyaXZlciBT
SE9VTEQgTk9UIHJlc2V0IGFueSB2aXJ0cXVldWVzLg0KPiA+ID4gPj4+PiArDQo+ID4gPiA+Pj4+
ICAgIFxkcml2ZXJub3JtYXRpdmV7XHBhcmFncmFwaH17VmlydHF1ZXVlIFJlc2V0fXtCYXNpYw0K
PiA+ID4gPj4+PiBGYWNpbGl0aWVzIG9mIGENCj4gPiA+IFZpcnRpbyBEZXZpY2UgLyBWaXJ0cXVl
dWVzIC8gVmlydHF1ZXVlIFJlc2V0IC8gVmlydHF1ZXVlIFJlc2V0fQ0KPiA+ID4gPj4+PiAgICBB
ZnRlciB0aGUgZHJpdmVyIHRlbGxzIHRoZSBkZXZpY2UgdG8gcmVzZXQgYSBxdWV1ZSwgdGhlDQo+
ID4gPiA+Pj4+IGRyaXZlciBNVVNUIHZlcmlmeSB0aGF0DQo+ID4gPiA+Pj4gU2VlbXMgc29tZXdo
YXQgYXJiaXRyYXJ5IGFuZCBicmVha3MgdGhlIGNsYWltIHRoYXQgdGhlIGZlYXR1cmUNCj4gPiA+
ID4+PiBpcyBvcnRob2dvbmFsIGFuZCBjYW4gaGF2ZSB1c2VzIGJlc2lkZXMgbWlncmF0aW9uLg0K
PiA+ID4gPj4gd2hlbiBzdXNwZW5kZWQsIHRoZSBkZXZpY2UgaXMgZnJvemVuLg0KPiA+ID4gPj4g
VGhlIGRyaXZlciBpcyBhd2FyZSBvZiB0aGlzIHByb2Nlc3MgYW5kIHNvIHNob3VsZCBub3QgcmVz
ZXQgdGhlIHZxcyBJIHRoaW5rLg0KPiA+ID4gPiBBZ2FpbiB0aGF0IGlzIG9ubHkgdHJ1ZSBiZWNh
dXNlIHlvdSB3YW50IHRvIHVzZSBpdCBmb3IgbWlncmF0aW9uLg0KPiA+ID4gPiBCdXQgdGhlbiB5
b3UgY2FuJ3QgY2xhaW0gaXQncyBhIGdlbmVyaWMgZmFjaWxpdHkuDQo+ID4gPiBJIGRvbid0IGdl
dCBpdC4gVGhlIGRldmljZSBzdGF0dXMgaXMgYSBiYXNpYyBmYWNpbGl0eS4NCj4gPiA+DQo+ID4g
PiBXZSBuZWVkIHRvIFNVU1BFTkQgdGhlIGRldmljZSBieSBzZXR0aW5nIFNVU1BFTkQgYml0LCB0
byBzdGFiaWxpemUNCj4gPiA+IHRoZSBkZXZpY2Ugc3RhdGVzIGZvciBtaWdyYXRpb24uDQo+ID4g
SXMgdGhlIFBDSSdzIFBNIHRpbWUgbm90IGVub3VnaCB0byBzdXNwZW5kIHRoZSBkZXZpY2U/DQo+
IA0KPiBBcmUgeW91IHNheWluZyB3ZSBkb24ndCBuZWVkIHZpcnRpbyByZXNldCBhc3N1bWluZyB3
ZSBoYWQgRkxSPw0KPg0KTm8uIG9mdGVuIEZMUiB0aW1pbmcgaXMgbm90IGVub3VnaC4gSGVuY2Ug
ZXZlcnkgUENJIGxldmVsIGRldmljZSBoYXMgc29tZSBzb3J0IG9mIGl0cyBvd24gcmVzZXQgbWVj
aGFuaXNtLg0KIA0KPiBTdXNwZW5kaW5nIGF0IGRpZmZlcmVudCBsYXllcnMgbGlrZSByZXN0IGF0
IGRpZmZlcmVudCBsYXllcnMuDQo+IA0KPiBXZSBoYXZlIGJvdGggRkxSIGFuZCB2aXJ0aW8gcmVz
ZXQuIFRoZSBWaXJ0aW8gbGV2ZWwgZnVuY3Rpb24gY291bGQgYmUgcmVzZXQNCj4gd2l0aG91dCBG
TFIuIFNvIGRpZCBzdXNwZW5kLg0KPiANCj4gVGhhdCdzIGl0Lg0KU3VyZSwgYnV0IHdyYXBwaW5n
IGl0IHVuZGVyIHNvbWUgImJhc2ljIGZhY2lsaXR5IiBpcyBqdXN0IGRvZXMgbm90IG1ha2Ugc2Vu
c2UuDQoNCj4gDQo+IEFuZCBpZiB5b3Ugd2FudCB0byBydWxlIFAyUCBiZWhhdmlvdXJzLCBQQ0kg
UE0gaXMgcmVhbGx5IHRoZSBjb3JyZWN0IHdheSB0byBnbw0KPiBpbnN0ZWFkIG9mIHRyeWluZyB0
byBkbyBpdCBhdCB0aGUgdmlydGlvIGxheWVyLg0KPg0KUENJIFBNIGlzIHN1cHBvc2VkIHRvIGJl
IGNvbnRyb2xsZWQgYnkgdGhlIGd1ZXN0IGFuZCBzbyB0aGUgc3VzcGVuZC4NCg0KSHlwZXJ2aXNv
ciBuZWVkcyBpdHMgY2hhbm5lbCB0byBzdXNwZW5kIHRoZSBkZXZpY2UsIGFzIGZ1bmRhbWVudGFs
bHkgZ3Vlc3QgaXMgdW5hd2FyZSBvZiBkZXZpY2UgbWlncmF0aW9uIGZsb3cuDQogDQo+ID4gRm9y
IGxhcmdlIGRldmljZSBJIGNvdWxkIGltYWdpbmUgaXQgY291bGQgYmUgc2hvcnQuDQo+ID4NCj4g
PiBJbiB0aGF0IGNhc2UgaWYgdGhlcmUgaXMgc3VzcGVuZCB0aGUgZGV2aWNlIGF2YWlsYWJsZSwg
aXQgd2lsbCBiZSB1c2VkIGJ5IHRoZSBndWVzdA0KPiBkcml2ZXIgaXRzZWxmLCBoeXBlcnZpc29y
IHdvdWxkbuKAmXQga25vdyBhYm91dCBpdCB3aGVuIHRob3NlIHJlZ2lzdGVycyBhcmUgbm90DQo+
IHRyYXBwZWQuDQo+ID4gU28gd2UgbmVlZCB0d28gd2F5cyB0byBzdXNwZW5kLg0KPiA+IE9uZSBp
cyBndWVzdCB2aXNpYmxlLCBhbmQgZ3Vlc3QgY29udHJvbGxlZC4NCj4gPiBTZWNvbmQgaXMgaHlw
ZXJ2aXNvciBjb250cm9sIHRvIGZ1bGZpbGwgdGhlIGRldmljZSBtaWdyYXRpb24gbmVlZHMuDQo+
IA0KPiBDYW4geW91IGV4cGxhaW4gd2h5IHN1c3BlbmQgaXMgc3BlY2lhbCBidXQgbm90IHJlc2V0
IG9yIHdoeSByZXNldCBjYW4gd29yayBidXQNCj4gbm90IHN1c3BlbmQ/IElmIHJlc2V0IGNhbiB3
b3JrLCBzbyBkb2VzIHN1c3BlbmQuIElmIHJlc2V0IGNhbid0LCBuZWl0aGVyIGRvZXMNCj4gc3Vz
cGVuZC4NCj4gDQpBcyBsb25nIGFzIHJlc2V0IGFuZCBzdXNwZW5kIGJvdGggYXJlIHVuZGVyIGd1
ZXN0IGNvbnRyb2wsIEkgYW0gZmluZS4NCg0KPiBGb3IgZXhhbXBsZSwgY2FuIHlvdSBleHBsYWlu
IGhvdyBhIHN5c3RlbV9yZXNldCBpbiBRZW11IGNhbiB3b3JrIHdpdGggeW91cg0KPiBwcm9wb3Nh
bD8NCj4gDQo+ID4NCj4gPiBTbyBpZiB5b3UgY2FuIHBsZWFzZSB0YWtlIGEgbG9vayBpZiB0aGUg
cHJvcG9zZWQgYWRtaW4gY29tbWFuZCB0bw0KPiBmcmVlemUvc3RvcCBtb2RlIGNhbiBiZSB1c2Vk
IGluIHRoZSBlbXVsYXRlZCByZWdpc3RlciBjYXNlIG9yIG5vdC4NCj4gDQo+IEFnYWluLCBpZiB5
b3UgZGVzaWduIHRob3NlIGZvciBQQ0ksIGl0J3MgYSBsYXllciB2aW9sYXRpb24uIFlvdSBoYXZl
IGFuc3dlcmVkDQpUaGV5IGFyZSB1c2VkIGJ5IHRoZSBQQ0kgbGF5ZXIsIGp1c3QgbGlrZSB5b3Vy
IHN1c3BlbmQgYml0Lg0KQW5keSBvdGhlciB0cmFuc3BvcnQgY2FuIGFsc28gdXNlIGl0Lg0KDQo+
IHlvdXJzZWxmIHRoYXQgUE0gaXMgdGhlIHJpZ2h0IHdheSB0byBnby4NCj4gDQo+ID4gSXQgaGVs
cHMgdG8gaGF2ZSB0aGUgc3VzcGVuZCBiaXQgaW4gZ3Vlc3QgY29udHJvbCBhcyB3ZWxsIHdpdGgv
d2l0aG91dA0KPiBlbXVsYXRpb24gbW9kZS4NCj4gDQo+IEkgd29uJ3QgcmVwZWF0IGl0IGFnYWlu
LiBZb3Ugd2lsbCBmaW5kIHlvdSBuZWVkIGEgZnVsbCB0cmFuc3BvcnQgdG8gc2F0aXNmeSBhbGwg
dGhlDQo+IHJlcXVpcmVtZW50cy4NCkkgZGlzYWdyZWUgZm9yIGZ1bGwgdHJhbnNwb3J0Lg0KSWYg
eW91IHdhbnQgdG8gZ2V0IGRpc2N1c3MgdHJhbnNwb3J0IGZvciBzdXJlIGl0IGlzIHNvbWUgb3Ro
ZXIgdGhyZWFkIGFuZCBJIHdhbnQgdG8gc2VlICJkcml2ZXIgbm90aWZpY2F0aW9ucyB2aWEgc3Vj
aCB0cmFuc3BvcnQgVlEiIHRvIGZ1bGx5IHF1YWxpZnkgaXQgYXMgdHJhbnNwb3J0LA0KQW5kIHRo
YXQgd291bGQgYmUganVzdCBzdWItb3B0aW1hbCBmb3IgYWN0dWFsIHdvcmtpbmcuDQpBbmQgaGVu
Y2UsIEkgd291bGRu4oCZdCBjYWxsIGl0IGEgdHJhbnNwb3J0IGFueW1vcmUuDQoNCj4gDQo+ID4N
Cj4gPiA+IFRoaXMgY2FuIGFsc28gYmUgdXNlZCBmb3IgZGVidWdnaW5nIEkgdGhpbmsuDQo+ID4N
Cj4gPiBBcyBNaWNoYWVsIGxpc3RlZCwgYSBkZWRpY2F0ZWQgZGVidWcgaW50ZXJmYWNlIGlzIHVz
dWFsbHkgbW9yZSB1c2VmdWwgaW5zdGVhZA0KPiBvZiBpbi1iYW5kLg0KPiANCj4gV2VsbCwgSSd2
ZSBzaG93biB5b3UgdGhlIGluLWJhbmQgZmFjaWxpdGllcyBsaWtlIGRlYnVnZ2luZyB2aWEgZXRo
dG9vbCBhbmQga2VybmVsDQo+IGhhcyBhIGxvdCBvZiBvdGhlciBvbmVzLiBJZiB5b3UgaGF2ZSBl
dmVyIHRyaWVkIHRvIGRlYnVnIGluIGEgcmVhbCBwcm9kdWN0aW9uDQo+IGVudmlyb25tZW50LCB5
b3Ugd2lsbCBmaW5kIGhvdyB1c2VmdWwgc3VjaCBoYW5keSBpbmZvcm1hdGlvbiBpcyB3aGVyZSBv
dXQtb2YtDQo+IGJhbmQgZmFjaWxpdGllcyBhcmUgb2Z0ZW4gZGFuZ2Vyb3VzIGFuZCB1c3VhbGx5
IHByb2hpYml0ZWQgb3IgZXZlbiB1bnN1cHBvcnRlZC4NCkd1ZXN0IGRyaXZlciBjYW4gYWx3YXlz
IHJlYWQgYW5kIHdyaXRlIHRoZSBkZXZpY2Ugc3RhdHVzIHdpdGhvdXQgYWRkaW5nIGEgc3VzcGVu
ZCBiaXQuDQoNCg==

