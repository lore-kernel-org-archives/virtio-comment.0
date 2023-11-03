Return-Path: <virtio-comment-return-8144-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07635C4332F
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 11:35:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3ADA22A88B
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 11:35:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0A28C986C42
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 11:35:34 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DA858986C32; Fri,  3 Nov 2023 11:35:33 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 17CF7986C33
	for <virtio-comment@lists.oasis-open.org>; Fri,  3 Nov 2023 11:35:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d1U4CKMfLbf3y6mTfotqT7lHZNOSLZ66TqIhSMz6vmMaRYOB+FNUQfkymfi80ry2HOZ6dKroQsBp37kzViEr1RFWZydPgzhvZd+sHuIEEMA5bUnUmxIUS5PdDK9ew3Pb3IAezANk5GSjYEjJ8E5Y6oFt6NOBaUUrK1RXPGhI4K5AsxixMzYNJ+oDv93owC2X0k7wKzlG9PocOVyC0kDoqYeq5d9xwhJUy3rDFGEv+//i22Tupcl0y9hFqTPnypWeobz2DAFQBq4BtTgdctHv0oXSCWj8f9PfM7P+A3LfcdUeZ+YCMamwIeeSIiloyHHBRs+4k6G48W0TFqs6Rlf+mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ehX+h6aXSEZSIouruCsdB/TCEzUQSxmwWbMciBgnxgY=;
 b=FQL3N/vceBIIv448+ekJ6NS4fgS0kC18zKxmJZMd31csOG/MjGZSya66R8EcWTmipwmoanj1tfNOZG94B8rZGOqdaPrWamlock6TUFE/BadHfjX4LOAlfIHVkK4aCsA1yPKMABicCAY5hID6xeiWEJQMsTY5rWjfLkx/YN3qXVaRF8rWgLlk8te+qzxB/RUFCTn/wx5/RPM2HCYPvq6iA4fS0m9LlOYXQlDxZYc8pvTKldKfD1Kvfqpjm8lJDg069tue0FiiFoejOImIz/EWc/vD7o0y1yLrBwTQDj6tG/8E8U1U5501j9VD8BhNo2U4CqbrDjXikY7xgCYv7uyO6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Zhu Lingshan <lingshan.zhu@intel.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "stefanha@redhat.com" <stefanha@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
Thread-Topic: [PATCH V2 5/6] virtio: introduce dirty page tracking facility
Thread-Index: AQHaDkFnG7OmMYYZHEavOdLuyr0R5LBoa6Pg
Date: Fri, 3 Nov 2023 11:35:00 +0000
Message-ID:
 <PH0PR12MB54811A05FDE5F20FBC7DC268DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-6-lingshan.zhu@intel.com>
