Return-Path: <virtio-comment-return-7822-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 849DDCDB483
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 17:10:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CB4C97DD69
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 17:10:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B380B9868B4
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 17:10:02 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9ED129868AB; Wed, 18 Oct 2023 17:10:02 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8DAF89868AC
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Oct 2023 17:10:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kh6+f8L7jrKq17QmF0bSTSLTbW7zQJ9kBIudtIvRkowyDLfWgLk+VlUUt30wGTjpB1MVnM2XU8d38d3zOHyBBCmKgRHhIpNA82TIlTrM9zlTMwtZ5kRHHoeRmeGbVZhLP1SiuyFw2lGs2tv+ALOC5L5q5ZsKUxi0GphY/Xmti7mhX3Rl2hya1Y8ClzGhTVoshdG1Esdy1qCm+Syvn0foh81xt1jOXAFC/BeTt/QrdkRmVfkAAtxw4HFhn+aGquYlxlHgQWwzx8wpIEXDtSopF2sXbcRYn1JlZSttVXhHx4GDkxBpV3siXu1q5iDeuWAoVOZxYL86giLs90ugKQ2how==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L1SWwhnVxMY3/gH+2XwgXy0KS5UbtmLDuksZyTp5nX8=;
 b=AKDKryJb7Tm6WlEuWHaObP3jspVJy5UpMjrlKhBr+CaP1vRU86Zw59Qdw99XHtaQDGH2tGi8FQR/VTZGm2GaiFf3dTbANJ5Fv7rwnxuPQB/gpWtUmKm4AaX+LJ4boKUIOHxvK5WT5uUFGO5mHS1Ln7GsLm9egJYCM9w/BrBcMhBj/0jwNFVKvCzEU8G4GLDwMjdbWpCilIMeaegZL1//F2K43dEYTSpt+cVwuIjx7+0AI4G/7Z7w8ZO3x4qW3XTjER8CjQRrYyFyRtfH92ZwL6logdbMsvQV56eale0mSwipeJaZtr/5vAtGz6T9qKwc7srdKD1DZeNSNiedzuBZdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Peter Hilber <peter.hilber@opensynergy.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
CC: Cornelia Huck <cohuck@redhat.com>
Thread-Topic: [virtio-comment] [RFC PATCH v2] virtio-rtc: Add device
 specification.
Thread-Index:
 AQHZqzWn01mUtnPGCUaCuESJ+zAzFa+nCBEQgCaJjICABcqYEIAHKR+AgBoD7sCAJGLqgIAS3pNwgAbnOwCAApCdYIARXF8AgAFYInCAAIbcgIAFiSGwgADKLQCAAOEKgIAAs4wAgAACEPCAAArGgIAAAkrQ
Date: Wed, 18 Oct 2023 17:09:58 +0000
Message-ID:
 <PH0PR12MB548184F98B9F300D17C06322DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230630092959.392381-1-peter.hilber@opensynergy.com>
 <PH0PR12MB5481F7AD21A871DE5660A948DC1EA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <b59a7dda-06fe-cff9-df61-b90aa4e50836@opensynergy.com>
 <PH0PR12MB5481BA022FC2CA834264CC47DCFCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <9da5f426-0099-8b58-bb24-fdbfeb02b4fc@opensynergy.com>
 <PH0PR12MB5481DDD6D022617D6F615429DCC6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <026c8242-7dae-4ee9-b9e9-bb52af07c063@opensynergy.com>
 <PH0PR12MB54815BDBEA7E4DE1074B167DDCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <0c7bec47-8a21-4a1e-80e9-43740a72d427@opensynergy.com>
 <PH0PR12MB54812437DFD91F0F3E3CFBFFDCD6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <5fd2682c-6479-4750-b0e1-d74070453b31@opensynergy.com>
 <PH0PR12MB54816E8AEE2AE89148076542DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <6d6f0c19-9a08-4b1f-9796-bf9c1ce09eb8@opensynergy.com>
 <PH0PR12MB54812685ED1723B7049FF6E4DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <520b95c5-0295-4d36-85cd-48e5021f0579@opensynergy.com>
