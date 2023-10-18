Return-Path: <virtio-comment-return-7778-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66C3CDB482
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 04:30:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2C669129208
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 04:30:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1128498688F
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 04:30:43 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id EE66B986887; Wed, 18 Oct 2023 04:30:42 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DE18B986888
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Oct 2023 04:30:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EKKjjmKYQuTFqvkhCGNoG+msj+KuQ5VMiweOAJUJQ5gvRuyfAsvXhfGtZ6EFk0Q44/hwr8iabEOn+IbSJa3sfD/a5QBGSHolYljTZcsysWWJFEyTYjJUjxMtR+Mkwc53Nkkao2vGNuIH4Sfs8plvBmIhCQHnrtZIrsPfT0lXPra6aUasG1HteCQsEauDmLq7tMfM0+ZS5FPrxIgAt5HbPDyXFuWWO/xBvwYiPMwCIbzY8CSbJwbFTR8O6CUUTLWDU9eT2416tR2+Q8j2nt+tkvlpIRsdM+aCJfvqLYYbpuwOYljv4PVWfdtl+lxHYl+as2k20cElA+Ml/BaDBTJp8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f70APiYpSm2GkZ+PIqdtyovW25fh00CSCGgUq7fP7ZA=;
 b=l7hITXXkt0a9ZKRqizU3FREzw66mnTWyuDHZlZJzzYiArEc1ElmBNUYd6m+j+zfoNgL37LLWgjqzuwBSY1zry0Mt8pm2uiDQq/2H9b0GdRcpac+bg5wC6luISI9aMAye1KoprVOYdVdnjTGSwjVSZM6MVcynwsybnJi2tMYeCstYOOYIBx+raMke4d3TOp6XouDbD+7MhpRO0YM7CwdsZna68E7ySty6GQ1AhI7ixci8Xjtro2/Jil4+6vIKTrXOWu+4+PqqlrO0SaqIWT2oQQLRyqx1TLpu8CudXu2MvobjKW/4P3CMBv5p7Zjrgva8MQzsKnoItsNMRKSNvm3PlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Jason Wang <jasowang@redhat.com>
CC: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration
Thread-Index:
 AQHZ+dpD+jj/KUeLHUaMn2y+w39Cb7BBJzcAgAA1HlCAAEi6gIAAERjwgAEF2ACAAAjm4IABoeMAgAAIQWCAAYjxAIAAAHqAgAD5sYCAAEjPkIAGCquAgAAYNlCAAWk/gIAAN7kQ
Date: Wed, 18 Oct 2023 04:30:39 +0000
Message-ID:
 <PH0PR12MB54813820D9800B4F62C5784FDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231008112555.473895-1-parav@nvidia.com>
 <20231008112555.473895-2-parav@nvidia.com>
 <CACGkMEt0PNFUoVEYDtgziE5scYqauADX6PF-_f0NSCcWB_FrCA@mail.gmail.com>
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
 <PH0PR12MB5481F8312139BB197CEB024BDCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtihTxYADd1dbG=vX9=VLp0xfRJSQ4jd_m0UiuZNz_2sg@mail.gmail.com>
 <PH0PR12MB5481E85F17F9D22CBCC9FDF8DCD6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu_uRcL293Dd+vo2VvYJfUiCaPYF0dAjk-s6=RUtw-PEQ@mail.gmail.com>
In-Reply-To:
 <CACGkMEu_uRcL293Dd+vo2VvYJfUiCaPYF0dAjk-s6=RUtw-PEQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|LV8PR12MB9134:EE_