In-Reply-To: <20231103103437.72784-6-lingshan.zhu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|BL1PR12MB5755:EE_
x-ms-office365-filtering-correlation-id: a79a0198-d7d7-44f9-a74c-08dbdc60ea3f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 aCDYwl7f/AlI6WgqdrfznINLU+ubALvp0pT5uzK9Pr4TUL+00IOoUrpfUWKjqf/EAlofxpLJcMiOaeRy95WaF8Ue80S/8Xvr15yUHp4OlAWYc2WpSdsYA3k6UCi/oiqMXbmmeqTJ1dthkkHQPwL78vyqmJJHkRxfGpTbVheP+33ER4AAc5AxAVhphQ+ru7/7k47n99jlXuuOgl6lMiE2UT6Y3R/xed3wOR6ReqJAOTkXE8tofPGCNLqPVT6WzzEjc5QN8GkdufEWUYayak0pP85PiJdzuUjrPZUoC+ldvg2WlQXU4hNrNlEwV9JotWMzPNTlROjcIqyIJO4dVpiIuVuFenfVnSOUy6TU2HN5Jz6UajQ8tnzfk5z5fQPi9m+H5aYKs8u3l9u7bxa62HM6/cW4rrpwvc9wn6n2icVtR/l81435DEis6yMP0LkAJW/FT8qC5SATmIRUh+hooAaQNqqzy23dGzlaFZJ7PsctBlOmHyf1djL7dJUqDhv02BgxVpMn0Ybriipx//uzz2w8v6icO2kpsnbRcB3GIyZ6lkuVG85u5lsNck9gT1i2IrCBe6cfB4hWWA8KAEde3cxun0KVjt/WC1hUpL138MJb/PEQDnf6eHhC84GPP6I/+mQdOp1ojmHF8U3/iPIvxiWAHw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(376002)(136003)(366004)(39860400002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(38070700009)(55016003)(66946007)(66476007)(76116006)(66556008)(66446008)(64756008)(316002)(110136005)(86362001)(38100700002)(33656002)(122000001)(9686003)(478600001)(26005)(6506007)(71200400001)(7696005)(4744005)(2906002)(41300700001)(4326008)(5660300002)(52536014)(8936002)(8676002)(14143004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NVl6bFgxSUVVU1laV1pCeHZzamRHcTF6Y3BjSkc5UExPV3g2eDBQWDVncU9M?=
 =?utf-8?B?Y1VGcVJ1d2tyU2FOTVFmSlVuVi9ZWGtZNWJrOGJsSWRnNWhxbWVtc1pSeitJ?=
 =?utf-8?B?djA1K1hrd0dGS2Rid1pGUGtxdnk4ZEpKUlNISzl4cUh5R25TSWhzSVNtSzZ2?=
 =?utf-8?B?NGtjMHhGZk1WVjZUUkFBQmdOWElhbjU5YXBnemZFT0N3eWdSV3pJZnpIeTNq?=
 =?utf-8?B?bzJTT1l3WTBoYTNYdmI3cGtYTFVWL0xBdms4YlpnRHdMN2FnRHNLdG1WQVdS?=
 =?utf-8?B?eitFYllCVE1qZll4WGh1anN4RVA1SlJNSVh5N253azZOcXFEeFhCMXRkTnY1?=
 =?utf-8?B?UnBmaHRvSE9BSURxSHRZZXduTU1lRmxmUmtBbzVDYzZtdmtTcDVnNmlCUWov?=
 =?utf-8?B?d0Z5am1uL0U4MWhwUUdVQktmcGNRNWI2citMbHAvT2grSmpMTDdQZ1dnU0VI?=
 =?utf-8?B?ZXhzYTlQMkJDRFc2aldLaFJkRVZ1dnljUldlWmlVZzRXRDJTUnhYVVJncmZp?=
 =?utf-8?B?cTFEMW5QOFRyUWVqbWlSUDR1bEFZQVpLZHMzcTlEcnJxMGQ0cDZobGpINC9G?=
 =?utf-8?B?bWtTN0srRXZHazg1MmxVV0g4ZjA3SkluK2RVdzY4K0s1QytRdDBjbGlNbTA2?=
 =?utf-8?B?QWEzeGcyMy9Mc3RNWi90NnA0WDdQVUlPVUJUK0hwRzhNdnRmQjdJOWFXRmNI?=
 =?utf-8?B?L3NpbldLNEd0Q3VXSkt2aE90MEtCeGNVLzRCSEtvRlB5a2dSZE9RYWViSE16?=
 =?utf-8?B?aXVrN25OZzE2LzdGanp2azZQM1NoTiswNlhLV3kzQjdRTFBrUHFOQ2trUFVt?=
 =?utf-8?B?U216aXZ1cmJSQWVQZHBHVGFvOGV2UFZrcXNYTkp1ejNQdmtpZWpYSm9VT0dF?=
 =?utf-8?B?dU5JTUh1NlhjcGpuZFpnWVk2TjVNaFduWFNmcGNUUzhocTNBcEtKUkJUVDkw?=
 =?utf-8?B?RU1SeFBCaHhHaWk5OTB4bm11ODhLd0NxTEh6L2pkUVgxRzhYQU90QXdxMmRP?=
 =?utf-8?B?RHhLNkZmVGZTbVNwbE82OTJXZjVhQWxtSXZmZkRiRmhLZWROZHZrYU0xNTJL?=
 =?utf-8?B?S2hDekJ2SVZYU1hJckVkOFFWWi8zc1R6Zmg1YVZPYUlqN0grS1FmMUx1TFA3?=
 =?utf-8?B?bFlmT2JMTFBHbG9SKzBuU2dKVVMyL3ZXT0J5QllKaEgrQWJHSnRWcTVIejRR?=
 =?utf-8?B?SzJIUUlleFpCNlRycUR5QlJOVjFiV0FoTEF5Q2pscW91UFpNaTJRSmZ2UEtD?=
 =?utf-8?B?ZDFxWlZSUFlsYVBHK0l5ZVU4NUYrU2RGd2Mrb2orYklRQ1l2TTQxMXg2UWRq?=
 =?utf-8?B?UzloeU85MWJDbHdQWTNSVXlSSFZONFh2S1lhNXFPY1JtVUIvZG9LNHBVcERN?=
 =?utf-8?B?c2dleXdhS0ZmN2FLYUVtOVgvZE8yZFAxdkV4d095OCtFc3YwSTRVaHdaOHRW?=
 =?utf-8?B?Q2YyL1JUalUvdDhKZGdxOHlDMHBHYng2bnB4eHFobE5YMTUrUFJjamZUaGlv?=
 =?utf-8?B?NDdpamNzVXVod2pBN1VLWVhCT0dYenc5OXZ5WjR3ZWFTeDlzMXhhNjF4MDJU?=
 =?utf-8?B?R3ErWVcxWnlwRlhMYW5jbjJiRmtsd3pqYkRlN1VVWU5xYkszV0hKTWcxbFMx?=
 =?utf-8?B?S09HWG95dUQyUFZUWEhxNDI5WlcvYlNNUnY0VC9OUlVUd1lNWTl4dXpNaVZ0?=
 =?utf-8?B?V2ttTnFaQlFTVUk2b1RFZThEQXlnUFFGUnA5VXRKeEZPQkF5b3dwMUR2cXBT?=
 =?utf-8?B?MjRWMGJnUlYxcTFTTWU3K2V1K1hXYTZmMWJwaGpaVDRweDdrUWl6V0VNMTJ6?=
 =?utf-8?B?UHJNT0NOSURoN2lTTHJRSXgvQVcvTnE1YXhPdURaY2paeTdqWXBEdTI5WFkx?=
 =?utf-8?B?WFU0WjYwVlJTalp2dUNVRWpRLzdMMkJwbFU2c3d5ZmxhL056TDkrTDdBdmtS?=
 =?utf-8?B?d1k1MW5CaExvUllOejJOZGR5dWdNWjJMM1NKKzBOMnBGZXRVRThyMGFGbWJk?=
 =?utf-8?B?ektrWWJqdElhTWEwZ3NRRzFGQit0TWxYazVsVzdYYTRQRk9HT0pwYjc5emRq?=
 =?utf-8?B?UzZ4KzNPWGdKa3ZjYXl3TTNNZCtzNkVuM3B6UVVESVFhNHl5V0ptK2dMM0ZZ?=
 =?utf-8?Q?gdkw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a79a0198-d7d7-44f9-a74c-08dbdc60ea3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2023 11:35:00.7542
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a/nbvbghsfhd7X7vtQlEkwuOasJdJQ1CTV0E/Izq6SeWSFy79gaslcNvpgZydf9/SUduY4icl9IeOJ+XgnyGaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5755
Subject: [virtio-comment] RE: [PATCH V2 5/6] virtio: introduce dirty page tracking facility