In-Reply-To: <520b95c5-0295-4d36-85cd-48e5021f0579@opensynergy.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DS0PR12MB6462:EE_
x-ms-office365-filtering-correlation-id: d64016e2-5ac2-4d35-b000-08dbcffd0f16
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 FpG9q3LCN1bSlFOZ2lokDqp+FgzvK3ruDhF9JfYIzzr/W4mlLuo56mwV+G95tPULgU6T1VZ0nLEclciIdmNqbs8Voje7RqcQLG29LoG6v6OBiaxlezRPOcMqG0bas1S3pAJbFCxi5yX9w8lKq+c3gAA/Fc5n5lt068TY+03wZ7PbmOUCIeVrOpJ9EARtbJ1yinv+mTPQN2UifYNQmEKfcQKbABUSWRuSNeb0ylyjJytRmo9b7FJXLN5aeTQ8pSXEFhc9t38K6ZaVMGVis1FL7If7qCspyQaj0nbYhg7Bd9vU6gwxwdF0LoApHKsHsa3rA56HXEYrLhUQsLj4bTVZUA0buxPTmzw1+vWYoIITXUkGuHm4SIXDIbzjPKnBasuwJsddMHS6QJXRxkZwBu9pkC9qErWZP9bOAAUFG3U9EFxrzgXiZZOSeivmUBOMyI5gOqeIAq68ppkn5yvY8R3JbwDY8DNGZLqUlHjibDGOaO65byWViVSHYav6obVB5pZ+I+zL3duEG02ILn3Z2ylobW+EUNfalPHgXNl2At/u8P1JuUueEGbr3JcRigiAP8t4ntk/Afx4Nmq8dcKJmoNaB0a6hAAQfgdP1KMIjCPASp8bpDexkZ3CxIlj+L7v6Qs1
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(396003)(136003)(346002)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(55016003)(66946007)(71200400001)(110136005)(76116006)(478600001)(64756008)(66446008)(66476007)(66556008)(7696005)(38100700002)(83380400001)(9686003)(316002)(5660300002)(6506007)(122000001)(26005)(86362001)(38070700005)(2906002)(33656002)(8936002)(41300700001)(4326008)(8676002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QnlPQUthcTQwSXk4K25Yb0g3SmNqdU8xTmdUOHVFK1ZiMnpXbFVXVndLUkpO?=
 =?utf-8?B?U21BSWxtbjZHWjFRa0hVUnYwa0dhVHlTNGVGMnZVNnlCTk1LZDdXcGtOM1l5?=
 =?utf-8?B?V21ybnNabitvWFlIVVhha0Erdm1hRnZwTW0zcXBIdHdrUHh3bzRsNVBoOWdZ?=
 =?utf-8?B?Z3JTRW54eGZseUtLelcrekNEVlBKNEV4bWVjRS9jejU0eFd5eWU2SFNnaWxi?=
 =?utf-8?B?SWJoNnl4bVRNamNPUWtXaVA1clpaZWI3MUpmZVkrZHJHckhiS0ZmMjdBMDhp?=
 =?utf-8?B?NytLalVickNMbVpvd0FmaDQvYlMyVmZudW9aNkJWa2JKUWdGbEpGN0R5bENL?=
 =?utf-8?B?a1F6M0xDOHJJRThIVjFlZllxNDhBczhyemNRYythUnBkZ1pDN0hsRmp2UHJF?=
 =?utf-8?B?S2VOajJaTlNZZmZIZVNSOEM1QSt4cFB6KytLZis1bHUzKzVuM3JSL0NkNzEw?=
 =?utf-8?B?NEN2ZG1jT1Vpc3MyZS91clE5MnFNWHdmR2J2QnhtcE9ZY0xYUjZWTzEzZElO?=
 =?utf-8?B?MWNqYlpIMkFBYlNRMnJ3RnRXZVVrejJ1K0JlTFhhRm9KeHFoT1RiazNsWlhF?=
 =?utf-8?B?MjdydkxnM2prc09yY3JYOFA1TC9wN1VnU0xCd29VSW5qRk5DcWI1a0VUYURs?=
 =?utf-8?B?ZVZtRFJ0YWs5eTBDeFRUN0grem5NNHpleUFhd0FFTlJTaU9jTXdyWHV1RVRj?=
 =?utf-8?B?RjdwUjlCOThrTVZGK2RWRmt0NEVHN1dLM2luaHoxRUhRb2hnRUxjaEY4NU1h?=
 =?utf-8?B?YlFvNUpDNE9pTWIwOStmbFpBRGt6cWZ6UU9hY2RmcFZRbGYxL0VSQ0tJenhw?=
 =?utf-8?B?RWNwSG1lNHQrWTJac2cxejF5T2diZTl5dDVvQ21Ybm4veTFhOURiaWR6STlz?=
 =?utf-8?B?clErN3BQcGhDN25nWml4Ym5ZcUN1QlltaE5DellkOFZQR3pheWt2bXBPdFJq?=
 =?utf-8?B?M3RYb3p1Wi8rWWt3d05YSG5VdTZCZHZJMmRNUTVRK0QvanpHTkZJenVMaEN1?=
 =?utf-8?B?aitaeGIyNEhlWUJDUUFHSmR4TWdib3k3WHRiK3pDbjhIL21jK3crNnh0V3pW?=
 =?utf-8?B?ekozaDRlQnovNW5DaExwdlNBSHZHWWQ2dnVPekZzdE5oVkVGeFl2cGlReENM?=
 =?utf-8?B?bkRpbjlheG1sS3pzTE13V1FJYmRWOW0xTm1pMkhjWEtzVG5od0dLYitaTVpL?=
 =?utf-8?B?ck8xRnRKVXRGVXRMc1pTaEJ0MWIwbGMzM2Z0a0dLWi9IK0x3RnJrVTFEa3M3?=
 =?utf-8?B?b2R0NkQxZ3ZXaFFZQ3dWZmsweTNyckExVTJ3eWEyMVNJeXBPTVBjc2tuRDJy?=
 =?utf-8?B?S0VxdHVPVHJKME5GdHJGaFFuSE54WDVYdzlBeXBqUWhuUHlMZFZmbnYzVWdC?=
 =?utf-8?B?T2pFa3g4aGsvM2daRnUzeGVpdWxKY0dubkVuNTlweDI2WUhFV0tXekY2WjNo?=
 =?utf-8?B?djRBYjZCL2NaMm1zZDR3WWF3UzhYVmhEZXRzT1VkNUhsYWRxMitKay85ZHlO?=
 =?utf-8?B?eDZDNFA3b2NHcWwvSkg4QU9HbWFKdTFPZ1huTm1zWEczR0pHWUlINXVJRnl6?=
 =?utf-8?B?YkZnbDNZS283djZOZ2MvRENJTU5HSFZaYmFITDhjZUtudkM5ditTY2hXNWRQ?=
 =?utf-8?B?WnZvZE5zQ0ZxWUk2RnZxTTVOaDZFWThyNExxTUdGcDJOby9uV2VvZVdMSWtD?=
 =?utf-8?B?K2hsSDBvMWFqaWlRS1pDWGsvbldEeU15Z1NEUzREMGUzQ25JamY3RFkvQ0FO?=
 =?utf-8?B?bkZ3MFNnSzNRak00SGdBY1JXMFk5K1FyRmx3dTVPZ2xsdmNiVGNLN3lXWWdI?=
 =?utf-8?B?cElveHBFaDZYSnhBMU1jSldqSlNHWGdEM2hnVFVMYThTWC9WVElGd0paZ1dT?=
 =?utf-8?B?Sk5PN2tWNXFVbFJyM3BPRGFIamk0VFpaVnRpbTU2OGRTazBRT20ycjRIZ0RW?=
 =?utf-8?B?MTk3UnBEWGo4YlVDYnFaZXZnT1ZIVzBMaGp4RFFkNEpSamYzeGpTaXBBbVBJ?=
 =?utf-8?B?Zm5jSUlGaDRFY2VBdUpOVGJDRjRCMEtLY2k5TTQ3T1NBSkgwa3ZCSzMzNjBh?=
 =?utf-8?B?T2dza280SUROMGJyME95b0h2RmlnNERhOGRrckRsR1VGTXZMY29JSTV3a1pD?=
 =?utf-8?Q?ECB0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d64016e2-5ac2-4d35-b000-08dbcffd0f16
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2023 17:09:58.9301
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QfHcpa2qDFr7bJqJUfHnbDWIDd4Qqc8GXGClyBlKAH4pVsAqzCtd/huReMoYJDmtks8JktFIOrXk4Ulg8LA//w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6462
Subject: RE: [virtio-comment] [RFC PATCH v2] virtio-rtc: Add device
 specification.

DQoNCj4gRnJvbTogdmlydGlvLWNvbW1lbnRAbGlzdHMub2FzaXMtb3Blbi5vcmcgPHZpcnRpby1j
b21tZW50QGxpc3RzLm9hc2lzLQ0KPiBvcGVuLm9yZz4gT24gQmVoYWxmIE9mIFBldGVyIEhpbGJl
cg0KPiBTZW50OiBXZWRuZXNkYXksIE9jdG9iZXIgMTgsIDIwMjMgMTA6MzAgUE0NCg0KPiA+IEkg
d2lsbCBuZWVkIHRvIHJlLXJlYWQgdGhlIHJ0YyB2MiwgYnV0IHRoZSBnZW5lcmljIGFwcHJvYWNo
IEkgaGFkIGluIG1pbmQgaXMgdG8NCj4gdGFrZSB0aGUgY3RybCB2cSBvcGNvZGUgYmVpbmcgY29t
bW9uIGJldHdlZW4gbmV0IGFuZCBydGMuDQo+ID4gQW5kIGZvbGxvdyB0aGUgbmV0J3MgY3ZxIGNv
bW1hbmQgcmVzcG9uc2UgZm9ybWF0IChkb27igJl0IHJlY2FsbCBpZiBmdWxsZmlscyBydGMNCj4g
b3Igbm90KS4NCj4gPiBBbmQgdGhhdOKAmXMgaXQuIFJ0YyBhbmQgbmV0IGdldHMgYm90aCBzYW1l
IGNvbW1hbmQsIHNhbWUgcmVzcG9uc2UuDQo+ID4gTmV0IHdpbGwgaGF2ZSBmZWF0dXJlIGJpdCB0
byBpbmRpY2F0ZSB0aGlzIGZ1bmN0aW9uYWxpdHkgZXhpc3RzLCBmb3IgcnRjIGl0IGlzIGltcGxp
Y2l0DQo+IGFzIGl0cyBiZWluZyBhbmQgcnRjIGRldmljZS4NCj4gPg0KPiANCj4gQnV0IHRoYXQg
d291bGQgZm9yY2UgdmlydGlvLXJ0YyB0byB1c2UgdGhlIG5vdCBwYWRkZWQgcmVxdWVzdC9yZXBs
eSBoZWFkZXJzDQo+IHdoaWNoIHRoZSB2aXJ0aW8tbmV0IGNvbnRyb2xxIGhhcywgaW1wbHlpbmcg
ZGVkaWNhdGVkIGRlc2NyaXB0b3JzIGZvcg0KPiBjbGFzcy9jb21tYW5kIGFuZCBhY2sgdG8gc3Rp
bGwgaGF2ZSBuYXR1cmFsIGFsaWdubWVudCBpbiBjb21tYW5kLXNwZWNpZmljLQ0KPiBkYXRhIGFu
ZCBjb21tYW5kLXNwZWNpZmljLXJlc3VsdC4NCj4gDQo+IAlzdHJ1Y3QgdmlydGlvX25ldF9jdHJs
IHsNCj4gCQl1OCBjbGFzczsNCj4gCQl1OCBjb21tYW5kOw0KPiAJCXU4IGNvbW1hbmQtc3BlY2lm
aWMtZGF0YVtdOw0KPiAJCXU4IGFjazsNCj4gCQl1OCBjb21tYW5kLXNwZWNpZmljLXJlc3VsdFtd
Ow0KPiAJfTsNCj4gDQo+IFRvIG1lLCB0aGlzIGxvb2tzIGxpa2UgYSBuZXQgbGVnYWN5IGlzc3Vl
LCBzbyBpdCBzaG91bGQgYmUgYWRkcmVzc2VkIGluIG5ldCBieQ0KPiBlbmNhcHN1bGF0aW5nIHRo
ZSBhbGlnbmVkIFJUQyByZXF1ZXN0L3Jlc3BvbnNlLg0KPg0KUmlnaHQuIEl0IG1ha2VzIHNlbnNl
IHRvIGhhdmUgcnRjIHJlcXVlc3QgYXMgY29tbWFuZC1zcGVjaWZpYy1kYXRhIGFuZCBydGMgcmVz
cG9uc2UgYXMgY29tbWFuZC1zcGVjaWZpYy1yZXN1bHQuIA0KDQo=

