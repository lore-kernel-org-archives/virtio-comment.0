Return-Path: <virtio-comment-return-7736-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DD1CDB465
	for <virtio-comment@archiver.kernel.org>; Mon, 16 Oct 2023 16:30:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id F282371C8F
	for <virtio-comment@archiver.kernel.org>; Mon, 16 Oct 2023 16:30:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CAB2D9865E1
	for <virtio-comment@archiver.kernel.org>; Mon, 16 Oct 2023 16:30:57 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B17F59865CE; Mon, 16 Oct 2023 16:30:57 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A29EB9865D4;
	Mon, 16 Oct 2023 16:30:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8jSu4W2iM6XG0xA5fLnsAPAZW4wUZajsD9yXFIrAqjEE0RdB1TYaLID3WK1dhKDOPd6Br4EyxI4ySxjzDJv2HSLE7ry+HnVQXBaEALmA/gEycNUkbhaMmazmt4fehdCm0U0fUf+096IdHmUwLvbtd+6YBtb0dkldSdmBgJ09/w9yHYGkbZG/nj95yRSB8bnxXmRsAnJ07YzM8PrYa8RzRamiDRfGqSUT89czgORtitQatC5wxkfe3jaNejNm+o6GHtYG53CvHUwCcYZzAdZ28g0BXddLHLxTZxhr8OX12mhwyNyF62NK7xx6lxIyix9Lhn+Zy1RFKL/F48oKnkv+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KIUMcpi4WyjyxuWjn4Snvp+8zctQWazFhnxREsZoAC0=;
 b=jQvzmMcr5JFiAO6X+qbSNv/QNsg9Xfr6XBd+Mx95nyd+pGk9AZ3Org0q8UaOjvlekBoGACEAzKOpL5PTdTW/OSvCbDFUEdmVyqSdSder3F+sCEAeAiE/8aE2S84aEKzQbZ4SBA6j/Au/5cs+EuhpHbqzUC6lxyyJGsd+O/QW90MCEbprGt/H8Y1Zv9qcvSke0qQ1eH59axyDn9Tc3nOYK1Fy3JHP0i1QTIaoR7lv35Bl2cMAivVTEpsU8g5c9PYFkDqiacPFX1QIhPlUi1xPTiTtGAq+7fuXHV7Sy+wPDzNnEixRTEL9ijcOSC/uKs9hA4WGfp9NVxcW+vLsC1FR1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>
CC: "hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>, Shahaf Shuler
	<shahafs@nvidia.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>
Thread-Topic: [PATCH v3 0/2] Support enabling virtqueue after DRIVER_OK
Thread-Index: AQHZ9O+aMt9Foa96jkaKzO+VCfy5erA19cYggAyMF4CABKKDgA==
Date: Mon, 16 Oct 2023 16:30:53 +0000
Message-ID:
 <PH0PR12MB5481879853042186FAF4787BDCD7A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231002051601.6626-1-parav@nvidia.com>
 <PH0PR12MB5481828A211C0EE78AB63113DCC5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB54817941AFA95235ECEE745ADCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To:
 <PH0PR12MB54817941AFA95235ECEE745ADCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SN7PR12MB8001:EE_
