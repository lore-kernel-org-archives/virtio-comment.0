Return-Path: <virtio-comment-return-6171-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC6BBC7EE2F
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 21:50:30 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0CE4633099
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 21:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by host09.ws5.connectedcommunity.org (Postfix) with QMQP
	id F38092AFF8; Tue,  6 Jun 2023 21:50:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 487E9986583;
	Tue,  6 Jun 2023 21:49:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IYO5LT+/6OG+TvjojUxQ2tQUh+PRIZRgwX98sOpSbsy+0xVPBW+LfYGacqZPs/x2gRO7CoZIoq2BcJb3Q673ru7V0mZbbZjoUQvd8VICsaE6ZwYPKMP7KiTMfssgckTzn13NFr8xTDS6asbWU6LO/BUF31r7clIExa/a9XK3N3dL7DxoMo2SaEVuQgyzwOAY1ymgkC/62fjBTel72q/bSGIzg4upd7nWu2+ZTKdgzVmnlNg2S971c2Z6PRV5bHZH25Zw6U2l8xBofTo3bkzGFCfXlhzL738OeJKpjJ7QvnoqmgE8zzIhoP/wes+5kzRKepyd8E2THoIaJ8yjyOE9Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6vTfsFHHOmmF7WXpJFSNeEkI18JGBzM5Ffu9KpnibLI=;
 b=AiY4Kkr1Bci7VoKUdbpDnuizdkYvshT4/GJVPvtxrkYEhYf/GXWOHR3Lm+H8rJwxsgPjGZ3a9R8UfjbkbiNT0TfW5YQ1sv1qrdD9WYY6mW5k0ZmjlML/77LdqfxNuRtw34UHQEt1xVxcTrEs7ylal+NJSsUnuPQdPsekFwGexeS5TYJGxn4vkxpDPQY/rDhi11abFKakE7ODq8EeGEZoz/c3H4hWBLifkQjyfXKaajNsqODx/V/qyGHQ8jwsDlMQDDlT2acsTU6YXBRcGOzrethl85moNw2jCkKlZmHdcdUwAot8KMRDyjnDgqqF6yLIY0AFxIlEOoT3n3rvYmDqPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Heng Qi <hengqi@linux.alibaba.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
CC: Shahaf Shuler <shahafs@nvidia.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	"Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Thread-Topic: [virtio] RE: [virtio-comment] [PATCH requirements 5/7]
 net-features: Add n-tuple receive flow steering requirements
Thread-Index: AQHZlNTpsDXVjHsOf0G4vfVcY0pgc6923NWAgAABgBCAABCDgIAGxrQAgACeYKA=
Date: Tue, 6 Jun 2023 21:49:28 +0000
Message-ID:
 <PH0PR12MB5481FEE6DF87BCF2D44BF311DC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230601220305.587034-1-parav@nvidia.com>
 <20230601220305.587034-6-parav@nvidia.com>
 <a471e048-b492-eb04-608d-4312da4d0b09@linux.alibaba.com>
 <PH0PR12MB5481647B8D459F5594756C93DC4EA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <9afe0f6a-1a15-a200-b96d-385d3f69a375@linux.alibaba.com>
 <20230606120830.GA28580@h68b04307.sqa.eu95>