SGkgSmFzb24sDQoNCj4gRnJvbTogWmh1IExpbmdzaGFuIDxsaW5nc2hhbi56aHVAaW50ZWwuY29t
Pg0KPiBTZW50OiBGcmlkYXksIE5vdmVtYmVyIDMsIDIwMjMgNDowNSBQTQ0KPiBUaGlzIGNvbW1p
dCBpbnRyb2R1Y2UgYSBuZXcgdmlydGlvIGZhY2lsaXR5IHRvIHRyYWNrIGRldmljZSBkaXJ0eSBw
YWdlcywgYSB0eXBpY2FsDQo+IHVzZSBjYXNlIGlzIGxpdmUgbWlncmF0aW9uLg0KPiANCj4gVGhl
IGltcGxlbWVudGF0aW9uIG9mIHRoaXMgZmFjaWxpdHkgaXMgdHJhbnNwb3J0IHNwZWNpZmljLg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogWmh1IExpbmdzaGFuIDxsaW5nc2hhbi56aHVAaW50ZWwuY29t
Pg0KDQoNCj4gU2lnbmVkLW9mZi1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4N
CkluIG15IHNlcmllcyBvZiBkaXJ0eSBwYWdlIHRyYWNraW5nIChha2Egd3JpdGUgcmVjb3JkaW5n
KSwgeW91IGtlcHQgaW5zaXN0aW5nIHVudGlsIFRodSwgdGhhdCBpdCBpcyBvcHRpb25hbCwgYW5k
IHBsYXRmb3JtIHdpbGwgZG8gaXQuDQpXaHkgZG8geW91IHByb3Bvc2UgdGhpcyBmYWNpbGl0eSBu
b3c/DQpDYW4geW91IHBsZWFzZSBleHBsYWluIGFzIGNvbW1pdCBsb2cgc2F5cyB0eXBpY2FsIHVz
ZSBjYXNlIGlzICJsaXZlIG1pZ3JhdGlvbiI/IDopDQo=