x-ms-office365-filtering-correlation-id: 98c76508-7b87-4c1a-feab-08dbce65444e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 9HA+Y+6liHC+nc1cdv39aQjZ0sAy8WOdG0RNyjBBY8hoJDjCn0KWCfnu/auSHC/mblUP32Sb67QJBa80ESz5L+6XlRSx9epTnq5e8HoJz1BYIiEMFaziHmEK4Vn24DtohbnBRzeTFg5iDQX6UDE/BN8RXb5XOKYvFVEddjKM0cIzKNAQgJ48IeCoHpLRWe7FITqDVKAo0t4Pb9sJB1Jd+bZ/65afDMmx3wIfEFHfDPmm2PHxmRTZSKoZlCEyBOTDIOEHBjxMmKuCyba5pC9Jfj9iq1g/KvCyEJ94zNIDO3bCTRMETBFNBOVWMKVIUyLd17B6wkoverEvKB1hWsNoSviVOtWhWptXwhNJVxme/w38Xu5m2228iBnShOYgsQZ5iuGrm8mUjYc7L5Ju+FlIWTVj3DRK2c64pQXGjg5mu7m2o8O8Rc8CJtnj4HAxc8J8aWuoJQDqPIRQOJPuHfc21xnssqIeQjdW3NfFYn2dB0w3DSAk+B8IKi3Re7tIR0/Wttxi9NjHLYtI6zIwOx1qub+beEpRRJpuRcXDkfXEEAufhmSujsaans6cAcbjBwP07V02aaFzAmJFlT79IBTt+pNJSDzEOB9uF3Am6rbxR+Xk+PK/MYWgzN8OTiUZgqqvht5tvWTeBckIO2bv+BqtHtfmq5jUg3taW9LihK81IHM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(366004)(396003)(136003)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(55016003)(26005)(38070700005)(9686003)(38100700002)(16799955002)(66574015)(122000001)(66476007)(66446008)(64756008)(41300700001)(76116006)(66946007)(54906003)(66556008)(8676002)(4326008)(110136005)(316002)(8936002)(5660300002)(86362001)(33656002)(7696005)(53546011)(966005)(52536014)(6506007)(2906002)(478600001)(71200400001)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bGJrcTlNTUw5SkFHRG9ST0V1a3ZocG90QzQvR0hleTh6V3FkNGFGTHBnMUw2?=
 =?utf-8?B?VTg3Vzd5TmFET0NqME9NRFovNlJFQ2V6VUVwMk93aGRLeXQ1L3pZajNSYlU2?=
 =?utf-8?B?UjhQUWFFS3gvQjA2emt4b0tiVGZNdTArYXpPTEo5K1M0L2hGQXNoQngya1g2?=
 =?utf-8?B?aUcwUVVUOXdLSUN2bFgvZVVnNzlUVm9nV1pScytrVGwrZXBOdkRraTZHR0ht?=
 =?utf-8?B?NDdEUzMyNG82SnF0OXN0MlU3dTMzOEpML2E2V21Hc09qVkJ6TDNwVGdqZEx4?=
 =?utf-8?B?T0FVS3V5OXBRQ3dGRlpIZFZScTZ2azY0Vk05VGtORHlucFM3R0k5dldIbDln?=
 =?utf-8?B?eUt3ZXIrWkRyOTBSUHJEdXBENFZEUlppUVFWbVdsOEZYR242SzhiMHdHV2ha?=
 =?utf-8?B?RC9LL0JTRDZXT3p2eGVRMGw4WjdkblZtYkxLWXc5MVZlY1h2K0xBSGVXMHox?=
 =?utf-8?B?U2FpdDhTVzdpOFRkbThuTnNjODZiZnRUTEVONEVYWnZnOHQvRWkrTlRjRms0?=
 =?utf-8?B?cU9mb2g0Zlc3bzBlNEdRU2M1NXNiTytHdWZNZHRlV2ptZHJOTFhlY2FNNU5Y?=
 =?utf-8?B?a2xSWmFtUWNGRGNZV1M1QjVmTm5GQzBZalBHWTN0QkRka0xIQTdkdTY4NUs2?=
 =?utf-8?B?MFRGVDhaNFU5YStnckNLb3B6TTV0OEhSVlpoRUR2c0tVTkZVY1djQmY3MGZ6?=
 =?utf-8?B?bTYzUzNDK0dWZ2xnVUFXTU5hcFVDZ2s3SVR3dTJrU21XZzBMNWxXOUplTFI4?=
 =?utf-8?B?YnpwcWhqeUNtaDg4Vy9UNzh2a0tKaGdBQWNKcDU4RTdaM2Vadkh2aUFpZTl5?=
 =?utf-8?B?QWw1S05vVmRvbVc1VlBQY2tuOTFTWThpc0VVRzBKZjlpVEs2bU84cWZrUXJj?=
 =?utf-8?B?eXlwcDZLdEp0RDZoMGdBYnhOa0NoalUreDBZUWYzWDZiQ2hEWFQrMWJ5K1Ry?=
 =?utf-8?B?UGVjQ21uN3R4Y2J6eElsSTdEZ2pSSC93SEg5a29FRU04TUF6V1pUcWFGNEFE?=
 =?utf-8?B?MXhnd1JLUGQ3WlVLVXd6d2RQd0hwb0Y1QWRHcXNONTd0Tktkd05CRDBMRE1E?=
 =?utf-8?B?K0h5U3l4ZytiQ05LZWtkUWpmRUhCTjNNNUo0RHVwVjE5ampwU3lmTko0VndT?=
 =?utf-8?B?SnZZVXVRMW8wZ3Job3Y4cTI4ZExuWktYbzRBWGFISVkyM0kzWkZQWFRldG1H?=
 =?utf-8?B?bXNvUnVtWUg0Ry9JY2l4bHR1dEx1VDF2aWErZjVnL2p6TlFDRWV4SUFkSTIw?=
 =?utf-8?B?Qmd4V0tIbWJpYk9tYnoxRnBPanA4eWJyRWdqVG93dUM4ZjJ4T2pkZTA4WWRK?=
 =?utf-8?B?V3dLM3VJUXB6Q2lIamdzeXVuaEhvUGs4Mms5SVhZTTQvYkNjTFNZem1kUGZX?=
 =?utf-8?B?Zm1nODRPWjB3QjRyMk9JT2gyTTNaeFVUcVlDSngyblRETFJ0QWF4bHJSRFhC?=
 =?utf-8?B?RlVId1U0NnF1MFRxalRQWDlybmtjV2x4TWd4eXlvUXlyVGltYlM3cmRLQm1I?=
 =?utf-8?B?WnV4NHl6Mmk1OFB1SDErVFFmK1NGeFV3ak9JU3BmakY1VmtZRWNBQXcvTnp0?=
 =?utf-8?B?Nm9Mam1lSUhCVVRlRDdQTnpWdHdrTE44eHoraG1xNkFWdzJqdWR5ZWRJNlFG?=
 =?utf-8?B?SDcvdEdWdGRlVWl6dUtwTHlUdEpvZmVUcFVTRzhURS9zTWVDM0FZM2FTT01K?=
 =?utf-8?B?dFhobHE4R2lYMm0veHloMzVLV0IrU0kyank4ckNlWjdjM3U0bzFaZE9lQmYy?=
 =?utf-8?B?S0t3b0tZZGllOWgxME1wd05aMzRQY0hTZ09MSWtIODdoY3BsNVpwcVBjVjZD?=
 =?utf-8?B?dHZ1NFRqdE0xTXFEblhCNlZFVUJsVkNpTmYzS1NIcTBVVkFWcUx5M1JqYmx3?=
 =?utf-8?B?d1ZXaE0rekF6UXRvSUlneVliYU13UGJ0V0wyeVYxbllnTkszZGlMK25QZ1dB?=
 =?utf-8?B?MHV3a0syYWlteG5ybjJWTjV3eUV5SVJDNHpmc21HNzhaSG85R21JRkJMc0pJ?=
 =?utf-8?B?Z3Zia0J2YVUzbHJ1RHlRejcwemFQV3JGenl0c3RNMW1Mcm91QTBmck5ZNDJ2?=
 =?utf-8?B?Ti9RVzhwZXcya2ZncXBGbXVVdG8wNzliNHRJU052N3VTbUY4TDV3dW1GdFp4?=
 =?utf-8?Q?hZz0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98c76508-7b87-4c1a-feab-08dbce65444e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2023 16:30:53.5759
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8ALoDkyulNJ/G/9iXfiRRmCpBqMUgE6XB/NJJgrUArXxC9RIB90NzFV36JIbYL0FXzBj294tJ7OXHMuz0BVMSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8001
Subject: [virtio-comment] RE: [PATCH v3 0/2] Support enabling virtqueue after DRIVER_OK