In-Reply-To: <20230606120830.GA28580@h68b04307.sqa.eu95>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA1PR12MB8554:EE_
x-ms-office365-filtering-correlation-id: 505d8ed4-90d7-4c3a-7fb3-08db66d7e6e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 d/7Wwr9CR8pWoFLnPWPH7K90PU1DFwR11rlhsWIGvU20c90B12Rb+zXjLb3r9oVWluNezcDi1tCw3kFbIdmAG20YlHXAtimMck8EMoL6v3ue2l51i9JFuACIFZZI1F9Y9SMSO+KuxtAVR6KVqgyCj4MB4oVWmCBv9lwOpx8MlVqXQ6GPa8O5P2Vv+S5C04z+EHcKJ3TsRHnYou1JYZaGlkXEDROeIxFXPm5dzaCes/ZJuGY/q+LedQmuWM6zvQYWM8dxqPHfp2R8Bf3Gyee4gkXxbA0u3XKtE8u+0vbJQwuU+wY3t+l80JQzdAKHqB72zdeTlOqo2bLgftaUAYFxa7irccwoKT4mfQ7XlN9/z3LGcoPWM9wgnVY1J+M5yoDo46/ikkLxnnoJXC6W6z80xFjwH/+eVa2FPB5IrQaMokt99XhK1Jz9RnsXXeCOx6nJN4hnexyn5kibJFKlUCuwn7dSCxz1szg1Gz2a7AiIHgWY5Po0jigIcdSlmWVoY/SfiRbprE1HST1AFulLR760mXypiq5TedbH7+6pVPusOKG+zHhQ8K6G2lFn1hOG4CRplMf8e1nfb/LQKX3vcJXdWa4iTIdh4W7iccUTacNDUf3IuGMdGE7Elf3fJvtGcoiW
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(451199021)(478600001)(5660300002)(38070700005)(52536014)(54906003)(110136005)(8936002)(71200400001)(8676002)(316002)(76116006)(122000001)(66476007)(66556008)(66446008)(64756008)(66946007)(4326008)(41300700001)(38100700002)(2906002)(55016003)(33656002)(26005)(6506007)(9686003)(86362001)(186003)(83380400001)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OUJLSHZzeWVmd2ptZXQvMTN6clh4TkNFYlVVd2dSUG5tQnRTcVp2VDhkNjgz?=
 =?utf-8?B?RFN2UFJ0OFVVNGxmYTRHdzdqVTZpMFl2ZEF1alhWZ20rRlFwRTI5bHF3Y3ZZ?=
 =?utf-8?B?QnJVT0VjeFJLQnFrMzloYUVWNFBVMHF4am8ya1p4UkJ4b08wR0tGT2Jhb05H?=
 =?utf-8?B?YzBBbXE5YlFVaUYwekJLSFYxZlAzaXg5WlFtQ0ZuSkxGbll1V21aZVl5Qm81?=
 =?utf-8?B?WFV1enE3TkhDdFFiM2FURUpNZ2RmSWJ4dW1jaS9salNpK1BuY1pXa1VMWWs1?=
 =?utf-8?B?MDVVQmg1T3lCZzQwTFJSUzF6ZnhtV2JIbEtKSkJkU1o1ZXJXMXlhQ3ZDY2Vk?=
 =?utf-8?B?eDZHRXQzOG9NRGJMSnQ4d0FQRUM4RU52dzR5MFRQZytBaGN6ejBxMWVaOXpj?=
 =?utf-8?B?azhXbzZsckYyL1lWSjN3TW95WER6UlZhUEpsR1VRcnU2dUhIQ256WUlpRnJ4?=
 =?utf-8?B?OG91TS83ZDVWSlVNd3JHcGJ3SGtuRXByWUhOYkJyWmtTTWpLV25DanZXQlNP?=
 =?utf-8?B?THVPeXF4V29RWHhEcE9ZWjg3U25yMzN0Q3V3bldDeHYrZWFjeGJUOFV6NmNo?=
 =?utf-8?B?T2lxTlEyZFlSQ2ZsU2tPWXRFMU9MbGgxbVd0SlNXcFdIaVkzd3VBYWRNQzRL?=
 =?utf-8?B?QjhtNlg4K0pGR1ZYeVVKU3JYWWF2b0RMcTdNak9pc0VXQ3lvTUFNM3cyNHlU?=
 =?utf-8?B?Z216ckxLYVFLYllUV0pZUlpIMmMyNWoyVU5hbjhSNVVUNTA1M01QS2JoVDRz?=
 =?utf-8?B?b1pJQ1R3cUJydVhESlI0WWNCYWFweWc0SDRGaSt6QUVudThsaTNNSTZnWGhV?=
 =?utf-8?B?VTJGSEVMQWpKaTYrRDRXY3lmc1M4RHdXWUY0eTNUZllIbEdHNnlmRU5ac0k0?=
 =?utf-8?B?UHdodVVmUS9mTmNOQXRzSG41K1NmRm9XVTZORllod3d3cE9BOFExWXlGMXpC?=
 =?utf-8?B?YXVCSEdQMFZrY3FuTFMxOCtOb1pRdnNZZjVEMlhtSkxJZDQzRzJHenhrOWZp?=
 =?utf-8?B?VkhQeDlaZWY2S1FFSDUwS1pUcmVNeCtTczlJcVhSM2t3bFBiaG0yODlBTnlY?=
 =?utf-8?B?U1htbnFWZ1BhU2x2ZUZ2anl3WlZ6MXh1Z2gyelU3V2tTMGZIV2d1N0ZOcjFk?=
 =?utf-8?B?cU50NUw5SXd5bnJ2QXA0OStUemE2OG0xZmJtdHdWcnpQTTd0SE9mQmN1OStm?=
 =?utf-8?B?aEFiTVovV3AyUFd5SHphb3RJdmUzcFRjc2RPNWdhdDJwRlJSY3NOOGtGcW0v?=
 =?utf-8?B?Z1BGYjZMcFpzU3BWcHlVVFlUZ2Vab3VSaytNLzZURENLV3p4M0EyVHY1Q0tu?=
 =?utf-8?B?LytEbEpzMXV6TkFpa0xlcldYRGdYVlVvUlB3MDI3QkZxSUwrYzUxUVkwNmxl?=
 =?utf-8?B?T1REWU03YjNyV01JL25vVFlWVDFjV3J4OW5MbWJOR3E2bmptR1ZsQS80UVFL?=
 =?utf-8?B?b281VjhOSUpzQXA1VkN3ZmhwTy9QYkEzSzk4YkdKVlczVVlhQzdwcmRvNU5P?=
 =?utf-8?B?NTRxSm1VWi9hUTdPdUNZK0gyMy8yWEQ4MEFIcThidkNRbFpxdzRjZU1GT2tw?=
 =?utf-8?B?S0xlUDNUZENROFB3bFQzcERHZUVaMHMzdGlxUnRkNGc5SW1PVyt0czhWcGJX?=
 =?utf-8?B?M2g2cEVlSENodEJuMXNrcEc1WXFyT2xjQVRyV1gyL1Y3cWgxUDVhamp1M1NH?=
 =?utf-8?B?ZlIvRW1VVzN4ODhBM1RGNDFLQWl4SlArZlN3S2g5MmlEY1MwZGk5S1hycHlQ?=
 =?utf-8?B?OS9NUjlxU1UzTTB4b1dnZEdXU0EveUlzaVl4bUZJWHVOTXkwWWIwRnZ1TWpQ?=
 =?utf-8?B?RnloOVl4QmptcXozcmlFeEI5djd1OXVmR3cvdmI3SmtaQ21KSkhaUFBqQzZW?=
 =?utf-8?B?VDJpUGs0bFFPWVNvek5HZlUzUi85R0NjL0JHaFFOZ1NhclRFaW5lUlh6Y2ln?=
 =?utf-8?B?NGdsRVljNlE4TCtrbGhTb0FHeUJZYlZQeGRmL0l5dmRIYU1tUVFRNVNVRUVh?=
 =?utf-8?B?enVmRHB0QSs1ZnhkR1Zzbkw0WTliKy92b20vTXB6azNISVZ4cFdybjhMN0R3?=
 =?utf-8?B?bnhIckdpNmdkRTlUeW9pdXpINSs0N1dIUzdwcHEvM0Y4U3RnaXJhT21ka01B?=
 =?utf-8?Q?7mDA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 505d8ed4-90d7-4c3a-7fb3-08db66d7e6e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2023 21:49:28.0281
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5WfTb5DFvnuuUTxzQ135SKl563hChOqXGeCRHInLLP2g9vjO/9ESx2wN8zSYQQEi78WkyZGCEiwNAHUdRZYxdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8554
Subject: [virtio-comment] RE: [virtio] RE: [virtio-comment] [PATCH requirements 5/7]
 net-features: Add n-tuple receive flow steering requirements

