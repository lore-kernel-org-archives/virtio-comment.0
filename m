Return-Path: <virtio-comment-return-7979-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E77FC25B6B
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 08:38:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 785A62AD52
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 08:38:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 57E35986A56
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 08:38:54 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 401EE986A4E; Thu, 26 Oct 2023 08:38:54 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3128E986A4F
	for <virtio-comment@lists.oasis-open.org>; Thu, 26 Oct 2023 08:38:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NRal4jGJ/MqtRnXm8BcpZfx787psoMtjZIM3/AysipEsCL8fCBG7bMnlA3jd0NQSKq0EOIIuogLJhVq472I0Ifaxeob1mWZDYSUkOthxKWMGwIuZtXHDUCIL4B0h9DtsQ2YU1XTq3iIWMJpx1aRXuKmZH18U37HKJ3vgiY9R4AIH58b7a8Y3Z7CaLtX9LK1TcoeQjQk68YOPi8ujf8fRr5+qEdkHr814vSRsrNjth9gkHKdA0W6lgCTTHQvCNOvmabtC0BFekiCI7rB0Ro5Jz4qUcZtyo6tqJNvVfEe/AEd64jFjbCWZUW9O6nPg0zl+KBpxVNZhrPeVcCm1u3C1sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q+GIX24OYo+wXWMzBdRUK922kFnkZLruVI4yPh6CBuM=;
 b=K5A8PWITWG2zXwUaMzln+1Q4e0UW961xxackQEt5OfvsWC6PqyXzwIS2AHUM+gwAzoSNNi68jDiLPEZcBFQVwcnjpWHQUP1ZHa0dExgXTYZdcPHI9OfSU5euVe8XQMTX5VdUcV/tCUueGTbzTmtYcuBLGR0hSi77baxFq8p9qqTwXXzWMSKJXw6YGnm648F93+KTBTmzeIYwC7ELNUwISwxAmrp78JwcwuhvzNc8m+NEAP4M0+ZrrLWajYgMsAnVYfOmXZdZQ/1GMd4EnBHNxC797JTjuaH5XAjruxIagCcOU/mLLMMZuiZNEBZjjUHtrTL89WAYnKWAveumBS/Wqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>, Shahaf Shuler
	<shahafs@nvidia.com>
Thread-Topic: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage
Thread-Index:
 AQHZ9O+eNF50SoOX0EKV5RZKM+E/zrBOABmAgAAC7YCAAW3ogIAAANSAgAAJ84CAAAB/0IABwd9wgAZBiUCAAAgxgIAAAJFwgAAH/ICAAAX5IIAAA0oAgAADzbCAAss+gIAACFOAgAEc2TCAACXpgIAAAYlggAAtfgCAAACsgA==
Date: Thu, 26 Oct 2023 08:38:51 +0000
Message-ID:
 <PH0PR12MB5481402BCC52DCEBF6A90A7FDCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <PH0PR12MB5481D21AD4CD4C649C4E023FDCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87zg09bfwg.fsf@redhat.com>
 <PH0PR12MB5481A3846046A484EFE20408DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87wmvdbehg.fsf@redhat.com>
 <PH0PR12MB548172C89C0213867F765012DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87ttqhbcy7.fsf@redhat.com>
 <PH0PR12MB5481723C85AF5B80689C9084DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB548149234F6B8F894387FAAADCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231025062207-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5480246A4E61D071C4C60A69DCDDA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231026013059-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54811806D9195E8611DBF7F3DCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CAJaqyWcFKGTpHSUsHePUA4sTp_NthrTs9dzdVKoRcuM6e0G-kA@mail.gmail.com>
In-Reply-To:
 <CAJaqyWcFKGTpHSUsHePUA4sTp_NthrTs9dzdVKoRcuM6e0G-kA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CYYPR12MB8964:EE_