KyB2aXJ0aW8gVEMuDQoNCkhpIE1pY2hhZWwsIENvcm5lbGlhLA0KDQpJdHMgYmVlbiBtYW55IGRh
eXMsIHRoZSB2b3RpbmcgcmVxdWVzdCBpcyBub3QgcmFpc2VkIGZvciB0aGlzIHNtYWxsIHBhdGNo
Lg0KDQpBcmUgeW91IHJlY2VpdmluZyB0aGlzIGVtYWlsPw0KQnkgYW55IGNoYW5jZSwgdGhpcyBl
bWFpbCBoYXMgZ29uZSB0byBzcGFtL2p1bmsgZGlyZWN0b3J5IGluIHlvdXIgbWFpbGJveD8NCg0K
WHVhbiwgRXVnZW5pbyBhY2tlZCBzbyBJIGF0IGxlYXN0IHR3byBtYWlsYm94ZXMgcmVjZWl2ZWQg
aW4gbm9uLWp1bmsgZGlyZWN0b3J5Lg0KSSBub3RpY2VkIGJhbGxvdCByZXF1ZXN0IGNyZWF0ZWQg
NSBkYXlzIGFnbyBmb3IgZ2l0aHViIGlzc3VlIDE3NSwgaHR0cHM6Ly93d3cub2FzaXMtb3Blbi5v
cmcvY29tbWl0dGVlcy9iYWxsb3QucGhwP2lkPTM3OTguDQoNCkkgc3VzcGVjdCB0aGF0LCB0aGlz
IGVtYWlsIGlzIG5vdCByZWFjaGluZyB5b3UgZm9yIHNvbWUgcmVhc29uLg0KDQpBZGRlZCB2aXJ0
aW8gVEMgdG8gc2VlIGlmIHRoZSAzcmQgcGluZyByZWFjaGVzIHlvdS4NCg0KRmxvdyBmaWx0ZXJz
IGZlYXR1cmUgaXMgd2FpdGluZyBmb3IgYSB3aGlsZSBub3cgd2hpY2ggZGVwZW5kcyBvbiB0aGlz
IHNlcmllcyBhcyB1c2VycyBhcmUgbm90IGFibGUgdG8gc2NhbGUgdGhlaXIgcGVyZm9ybWFuY2Uu
DQoNCklzIHRoZXJlIGFueXRoaW5nIG1vcmUgdG8gdGFrZSBjYXJlIGluIHRoaXMgcGF0Y2g/DQpQ
bGVhc2UgbGV0IG1lIGtub3cgaWYgSSBuZWVkIHRvIGZpeCBzb21ldGhpbmcgaW4gdGhpcyBwYXRj
aC4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQYXJhdiBQYW5kaXQg
PHBhcmF2QG52aWRpYS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIE9jdG9iZXIgMTAsIDIwMjMgMTA6
MjcgQU0NCj4gVG86IFBhcmF2IFBhbmRpdCA8cGFyYXZAbnZpZGlhLmNvbT47IHZpcnRpby1jb21t
ZW50QGxpc3RzLm9hc2lzLW9wZW4ub3JnOw0KPiBtc3RAcmVkaGF0LmNvbTsgY29odWNrQHJlZGhh
dC5jb20NCj4gQ2M6IGhlbmdxaUBsaW51eC5hbGliYWJhLmNvbTsgeHVhbnpodW9AbGludXguYWxp
YmFiYS5jb207IFNoYWhhZiBTaHVsZXINCj4gPHNoYWhhZnNAbnZpZGlhLmNvbT4NCj4gU3ViamVj
dDogUkU6IFtQQVRDSCB2MyAwLzJdIFN1cHBvcnQgZW5hYmxpbmcgdmlydHF1ZXVlIGFmdGVyIERS
SVZFUl9PSw0KPiANCj4gSGkgTWljaGFlbCwgQ29ybmVsaWEsDQo+IA0KPiA+IEZyb206IHZpcnRp
by1jb21tZW50QGxpc3RzLm9hc2lzLW9wZW4ub3JnIDx2aXJ0aW8tY29tbWVudEBsaXN0cy5vYXNp
cy0NCj4gPiBvcGVuLm9yZz4gT24gQmVoYWxmIE9mIFBhcmF2IFBhbmRpdA0KPiA+IFNlbnQ6IE1v
bmRheSwgT2N0b2JlciAyLCAyMDIzIDEwOjUwIEFNDQo+IA0KPiA+IEhpIE1pY2hhZWwsIENvcm5l
bGlhLA0KPiA+DQo+ID4NCj4gPiA+IEZyb206IFBhcmF2IFBhbmRpdCA8cGFyYXZAbnZpZGlhLmNv
bT4NCj4gPiA+IFNlbnQ6IE1vbmRheSwgT2N0b2JlciAyLCAyMDIzIDEwOjQ2IEFNDQo+ID4gPg0K
PiA+ID4gU3VtbWFyeToNCj4gPiA+ID09PT09PT09DQo+ID4gPiBUaGlzIHBhdGNoIGVuYWJsZXMg
ZHJpdmVyIHRvIGNyZWF0ZSB2aXJ0cXVldWVzIGFmdGVyIERSSVZFUl9PSw0KPiA+ID4gc3RhdHVz
IGJpdCBpcw0KPiA+IHNldC4NCj4gPiA+DQo+ID4gPiBUaGlzIHBhdGNoIHRha2UgdGhlIGluc3Bp
cmF0aW9uIGZyb20gdGhlIHRocmVhZCBbMl0gd2l0aCBjcmVkaXRzIHRvDQo+ID4gPiBFdWdlbmlv
DQo+ID4gUMODcmV6Lg0KPiA+ID4NCj4gPiA+DQo+ID4gPiBVc2UgY2FzZXM6DQo+ID4gPiA9PT09
PT09PT0NCj4gPiA+IDEuIER5bmFtaWNhbGx5IGNyZWF0ZSBhcSB3aGVuIGFkbWluaXN0cmF0aXZl
IGNvbW1hbmRzIHRvIGJlIHVzZWQuDQo+ID4gPiBhdGUgdGhlIG5ldCBkZXZpY2UgdHgvcnhxIHdo
ZW4gZGV2aWNlIGlzDQo+ID4gPiAgICBvcGVuZWQgd2hlbiBkZXBsb3lpbmcgZm9yIGEgY29udGFp
bmVyLg0KPiA+ID4gICAgSW4gYSBjb250YWluZXIsIG51bWJlciBvZiB2aXJ0cXVldWVzIHRvIGJl
IHVzZWQgbWF5IGJlIDw9IG1heCBxdWV1ZXMuDQo+ID4gPiAzLiBEeW5hbWljYWxseSBjcmVhdGUg
ZmxvdyBmaWx0ZXIgcXVldWVzIG9mIG5ldGRldmljZSB3aGVuDQo+ID4gPiAgICBBUkZTIG9yIGV0
aHRvb2wgZmlsdGVycyBhcmUgZW5hYmxlZCBhcyBsaXN0ZWQgaW4gWzFdLg0KPiA+ID4gNC4gRHlu
YW1pY2FsbHkgY3JlYXRlIHJ0YyBmdW5jdGlvbmFsaXR5IHJlbGF0ZWQgcmVhZCB2aXJ0cXVldWUg
b25seQ0KPiA+ID4gICAgd2hlbiBuZXQgZGV2aWNlIHdoZW4gdGltZXN0YW1waW5nIHRvIGJlIHVz
ZWQuDQo+ID4gPiA1LiBXaGVuIFhEUCBwcm9ncmFtIGlzIHNldCwgb25lIGNhbiBjcmVhdGUgYWRk
aXRpb25hbCBYRFAgc3BlY2lmaWMNCj4gPiA+ICAgIHF1ZXVlcyB3aXRob3V0IGFmZmVjdGluZyBl
eGlzdGluZyBxdWV1ZXMuDQo+ID4gPg0KPiA+ID4gSGVuY2UsIFRoaXMgcGF0Y2ggaW50cm9kdWNl
cyBhbiBleGlzdGluZyBxdWV1ZSBlbmFibGUgYW5kIGRpc2FibGUNCj4gPiA+IChha2ENCj4gPiA+
IHJlc2V0KSBmYWNpbGl0eSBhbmQgYSBuZXcgZmVhdHVyZSBiaXQgdG8gZXhwbGljaXRseSBpbmRp
Y2F0ZSBzdWNoDQo+ID4gPiBzdXBwb3J0IGJ5IHRoZQ0KPiA+IGRldmljZS4NCj4gPiA+DQo+ID4g
PiBXaXRoIHRoaXMgZmVhdHVyZSwgZHJpdmVycyBjYW4gc2tpcCBvcHRpb25hbCBxdWV1ZXMgY3Jl
YXRpb24gZHVyaW5nDQo+ID4gPiBkcml2ZXIgaW5pdCB0aW1lLiBGb3IgZXhhbXBsZSwgYSBMaW51
eCBuZXQgZGV2aWNlIGRyaXZlciBjYW4NCj4gPiA+IGNyZWF0ZS9kZXN0cm95IHRoZSB0cmFuc21p
dCBhbmQgcmVjZWl2ZSBxdWV1ZXMgd2hlbiBuZXQgZGV2aWNlJ3MNCj4gPiA+IG5kb19vcGVuKCkg
YW5kIG5kb19zdG9wKCkgY2FsbGJhY2tzIGFyZSBpbnZva2VkIHJlc3BlY3RpdmVseS4NCj4gPiA+
DQo+ID4gPiBbMV0gaHR0cHM6Ly9saXN0cy5vYXNpcy1vcGVuLm9yZy9hcmNoaXZlcy92aXJ0aW8t
DQo+ID4gPiBjb21tZW50LzIwMjMwOC9tc2cwMDI2My5odG1sDQo+ID4gPiBbMl0gaHR0cHM6Ly9s
aXN0cy5vYXNpcy1vcGVuLm9yZy9hcmNoaXZlcy92aXJ0aW8tDQo+ID4gPiBjb21tZW50LzIwMjMw
Ni9tc2cwMDA5Ny5odG1sDQo+ID4gPg0KPiA+ID4gUGF0Y2ggc3VtbWFyeToNCj4gPiA+ID09PT09
PT09PT09PT09DQo+ID4gPiBwYXRjaC0xIGZpeGVzIHRvIGFkZCB2aXJ0cXVldWUgcmVzZXQgY29u
Zm9ybWFuY2UgcmVmZXJlbmNlcw0KPiA+ID4gcGF0Y2gtMiBhZGRzIFZJUlRJT19GX1JJTkdfRFlO
QU1JQyBmZWF0dXJlIGJpdCwgcmVxdWlyZW1lbnRzDQo+ID4gPg0KPiA+ID4gUGxlYXNlIHJldmll
dy4NCj4gPiA+DQo+ID4gPiBGaXhlczogaHR0cHM6Ly9naXRodWIuY29tL29hc2lzLXRjcy92aXJ0
aW8tc3BlYy9pc3N1ZXMvMTc3DQo+IA0KPiA+IEkgaGF2ZSB1cGRhdGVkIHYzIHRvIGxpbmsgdG8g
dGhlIGdpdGh1YiBpc3N1ZS4NCj4gPiBOb3cgdGhhdCB0aGlzIHNtYWxsIGZlYXR1cmUgd2FzIHVw
IGZvciBmZXcgd2Vla3MsIGNhbiB5b3UgcGxlYXNlDQo+ID4gY3JlYXRlIHRoZSBiYWxsb3QgcmV2
aWV3Pw0KPiANCj4gQ2FuIHlvdSBwbGVhc2UgY3JlYXRlIGJhbGxvdCByZXZpZXcgZm9yIDEuND8N
Cg==