x-ms-office365-filtering-correlation-id: de3f128e-4fab-40a8-b1df-08dbcf92fb78
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 15Kl0qmtsxb7IORVGNGP9+Kj1dVWp6/dhdTjheGHmYAvGE6waGCKIvTcUo3hx+girdoIPNakKMjiabqcVYhwqssLZK9HCwLGhdoq6Is2fejQt29saV7bQkcgP1u9/SskGrmNMeuPVciA+BwvRaIdobgsxKTK7YTrhtntTdLOkpYR93a1+k6qQg2fABkZ1pbFBPmBpMVGon1uxN8XAjsbp2bV/SzosrgG8MvtBKnwzovHDoq29UUgi1cb8NuqGKoeQd50vpuV3o0rThvE9/Bdta2bavNO35ZqVouTuFwAGrZZf1Bai9WyCrTQoD7uYNMD2qUErtiZWZb4f2f6cQttyelAUjbT36XQYy8ByEM0o5xEQCgSWB45lHQj6xBbBWc7zRYGxgDgXT/TIuR+S+zxNUDd4/olgR99CeQ58UUVSaCTG8Oz9Dt0ZLk1pjl19OEgvG5YhnujYFqhwoRz/KpjXvFFrXRzL6a0DsTYTGdKfNcpWxKm0Sl/WLDTjtDJpzr6woyuMu004Ph4hGC/Y3aj65U3Zj8Dbmv5EQjNp7Wp9EeFP2sOLhQQ1gBrwZf+tujhO8/kE9w66b1nKzYI6HHo+plbb5blq2mjUpeis566MGQn6fG/cYDo+Byw5D25UP/5x8UKorGKHYSvbw5n03Y4D2Lmhj6n0VFReEJMqBQZ9r4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(39860400002)(346002)(136003)(396003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(38100700002)(2906002)(107886003)(83380400001)(478600001)(55016003)(966005)(7696005)(6506007)(122000001)(86362001)(26005)(9686003)(71200400001)(33656002)(38070700005)(52536014)(64756008)(54906003)(8936002)(4326008)(8676002)(76116006)(66446008)(66556008)(66476007)(41300700001)(316002)(6916009)(66946007)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N1J4RTc4ZmswSmRmOGJWL2l5MlBLcUZBdDQ1S3RVQWhwZHgvdHdpSEUrbGZN?=
 =?utf-8?B?VDA1MW90L3B4azZWa05QVUI5WTZhZXNLeE1CNm1WOXRhdXRndEZLbDJvTStU?=
 =?utf-8?B?a2R3ZVRtOHhpbDg0SjcrNXFhc0JJdjUzdHQ5UklWMmtiYXZkaDRMeW83NDhO?=
 =?utf-8?B?c3lhMUFDYysyZ21udHp4dzdHVmJpL2s5MThnU2xwdTZJOHV3WXA0dExwUEhN?=
 =?utf-8?B?UlRUK1J3WW1NNUN6dEkzc0R6UE1XOWYvM2RPM1F4UGNYcnd4UVJnaVF5WWFx?=
 =?utf-8?B?ME1jWEE4RWRoUmtrVFVkcEt5d3F3dWxZYnVWeVZmYzZmZUNvTmJKS3hCYkhU?=
 =?utf-8?B?N3RYSEtJS0Q5VXdmK2pzUm04STM4aVNLZW1mME1xNEFPcEVBODEwSXVtMzd0?=
 =?utf-8?B?bE5ObmVSc3lYek0wOXorYWQ2Tng4QTljUk5sNzRoVmxGdXozakU4RW5wdW1y?=
 =?utf-8?B?ZTRrQ1VFRXdrK2xNQ0w0bmFUVEZFaEYxS2pjNTBTQlRmd0xoL0lvNXVlZVZ5?=
 =?utf-8?B?NnlYWGEvTUEwT3BQRVVnWVYxWnQ3SE9HWWQ3c0RaR0VHb0p6MlNzMnZQNUd0?=
 =?utf-8?B?UDcraFlkNFRPbnN5M2JEWkRHaUswamwyWnkwSnlkbDQwcUpBdGJYOHg3RXp0?=
 =?utf-8?B?RGE2citIdFFmTHQ5Y2Z1ZExoK0ZGdmZ3ZTJsZnAwQVFYYWoxNFkwUitYcldr?=
 =?utf-8?B?c0h3QlJBbTNGc3VXRzZQc3JpSE0yWExLbFUwZjM1dlNZUER0anZmZ0VkS0Qy?=
 =?utf-8?B?ZWNqM0NtemFjeDZRM0prbERvYlBFc1JZMkVzM2Rzc2tJcTRNRHp5NjNId0ZB?=
 =?utf-8?B?MGREbTcxSnFxRlhKckR3bXhzcGFYV21Pb2J5Z2VJQkozS2g3cHZqSHJHbXIz?=
 =?utf-8?B?K2JHNUo3WUtvajNkS3BrWXdNSjhjei84cWZISHdTbmpsdWpQUU1lc2RISmd0?=
 =?utf-8?B?SjM5L2FjNllmRk9oam4vUHNlcFl2N0JoUlZzb1gyOWpLR014eEt0cFFPMTEz?=
 =?utf-8?B?T0dETlNvRUpXK1pCK05kNjV6UVhzdkc1RXZFWm1GYlhONkF1YVhhVkd4akx3?=
 =?utf-8?B?UEQxNXF1djZlbWdyS2twTFZRSzdGN3o3TFd1MWxRUWpZSTk2MERIVUZnTkFl?=
 =?utf-8?B?bHRFVVNwL3plcU0zWHM1KzBndUt1V1pZWkxzczRzemtqcTVQY0Joemdtb3pn?=
 =?utf-8?B?SUxUNzBpREFvYjFxblFNUmlSQ2grNnUzZ1BHREZwbHBTTi8xUVVTdVUzMWtn?=
 =?utf-8?B?S3NVekZkdkR0TXpwVjR6bUJybXh1eWxZTDVOSkNIMTVWZWZJZTNzVXhiSkVP?=
 =?utf-8?B?UlRXZTBJU2EwNHJyRk1DQURQYzBIc2NxbHZJbHoyWUpRVlQ4SEVPeDhOc3pl?=
 =?utf-8?B?UEltdzFwZEFJRDVCRFRHdG51VmNWd3hTcTJoaUFiU25YeWorN2k4Zmt6cFdq?=
 =?utf-8?B?cjFTUDJ3TW1RdGdiUVViZlNwWmhUa3FDcDdvdHRka0hnR21CVzJXY3dBbkJN?=
 =?utf-8?B?UTJDWm45bkF6RERNYVN0Y0ZBQUErbGdzSGlBRUV0M0lCYURLSHlQU0doUk04?=
 =?utf-8?B?YS9uVzJDSnZPTXkrZmhZODZla1grSHByMmF5czNWS3ZlWFlVS091QXlGMTZF?=
 =?utf-8?B?VG5VcUhkS3ErQXFRSnFaMVRGRU5FYlFSL1dqWU5CMDRMaTdJMElhbTJNSVc2?=
 =?utf-8?B?UFdYcERPcW5TUTFzYlZyRm4rRk1CSUlDU3haYmtkZERKalcxMXQ5b24wZ0RI?=
 =?utf-8?B?ZlJxQUJWdDk3T3pNNHA3YXFSQ1A5SE1FN1NjeEorRjYvdTg4UWFHdXNZdzlQ?=
 =?utf-8?B?UE9sRDcvVkl5ZWpFYzFBN2ZkdHZkM2JON05MZW53UTI0UDllbmN1Nlh6N1JW?=
 =?utf-8?B?b2FLYnAyVk1lVGFKK25MQzRmZWJFdmgrNmhPNXI5RlMySVZqMksrMW4wU1lk?=
 =?utf-8?B?U1pTMXB1TFNsWDJtOURLcDNLNTl6ejFuaVd4QjJuR1l4Q05zSUptU3lta08x?=
 =?utf-8?B?dHJNWHZpYlpZb1F3TUlmeWRkZXcvMWc2dWVabVE0U1ZTS3R6S2wxa2hjQzVk?=
 =?utf-8?B?VHhWNTZJK1QyZnJmc2J2Z01GL0V2MnFEcmFuRVlSTldubWo2WU9wS0lSUkRj?=
 =?utf-8?Q?bzyA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de3f128e-4fab-40a8-b1df-08dbcf92fb78
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2023 04:30:39.4185
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tCfmA94NrvvuuSio6Dmvh+vNrbFIPTvyVp0kKu7s8RVn8LEkyDKCueBPSqoM4AMIUG3ZgeDZISJTmborFnLfWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9134
Subject: RE: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

DQoNCj4gRnJvbTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4NCj4gU2VudDogV2Vk
bmVzZGF5LCBPY3RvYmVyIDE4LCAyMDIzIDY6MjMgQU0NCg0KPiBXaHkgY2FuIHN1c3BlbmQgZ28g
ZGlyZWN0bHkgZnJvbSBndWVzdCB0byBkZXZpY2UgdGhlbj8NCj4NCkJlY2F1c2UgYWxsIHRoZSB2
aXJ0aW8gcmVnaXN0ZXJzIGFyZSB0cmVhdGVkIGVxdWFsbHkgYnkgdGhlIGxpdmUgbWlncmF0aW9u
IGRyaXZlci4NClNvIHdoeSBub3Q/DQpBcyBleHBsYWluZWQgZGV2aWNlIHN5bmNocm9uaXppbmcg
YWxsIHRoZSBvcGVyYXRpb25zIHdoaWNoIGFyZSBub3QgbWVkaWF0ZWQgYnkgVk1NLg0KDQpJZiBz
b21laG93IHlvdSBjbGFpbSB0aGF0IGFsbCB0aGUgc3luY2hyb25pemF0aW9uIGlzIHBvc3NpYmxl
IF9vbmx5XyBpbiBzb2Z0d2FyZSBpbiB2YXJpb3VzIG1lZGlhdGlvbiBsYXllciwNCkFuZCBpdCBp
cyBpbXBvc3NpYmxlIGluIHNpbmdsZSBwbGFjZSBpbiBkZXZpY2UsIHRoYW4gSSBkbyBub3QgYWdy
ZWUuDQpWMiBsaXN0ZWQgbW9zdCBvZiB0aGUgc3luY2hyb25pemF0aW9uIHBvaW50cyBvZiB0aGUg
ZGV2aWNlLg0KIA0KPiA+IFdoZW4gc3VjaCBkZXZpY2UgcmVzZXQgaXMgZG9uZSwgaXQgZG9lcyBu
b3QgcmVzZXQgdGhlIGRldmljZSBjb250ZXh0LCBub3IgaXQNCj4gY2xlYXJzIHRoZSBkaXJ0eSBw
YWdlIHJlY29yZHMsIGJlY2F1c2UgdGhleSBhcmUgZG9uZSBieSB0aGUgY29udHJvbGxpbmcgZnVu
Y3Rpb24uDQo+ID4NCj4gPiA+IEknbSBub3QgY29udmluY2VkIHRoYXQgdGhlIHNjYWxhYmlsaXR5
IGlzIGJyb2tlbiBieSBqdXN0IGhhdmluZyAyIG9yDQo+ID4gPiAzIG1vcmUgcmVnaXN0ZXJzLiBX
ZSBhbGwga25vdyBNU0lYIHJlcXVpcmVzIG11Y2ggbW9yZSB0aGFuIHRoaXMuDQo+ID4gPg0KPiA+
IFNheWluZyB0aGVyZSBpcyBzb21lIG90aGVyIGhpZ2ggcmVzb3VyY2UgY29uc3VtZXIgbWV0aG9k
IGV4aXN0cywgc28gbGV0cw0KPiBjb25zdW1lIG1vcmUgaW4gbmV3IGludGVyZmFjZSB3ZSBkbyBu
b3csIGlzIG5vdCBnb29kIGFwcHJvYWNoLg0KPiANCj4gVGhpcyBpcyBzZWxmLWNvbnRyYWRpY3Rv
cnkgYW5kIGRvdWJsZSBzdGFuZGFyZC4gWW91IGFsbG93ICNNU0ktWCB2ZWN0b3JzIHRvDQo+IGdy
b3cgYnV0IG5vdCBjb25maWc/DQo+DQoNCiANCj4gPiBNU0ktWCBvbiBpdHMgdjIgaXMgdW5kZXJ3
YXkuIEhvcGVmdWxseSBpdCB3aWxsIGJlIGZpbmlzaGVkIHRoaXMgeWVhciwgd2hpY2ggaXMNCj4g
YWxyZWFkeSBjdXR0aW5nIGRvd24gTyhOKSByZXNvdXJjZXMuDQo+IA0KPiBXaHkgY291bGRuJ3Qg
c3VjaCBhIG1ldGhvZCBiZSBhcHBsaWVkIHRvIGNvbmZpZyByZWdpc3RlcnMgYW5kIG90aGVycz8N
Cj4NCkJlY2F1c2UgY29uZmlnIHJlZ2lzdGVycyBhcmUgbm90IGRlLWR1cGxpY2F0aW5nIHR5cGUu
DQpNZWFuaW5nIGVhY2ggY29uZmlnIHJlZ2lzdGVyIGlzIHVuaXF1ZSBpbiBuYXR1cmUuIEZvciBz
dWNoIHdvcmsgYSBxdWV1ZS9kbWEgYXBwcm9hY2ggaXMgdGFrZW4uDQpTbyBpdCBpcyBhcHBsaWVk
IHRvIGNvbmZpZyByZWdpc3RlcnMgYW5kIG90aGVycyB0byBub3QgcGxhY2UgYXMgX2Fsd2F5c19h
dmFpbGFibGUgcmVnaXN0ZXJzLg0KV2UganVzdCBuZWVkIHRvIGRvIHRoYXQgaW4gdmlydGlvIHRv
by4NCkFsbCB0aGUgcmVjZW50IHdvcmsgb2YgZmxvdyBmaWx0ZXJzLCBjb3VudGVycyBubyBsb25n
ZXIgcmVseSBvbiB0aGUgY29uZmlnIHJlZ2lzdGVycyBhcyB3ZSBib3RoIGFncmVlZCBpbiBkaXNj
dXNzaW9uIFsxXSB3aXRoIHlvdXIgY29tbWVudA0KDQoiQWRkaW5nIGN2cSBpcyBtdWNoIGVhc2ll
ciB0aGFuIGludmVudGluZyhkdXBsaWNhdGluZykgdGhlIHdvcmsgb2YgYSB0cmFuc3BvcnQuIg0K
DQpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvdmlydGlvLWNvbW1lbnQvQ0FDR2tNRXNlWmVU
NFZYOFV0LTdLcmF4TEtOT01LT2dGRE54cUtvZlhTRlQ4eUhmZy13QG1haWwuZ21haWwuY29tLyN0
DQo+ID4NCj4gPiA+IFlvdSBjYW4ndCBzb2x2ZSBhbGwgdGhlIGlzc3VlcyBpbiBvbmUgc2VyaWVz
LiBBcyBzdGF0ZWQgbWFueSB0aW1lcywNCj4gPiBJIGFtIG5vdCBzb2x2aW5nIGFsbCBpc3N1ZXMg
aW4gb25lIHNlcmllcy4gVGhpcyBzZXJpZXMgYnVpbGRzIHRoZSBpbmZyYXN0cnVjdHVyZS4NCj4g
DQo+IEl0J3MgeW91IHRoYXQgaXMgcmFpc2luZyB0aGUgc2NhbGFiaWxpdHkgaXNzdWUsIGFuZCB3
aGF0IHlvdSd2ZSBpZ25vcmVkIGlzIHRoYXQgc3VjaA0KPiBhbiAiaXNzdWUiIGhhcyBleGlzdGVk
IGZvciBtYW55IHllYXJzIGFuZCB2YXJpb3VzIGhhcmR3YXJlIGhhcyBiZWVuIGJ1aWx0IG9uDQo+
IHRvcCBvZiB0aGF0Lg0KPg0KVGhhdCBkb2VzIG5vdCBtZWFuIG9uZSBzaG91bGQgY29udGludWUg
d2l0aCBzdWNoIGlzc3VlLg0KQW5kIHRoYXQgaGFyZHdhcmUgY29uc3VtZXMgbW9yZSBwb3dlciBh
bmQgbWVtb3J5IHRoYXQgcmVzdWx0cyBpbiBvdmVyYWxsIGRldmljZSBpbmVmZmljaWVuY3kuDQpZ
b3Ugc2hvdWxkIGhhdmUgb2JqZWN0ZWQgdGhlIElNUyBwYXRjaGVzIGluIExpbnV4IGtlcm5lbCwg
eW91IHNob3VsZCBhbHNvIG9iamVjdCBuZXcgTVNJLVggcHJvcG9zYWwgYW5kIHNheSBqdXN0IHVz
ZSByZWdpc3RlcnMuDQoNCj4gQWdhaW4sIHdlIHNob3VsZCBtYWtlIHN1cmUgdGhlIGZ1bmN0aW9u
IGlzIGNvcnJlY3QgYmVmb3JlIHdlIGNhbiB0YWxrIGFib3V0DQo+IG90aGVycywgb3RoZXJ3aXNl
IGl0IHdvdWxkIGJlIGFuIGVuZGxlc3MgZGlzY3Vzc2lvbi4NCj4NCkFuZCB1c2luZyByZWdpc3Rl
cnMgaXMgbm90IHRoZSB3YXkgdG8gbWFrZSBpdCBjb3JyZWN0Lg0KTGV0cyBtYWtlIHN1cmUgdGhh
dCBiYXNpYyBmdW5jdGlvbiBmb3IgdGhlIG1lbWJlciBkZXZpY2UgdG8gZmlyc3QgbGV2ZWwgaXMg
Y29ycmVjdC4NCg0KIA0KPiA+DQo+ID4gPiBpZiB5b3UgcmVhbGx5DQo+ID4gPiBjYXJlIGFib3V0
IHRoZSBzY2FsYWJpbGl0eSwgdGhlIGNvcnJlY3Qgd2F5IGlzIHRvIGJlaGF2ZSBsaWtlIGEgcmVh
bA0KPiA+ID4gdHJhbnNwb3J0IHRocm91Z2ggdmlydHF1ZXVlIGluc3RlYWQgb2YgdHJ5aW5nIHRv
IGR1cGxpY2F0ZSB0aGUNCj4gPiA+IGZ1bmN0aW9uYWxpdHkgb2YgdHJhbnNwb3J0IHZpcnRxdWV1
ZSBzbG93bHkuDQo+ID4gPg0KPiA+IFRoaXMgd2lsbCBiZSBpbXBvc3NpYmxlIGJlY2F1c2Ugbm8g
ZGV2aWNlIHdpbGwgdHJhbnNwb3J0IGRyaXZlciBub3RpZmljYXRpb25zDQo+IHVzaW5nIGEgdmly
dHF1ZXVlLg0KPiA+IFRoZXJlZm9yZSwgdmlydHF1ZXVlIGlzIG5vdCBzb21lIGdlbmVyaWMgdHJh
bnNwb3J0IHRoYXQgZG9lcyBldmVyeXRoaW5nIC0gYXMNCj4gc2ltcGxlIGFzIHRoYXQuIGhlbmNl
IHRoZXJlIGlzIG5vIHRyYW5zcG9ydCB2aXJ0cXVldWUuDQo+IA0KPiBZb3Ugd29uJ3QgZ2V0IHN1
Y2ggYSB3cm9uZyBjb25jbHVzaW9uIGlmIHlvdSByZWFkIHRoYXQgcHJvcG9zYWwuDQpJIGhhdmUg
cmVhZCB0aG9zZSA0IG9yIDUgcGF0Y2hlcyBwb3N0ZWQgYnkgTGluZ3NoYW4gYW5kIHNob3dlZCB5
b3UgdGhhdCB0aW1lIHRoYXQgZHJpdmVyIG5vdGlmaWNhdGlvbnMgYXJlIG5vdCBjb21pbmcgdmlh
IHZpcnRxdWV1ZS4NCkFuZCBpZiBJIG1pc3NlZCBpdCwgYW5kIGlmIHRoZXkgYXJlIGNvbWluZyB2
aWEgdmlydHF1ZXVlLCBpdCBkb2VzIG5vdCBtZWV0IHRoZSBwZXJmb3JtYW5jZSBhbmQgImVmZmlj
aWVuY3kgcHJpbmNpcGxlIiBmcm9tIHRoZSBwYXBlciB5b3UgcG9pbnRlZC4NCg0KPiANCj4gPg0K
PiA+IEFuZCB2aXJ0cXVldWUgZm9yIGJ1bGsgZGF0YSB0cmFuc2ZlciBleGlzdHMgc28gbm8gbmVl
ZCB0byBpbnZlbnQgeWV0IGFub3RoZXINCj4gdGhpbmcgd2l0aG91dCBhIGdvb2QgcmVhc29uLg0K
PiANCj4gSSBkb24ndCB1bmRlcnN0YW5kIHdoeSB0aGlzIGlzIHJlbGF0ZWQgdG8gdHJhbnNwb3J0
IHZpcnRxdWV1ZSBhbnlob3csIGl0J3MgYWxzbyBhDQo+IHF1ZXVlIGludGVyZmFjZSwgbm8/DQpU
cmFuc3BvcnQgdmlydHF1ZXVlIGlzIGRpdmVyc2lvbiBvZiB1bnJlbGF0ZWQgdG9waWMgaGVyZS4N
Cg0KQSBndWVzdCB2bSBkcml2ZXIgbXVzdCBiZSBhYmxlIHRvIHRhbGsgdG8gdGhlIG1lbWJlciBk
ZXZpY2UgZm9yIGFsbCBxdWV1ZSBjb25maWd1cmF0aW9uIGV0YyB0aHJvdWdoIGl0cyBvd24gY2hh
bm5lbCBub3QgbWVkaWF0ZWQgYnkgdGhlIGh5cGVydmlzb3IuDQpPdGhlcndpc2Ugc3VjaCBwbHVt
YmluZyBkb2VzIG5vdCB3b3JrIGZvciBhbnkgY29uZmlkZW50aWFsIGNvbXB1dGUgd29ya2xvYWQu
IEhlbmNlLCBJIHdvdWxkbuKAmXQgZGlzY3VzcyB0cmFuc3BvcnQgdmlydHF1ZXVlIGZvciBub3cu
DQo=