DQoNCj4gRnJvbTogSGVuZyBRaSA8aGVuZ3FpQGxpbnV4LmFsaWJhYmEuY29tPg0KPiBTZW50OiBU
dWVzZGF5LCBKdW5lIDYsIDIwMjMgODowOSBBTQ0KDQo+IA0KPiBXZSBoYXZlIGFscmVhZHkgYWxp
Z25lZCB0aGUgcmVxdWlyZW1lbnRzIGludGVybmFsbHkuIFRoZXJlIGlzIGEgY29tbW9uDQo+IHJl
cXVpcmVtZW50IGluIHRoZSBjbG91ZCBzY2VuYXJpbzogYSB2aXJ0dWFsIG5pYyB3aXRoIFNSLUlP
ViBjYXBhYmlsaXR5Lg0KPiBUaGUgdXNlciBvZiBhIHZtIHNwbGl0cyBpdCBpbnRvIG9uZSBQRiAr
IG11bHRpcGxlIFZGcywgYW5kIGVhY2ggVkYgdGFrZXMgc29tZSBvZg0KPiB0aGUgcXVldWVzIGZy
b20gdGhlIFBGLiBFYWNoIFZGIGNhbiBnZXQgaXRzIG93biBJUCBhZGRyZXNzIGFuZCBtYWMgZnJv
bSB0aGUgUEYuDQo+IA0KPiBIb3dldmVyLCB0aGUgZm9yd2FyZGluZyBjb21wb25lbnQgKGhlcmUg
aXQgY2FuIGJlIHVuZGVyc3Rvb2QgYXMgYW4gZXN3aXRjaCkNCj4gY29ubmVjdGVkIHRvIHRoZSB2
aXJ0dWFsIG5pYyBjYW5ub3Qgc2VlIFZGcywgYnV0IGNhbiBvbmx5IHNlZSB0aGUgUEYgKHdoZW4N
Cj4gY3JlYXRpbmcgdGhlIFNSLUlPViB2aXJ0dWFsIG5pYywgdGhlIFBGIGlzIGJvdW5kIHRvIGEg
Zm9yd2FyZGluZyBjb21wb25lbnQpLg0KPiBUaGlzIGJlaGF2aW9yIGRvZXMgbm90IGFmZmVjdCB1
c2VycyAoc3VjaCBhcyB1c2VycyBpbiBjb250YWluZXJzKSB1c2luZyB0aGUgVkYsDQo+IHRoYXQg
aXMsIHRoZSB1c2VyIHNlZXMgYSByZWFsIHZpcnR1YWwgbmljLiBIb3dldmVyLCB0aGUgZGF0YSBp
bmNvbWluZyBhbmQgb3V0Z29pbmcNCj4gdGhpcyBWRiBuaWMgbmVlZHMgdG8gYmUgZGlzdGluZ3Vp
c2hlZCBpbiB0aGUgZm9yd2FyZGluZyBjb21wb25lbnQ6DQo+IA0KPiAxLiBXaGVuIHRoZSBwYWNr
ZXQgY29tZXMgb3V0IG9mIHRoZSBWRiBuaWMgKGZyb20gdGhlIHBlcnNwZWN0aXZlIG9mIHRoZQ0K
PiBmb3J3YXJkaW5nIGNvbXBvbmVudCwgaXQgY29tZXMgb3V0IG9mIGEgcXVldWUgb2YgdGhlIFBG
KSwgdGhlIHNvdXJjZSBpcCBvZiB0aGUNCj4gcGFja2V0IGlzIHN0aWxsIHRoZSBpcCBvZiB0aGUg
VkYsIGFuZCB0aGUgZm9yd2FyZGluZyBjb21wb25lbnQgZm9yd2FyZHMgaXQNCj4gZGlyZWN0bHk7
DQo+IA0KPiAyLiBXaGVuIHBhY2tldHMgYXJyaXZlIGF0IHRoZSBmb3J3YXJkaW5nIGNvbXBvbmVu
dCwgdGhlIElQcyBzZWVuIGJ5IHRoZQ0KPiBmb3J3YXJkaW5nIGNvbXBvbmVudCAodGhlIElQcyBv
ZiBhbGwgVkZzKSBhcmUgdGhlIElQcyBvZiB0aGUgUEYuDQo+IElmIHRoZSBmb3J3YXJkaW5nIGNv
bXBvbmVudCB3YW50cyB0byBkaXJlY3QgcGFja2V0cyB0byB0aGUgY29ycmVzcG9uZGluZyBWRiwg
aXQNCj4gc2hvdWxkIHVzZSB0aGUgZmxvdyBkaXJlY3RvciBydWxlcyB3aXRoIHRoZSBWRiBpZCBp
c3N1ZWQgYnkgdGhlIFBGLg0KPg0KPiBQZXJoYXBzIHRoZSBhZG1pbiBxdWV1ZSBjYW4gYWNoaWV2
ZSB0aGlzIGNhcGFiaWxpdHksIGJ1dCB0aGUgZmxvdyBkaXJlY3RvciBydWxlDQo+IGNhcnJ5aW5n
IHRoZSBWRiBpZCBoYXMgYmVjb21lIHRoZSBldGh0b29sIGFuZCBrZXJuZWwgc3RhbmRhcmQsIA0K
VG8gbXkga25vd2xlZGdlIHRoZSBlc3dpdGNoIG1vZGVsIGlzIG5vdCBwYXJ0IG9mIHRoZSBldGh0
b29sLg0KSXQgaXMgcGFydCBvZiB0aGUgdGMgZmxvd2VyIG9mZmxvYWRzIGFuZCBpdCBjb3ZlcnMg
ZmFyIG1vcmUgdGhhbiBqdXN0IF9mb3J3YXJkaW5nXyBydWxlcy4NCg0Kc28gd2Ugc2hvdWxkIGJl
IGFibGUgdG8gc3RlZXIgdG8gYSB2Zl9pZCB3aXRoIGEgYWJzdHJhY3Rpb24gb2Ygc2F5IHN3aXRj
aF9wb3J0X2lkIGFzIGZhciBhcyBzcGVjIGlzIGNvbmNlcm5lZC4NCg0KVGhlIG1haW4gZGlmZmVy
ZW5jZSBpcyB0aGUgdHlwZSBvZiBydWxlcyBlc3dpdGNoIHZzIHRoZSBndWVzdCBkcml2ZXIgYWRk
cyBhcmUgdmVyeSBkaWZmZXJlbnQuDQpCdXQgeWVzLCBib3RoIHNob3VsZCBiZSBhYmxlIHRvIHVz
ZSBzb21lIG9mIHRoZSBjb21tb24gaW5mcmFzdHJ1Y3R1cmUuDQoNCldlIHNob3VsZCBjb25zaWRl
ciB0aGlzIHJlcXVpcmVtZW50IGluIG1pbmQgYW5kIGNyYWZ0IHRoZSAiZGVzdGluYXRpb24iIHRv
IGNvdmVyIHRoaXMuDQoNClNpbmNlIHRoZSBmbG93IGluc2VydGlvbi9yZW1vdmFsIHF1ZXVlIHNo
b3VsZCBiZSBwcmVzZW50IGluIG9uZSBjYXNlIFBGIGFuZCBvdGhlciBjYXNlIG9uIFZGcywgd2Ug
bGlrZWx5IG5lZWQgYSBkaWZmZXJlbnQgcXVldWUgdGhhbiB0aGUgQVEgb3IgZXhwYW5kIHRoZSBz
Y29wZS4NCg0KV2Ugc2hvdWxkIGNvdmVyIHRoZXNlIGluIHRoZSBkZXNpZ24vcmVxdWlyZW1lbnRz
IGZ1cnRoZXIuDQoNCkkgd2lsbCB1cGRhdGUgdGhpcyBkZXRhaWxzIGluIHRoZSB2MS4NCg0KPiBz
byB3ZSBjYW4gdHJ5IHRvDQo+IGluY2x1ZGUgaXQgaW4gdGhlIGZsb3cgZGlyZWN0b3IncyBhYmls
aXR5IGZpcnN0ICh0aGlzIG1lYW5zIHRoYXQgdGhlIGZsb3cgZGlyZWN0b3INCj4gaXRzZWxmIGNh
biBoYXZlIHRoaXMgYmVoYXZpb3IsIGVzcGVjaWFsbHkgZm9yIHRob3NlIFBGcyB0aGF0IGludGVu
ZCB0byBsaW1pdCB0aGUNCj4gY2FwYWJpbGl0aWVzIG9mIHRoZSBWRiwgYW5kIHRoaXMgYmVoYXZp
b3IgY2FuIGVmZmVjdGl2ZWx5IHN1cHBvcnQgb3VyIHNjZW5hcmlvKS4NCg0K