x-ms-office365-filtering-correlation-id: a85df9c3-e6ac-40cb-e9cb-08dbd5fefb16
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 a+6y1jpI6p3/Pb/6V7bWpoEkdb3n4Tr98LC3WQpTu9MjhRbkZYOg4bk0N0iJ5NTgGuiFNj4FLkNx1XJJAJzH2HACuP8sNIjlp4dvBpHiBhRN+yKxlwRLt4HM1nzJPZpJYDe9tAx2eLnGkYMIn4W4h0jKpqFAtWm6qsAUadOcV0M90NE+YkA6IfhI+NqEFbemZIsOC0FrwA+edrIF+3nRPPVR/Vr1dDTbnDosXM4q+ucIXwdR+Ln9fC6I3+PBqUkCVwc8wEPNE5qOzbwBm1kVzJYsNHL1SHDs3G4AlzEW3J7B3SYrWBmoqtrPPGDfXi/d0lyLVXHbVjFSG3Zd+zS7v1EhgpcEf6yUZ00NbILhvy7cH4UND31L0a2wzZS2kmOIOIcIvr2fxKgz+TsXTyGpo7HWU84TLAHyczqFAlT4dYieqgriTf/vp2uaC1RLwCmvbl7E2Kk8A6r5sKSd4C5RYugWBn15QTLDKsyERYJL1OtJXxqlJn3f/Gu4oUbM5Jzh+voQqVMAI7ZRCsM3DSvUhIapBmclqHQ5DxIffNKM4IbycSN7jG+CDDiqLO7q3psckYiMpkgpb4gjxPzfX9XttOdKza5//R8MQO7LAlFlSWU/vBkb6uW/6AaYNodJPXfn
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(366004)(396003)(136003)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(38070700009)(55016003)(83380400001)(2906002)(71200400001)(26005)(4326008)(8936002)(33656002)(8676002)(52536014)(107886003)(38100700002)(122000001)(7696005)(66946007)(9686003)(6506007)(478600001)(316002)(6916009)(5660300002)(64756008)(66556008)(66476007)(66446008)(41300700001)(54906003)(86362001)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bStNa0xpMFVyTXJoUHVMMmdrWHZxRWVSZk83czlHck9Ocy9vRXJHM0JxaTIw?=
 =?utf-8?B?SkUwc1cwUTRoeEd4b0p3Vm5lUndjZXUrNGgrbWFycCsvWlorcEY1dG9Ddk1K?=
 =?utf-8?B?RkNsQVNBZlc0d1lvUEd3YWY2Qnc3ZzRWNkR0YlFnQThucG94bUtUR2JoUlhO?=
 =?utf-8?B?YjcxblE3dnhZQ2d3eVdNMVFQcm1QUnFRM0J3ald5a2w2VnFDY1VBaXE4VXpR?=
 =?utf-8?B?d3lFTFFuYVVjdUxLcis1emlKbUY3TGIwZVc4RElOdUhJeWJ5SnFRaTE4QkFB?=
 =?utf-8?B?TmZmOWtvbUduSTRXSjltTFBoY1RRVWZxVW9ZNzZrWmVhOXJqWEJlUzBjSkw1?=
 =?utf-8?B?UG9xUmpBaGgwbW4yamZUWlNQOHB6b01NbkJESVFKWVBiTWhoTEF4Z0pnUk9H?=
 =?utf-8?B?U2c1dEVBTGZVNVlVYThzRzNESmVHTG5PRFVNWFhGc3VMK2t0NkVMWmRzYTZv?=
 =?utf-8?B?Y3E4a2dNLzF4b2o5OUw5K3luUW1ndXhEbjBYWEYwVnRYc0F6ZEwyRVNqL3Vt?=
 =?utf-8?B?bVlEUmJvM1FUcXUweS9ZNHFGT2xPbkVjRlZLMDZUQ1FpZFRvbFVraXJVWkk4?=
 =?utf-8?B?VFNhNVpoaitjcFRnKzMyZjB1OTRjR0lEa004YUJpeDdtMG93TEVwZXdmblR2?=
 =?utf-8?B?ZFJsZFJTNXJ0Z2ovM2lPdHVEM0Q1NFFDWDRNb200L2dDR2F1dzhwNXl5enRz?=
 =?utf-8?B?YnRucmdxREtlOGg4SXFkcUNtdGlTYTFuV0VlOVdweU1MVWpwK3RqaDJLMXNT?=
 =?utf-8?B?eFlLaEgxZk9qaFZHb2ZtdmZ3R1JSK3A0TXhuc05iaTRNQTNWZ0RqaDRNZnlN?=
 =?utf-8?B?bFZNRHFVS1hGcVYzYVNMOHBBNUJZemRkZ2ZpQTJVdmpCa0NvamdEbWVheWdG?=
 =?utf-8?B?Y0pWZWd5UXpMRWRhd3dXemRsQnVta2I3V2hWeWU1V09uYUxHVzg5TjRlRWVM?=
 =?utf-8?B?Qjk0Y0VkQ2M1a1J0akxxV0xWV0s5QWlpYjFJdHh4Z3ZXSFd1bStOOTdqZzI2?=
 =?utf-8?B?NzZGRCtRL1V4Y2NwcEJpTmo4STNpemo3bnhTVE1iTklqbHZwRjZlWlZTMWpq?=
 =?utf-8?B?dWx6VUlSOG4rSTBXQVpCdXpoMnVkU2NXVTl3MWJGT1JQQTJVcWRyY2daWFdT?=
 =?utf-8?B?VlpTQ3U1UFVOTHNIQ3QyNGxCUXNwS1I2V2ppeWJqTW1XYnNJWTQ2bGtNTGJz?=
 =?utf-8?B?am11WVBwamN6QzQ4R0RSZUtrMDFxVXRmRndMc0YwSTRDTEIrMXIvQzNXWVdC?=
 =?utf-8?B?V1lQL0UzWThjMWxteUZtVCtDQ20vdE5uZFJyazJRM2tzcjMwWEM0dFlEVk5X?=
 =?utf-8?B?bDJmUmVzTzJzclBqaWtnZnZQNHlaWUkvSE03dXVVSndGZW1HS0pqaVp1cXIx?=
 =?utf-8?B?NnVDVWZVYlFGVm9vTnoyYXdvUWlGZldkVWVTR2hWTzM0TmlkM1V5OVdMZkk2?=
 =?utf-8?B?UjJjcU12NzhUNGxHTml6RnJRRGNqYmVkZmNlWlV4RkhzV3o1OTVmTVVnQVQz?=
 =?utf-8?B?LzdrYnRyZ0Z0eEhrSGp3Skp4czhRblBXRmNPK0FjZ3lqVHRMZkhqN2hqd2Jx?=
 =?utf-8?B?WVpGcWFTMHRuVVIxQVlGVzhrV1RGT29uL24vTjBMOTBxcXphR1RUNEFLeWg0?=
 =?utf-8?B?WUlvUW1aaEg2RXEvRFFOT1hOUHpmZmxISURSYThIeTRuVDJDL1ZjWGhyMUJw?=
 =?utf-8?B?SitIQ1RsbGFnSlltQ0QvQzluODk1N0xqRnZ4clNXeGxDWlZyUzFIQVArMWV1?=
 =?utf-8?B?aFVubTJGRW5rTGdZVG43elVWR1IwNTkxMURqRHNrYnd5UWJ2RXhpUUJRbzEw?=
 =?utf-8?B?UWhDUmtsODkwVmEzamtmR3hlenhMQXRDZ1ZZZXJjK1pxdHdoY0FlcVNXL1NN?=
 =?utf-8?B?ZHNTRFJNOTRFMzRDcjNGclRqaDJxcC93ajdWa3dxVTUwTEFURkRyeVVmMHUz?=
 =?utf-8?B?d2xXa1hMeTNNa1Q3U3FsVUVHNWNFNWtBTWxIUGREa1pSRFN3RWs1cFZVYVo3?=
 =?utf-8?B?dEFFV00wOTFndkc0eHIyVytZUFhQN1M4VVh4OFNzTXpPN3FUK0ZMRHNkbW8y?=
 =?utf-8?B?MU1XdElueGkzWWVWZ1BLamtEV05TTmttR3N5R0lJRDhDMWd1c2R3VWl4S0FQ?=
 =?utf-8?Q?UbNM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a85df9c3-e6ac-40cb-e9cb-08dbd5fefb16
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2023 08:38:51.3864
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UhY+n/4NPOkFfVg2aWhxcSqVmtYLS3ofWPWu6GecDnQVr/u7BGvsSwaJUTYRIMEsbvufapsfKwrjvuVeryxinA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8964
Subject: RE: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage

PiBGcm9tOiBFdWdlbmlvIFBlcmV6IE1hcnRpbiA8ZXBlcmV6bWFAcmVkaGF0LmNvbT4NCj4gU2Vu
dDogVGh1cnNkYXksIE9jdG9iZXIgMjYsIDIwMjMgMTo1OCBQTQ0KDQo+ID4gTGV0IG1lIHdvcmsg
b24gbW9yZSBtYXR1cmUgaW50ZXJmYWNlIHRoYXQgc29sdmVzIGZvbGxvd2luZyBjaGFsbGVuZ2Vz
Lg0KPiA+IDEuIGFiaWxpdHkgdG8gY3JlYXRlIGEgdmlydHF1ZXVlIGR5bmFtaWNhbGx5IGFmdGVy
IGRyaXZlcl9vayAyLg0KPiA+IGFiaWxpdHkgdG8gY3JlYXRlIHZpcnRxdWV1ZSB3aXRoIG9uZSBv
ciBtdWx0aXBsZSBwaHlzaWNhbCBhZGRyZXNzZXMgMy4NCj4gPiBhYmlsaXR5IGZvciB0aGUgZGV2
aWNlIHRvIHJldHVybiBlcnJvciBpZiBpdCBjYW5ub3QgY3JlYXRlIGR5bmFtaWMgdnENCj4gPiBj
cmVhdGlvbg0KPiA+DQo+IA0KPiBJIHRoaW5rIDEgaXMgdmVyeSBjb21wbGV4IGZvciB0aGUgc2lt
cGxlciB1c2UgY2FzZSBvZiBkZWxheWluZyB0aGUgZW5hYmxpbmcgb2YgdGhlDQo+IGRhdGFwbGFu
ZSwgZXNwZWNpYWxseSBiZWNhdXNlIHZpcnRpby1uZXQgYWxyZWFkeSBhc3NpZ25zICJ0aGUgbGFz
dCBxdWV1ZSIgZm9yDQo+IENWUS4gSXQgd291bGQgcmVxdWlyZSBjaGFuZ2VzIHRvIGl0IHRvby4N
ClZxIG51bWJlcnMgZG8gbm90IGNoYW5nZSBmb3IgdmlydGlvLW5ldCB3aGVuIGVuYWJsZWQgZHlu
YW1pY2FsbHkgYWZ0ZXIgZHJpdmVyX29rLg0KVGhpcyBpcyBiZWNhdXNlIG1heF92aXJ0cXVldWVf
cGFpciBpcyBSTyBwYXJhbWV0ZXIuDQoNCkl0IGlzIG5vdCBjb21wbGV4IGJlY2F1c2UgaXMgaXQg
b25seSBhYm91dCBkZWZpbmluZyBhIGNvbW1hbmQgZm9ybWF0IGZvciBjcmVhdGUgYW5kIGRlc3Ry
b3kgYSB2cSB0byBydW4gb24gdGhlIGN2cS4NCkl0IGlzIGFjdHVhbGx5IHRoZSBvcHBvc2l0ZSBi
ZWNhdXNlIHRoZXJlIGlzIGdvb2QgcHJvdG9jb2wgYW5kIGhhbmRzaGFrZS4NCg0KTWFueSBkZXZp
Y2VzIGhhcyBzaW1wbGUgYXJyYXkgb2YgcGh5c2ljYWwgYWRkcmVzc2VzIGZvciBxdWV1ZSBjcmVh
dGlvbi4NClNvIGNvbW1hbmQgaXMgc3RyYWlnaHRmb3J3YXJkLg0KDQo+IA0KPiAyIGNhbiBiZSBz
b2x2ZWQgaWYgd2UgYWxsb3cgcmVzZXR0aW5nIGEgcXVldWUgYmVmb3JlIERSSVZFUl9PSywgDQpU
aGlzIGlzIGp1c3QgdGhlIGhhY2sgb2YgZW5hYmxpbmcgYW5kIHJlc2V0IGZvciBubyBhcHBhcmVu
dCBnYWluLg0KRnV0dXJlIGRldmljZXMgbWF5IGhhdmUgbWFueSBxdWV1ZXMgYW5kIGVuYWJsaW5n
IDEwMDAgcXVldWVzLCByZXNldHRpbmcgdGhlbSBpcyBqdXN0IGFuIHVnbHkgaW50ZXJmYWNlLg0K
DQo+IFdvdWxkIHRoYXQgd29yayBmb3IgdGhlIHVzZSBjYXNlIHlvdSBoYXZlIGluIG1pbmQ/DQpJ
dCB3b3JrcyBidXQgbm90IHNwZWMgd29ydGh5IG1ldGhvZCB0byBidWlsZCB3aGljaCBqdXN0IGRl
bGF5cyB0aGUgd2hvbGUgZGV2aWNlIGluaXQgZmxvdyB3aXRoIG5vIGdhaW4uDQoNCj4gDQo+IDMg
Y2FuIGJlIHNvbHZlZCBieSByZS1yZWFkaW5nIHRoZSBxdWV1ZV9lbmFibGUgZmllbGQ/IFRoaXMg
aXMgdGhlIHdheSB3ZSdyZQ0KPiBhbHJlYWR5IHVzaW5nIGZvciBjaGVja2luZyBEUklWRVJfT0sg
aW4gdGhlIFBDSSB0cmFuc3BvcnQuDQpPbmx5IHBvbGFyaXR5IGlzIG5vdCBlbm91Z2guIEFuIGVy
cm9yIGNvZGUgc3VjaCBhcyBvdXQgb2YgcmVzb3VyY2UvYnVzeS9zdWNjZXNzIGlzIG5lZWRlZC4N
Cg0KVGhlIHdob2xlIHBvaW50IGlzIHRvIG5vdCBhYnVzZSB0aGVzZSBiYXNpYyBpbml0IHRpbWUg
cmVnaXN0ZXJzIGF0IHJ1biB0aW1lLg0KPiANCj4gPiBUaGUgcXVlc3Rpb24gaXMsIGRvIHdlIG5l
ZWQgdGhpcyBnZW5lcmljIGZhY2lsaXR5IGJleW9uZCB2aXJ0aW8tbmV0Pw0KPiANCj4gSSB3b3Vs
ZCB0cnkgdG8gYXZvaWQgc29sdXRpb25zIHNwZWNpZmljIGZvciB2aXJ0aW8tbmV0LCBhcyBvdGhl
ciBkZXZpY2VzIG1heSBuZWVkDQo+IHRvIHJldXNlIHRoZW0gYW5kIGl0IHdvdWxkIGJlIGJhZCB0
byBuZWVkIHRvIGFkZCBxdWlya3MgZm9yIHRoYXQuDQpObyBuZWVkIHRvIGFkZCB0aGUgcXVpcmsu
DQpCdXQgSSB3b3VsZCBsaWtlIHRvIGxpc3RlbiBpZiB0aGVyZSBpcyBhbnkgY29uY3JldGUgcmVx
dWlyZW1lbnQuDQpBbmQgaWYgdGhlcmUgaXMsIHBvc3NpYmx5IHN1Y2ggZGV2aWNlIGNhbiBhZGQg
dGhlIGN2cSBhdCB0aGF0IHBvaW50IGZvciBkeW5hbWljIHdvcmsuDQpTbywgdGhpcyB3aWxsIHN0
aWxsIHByb3ZpZGUgdGhlIHVuaWZpZWQgYXBwcm9hY2ggd2hlbi9pZiBuZWVkZWQgb24gb3RoZXIg
ZGV2aWNlcy4NCg==

