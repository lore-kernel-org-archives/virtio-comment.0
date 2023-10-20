Return-Path: <virtio-comment-return-7886-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9E6C001DF
	for <virtio-comment@archiver.kernel.org>; Fri, 20 Oct 2023 12:54:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 424342236B
	for <virtio-comment@archiver.kernel.org>; Fri, 20 Oct 2023 12:54:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 20EB0986939
	for <virtio-comment@archiver.kernel.org>; Fri, 20 Oct 2023 12:54:54 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0C596986931; Fri, 20 Oct 2023 12:54:54 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F0749986932
	for <virtio-comment@lists.oasis-open.org>; Fri, 20 Oct 2023 12:54:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cp+6CQf9xhxINLDiGhOClTSF+8Uo3q8HUsXv+rc3gaZep7hQaLoagHEcgMix1En/7vv344YUHRQfgmbmXLHwPW53/kMOiVgbXOuptE+kLma5YyEujqhvWZNf9fdjQXQuYAw9006GzVYKGF+yfrajdrgXu/bm7MMj3iS4loM4PjV+4RVTV3Swpca9tKpR9PiZoHf1qpZE3SBDdcxs4g6kJcZGOjNHeEnXeWmcQIHOo2D1bNW6ExlQQ3b5e4wgPZPOE5gK+czGdhPpyTaqD15ID4pizwe89L2OR8N0ZKtC6uVjwu8PMfhDQlxeM1GLVO5B3LfGCnaEvDvN+Xy/zlUgyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BWPOpGAppdKqY7Otf/oqiC10CjhQuM82Lmj3K4kAxMQ=;
 b=CkI4uVrmg/+v5X/TcnXS2s1wDY1MrCK2KNMfLJO7Cu0nNik2UK5rx7ZnTwsARtvbupxL5nmFPh1LzE9yu6yU5sVudO6gUSziCL3BI+A4CXRZ0qW5D7BSSSV+Z7kd7kdeE1zaJ+oT6Tc3xaR5QWddeR3wk84oBo+9wHadJ85z3fZQgKyp2xUSgHEZFnVV5vyK5mD6zoSM4f6tyACyuIhlPfK1/aObxisvAeRxT54VYMWXjgPBFZIcpIAPlT7O+ZSaXiEJTC+pDbd4pLVogTl6E7A/4PQDQVtyD8dqXj3pnoqWC4tZBpYeexQFelIkmghnz/IeZiEzHUiL5O733FD/sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "Michael S. Tsirkin"
	<mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration
Thread-Index:
 AQHZ+dpHSUrTyyDEA0quapQP8C0hdbA/xRkAgAF/hoCAACxh4IABSWcAgAANqrCAAZnYAIAACyKAgAGFBICAAACFkIAAEwWAgAAD8yCAAXZ1gIAAIYLAgASWeYCAAtRh8IAAGoeAgAAAUKCAAARLAIAAB5cQgAAXYICAAABqYIABiiSAgAAMdcCAAALCgIAAADWggAABTwCAAAD9AIAAAmrwgAGTbICAADeVYA==
Date: Fri, 20 Oct 2023 12:54:49 +0000
Message-ID:
 <PH0PR12MB54819C3A4BC9BB419715AB73DCDBA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <829d27f8-1d9b-4a1e-93a8-a14da626f4a7@intel.com>
 <PH0PR12MB54819FC5A77A46C649CD5B6DDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <0948cfa4-da02-43d5-a099-424f209f814f@intel.com>
 <PH0PR12MB5481546E859578DE97D9E152DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <860e52ef-8cfc-408a-b3cc-2551ef6118d1@intel.com>
 <PH0PR12MB5481F6F9BC5158481EC36AE9DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <cd9431cc-a5ed-4b11-a341-dc129e8ea630@intel.com>
 <PH0PR12MB54819087A0B542F587A4BEC2DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <7bc82c01-19ad-4180-914b-9304e10ef7c3@intel.com>
 <PH0PR12MB5481E858791CA8FD97C7F35EDCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019051406-mutt-send-email-mst@kernel.org>
 <daea1f54-1c85-4a4a-ac3a-c5ae97180e03@intel.com>
 <PH0PR12MB5481BE51210D429FA12EAB45DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fb012148-a71e-4856-95fe-6e75f011f3fb@intel.com>
In-Reply-To: <fb012148-a71e-4856-95fe-6e75f011f3fb@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|LV3PR12MB9265:EE_
x-ms-office365-filtering-correlation-id: 652d81cc-a8f1-4790-b0af-08dbd16bbedf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 76suiiwaboQZ81EapDhdqD02IzJRr91pt3mOCFhmDzVECOpGg4NJITJsQ3/4hFB8lbydC4GubAqPxKDD5OtrX8JxF99db9aun8VzmBA0FHo95C0kVUrooS9Yj3Qz+txJ09St7hZUREN/l6A3dHS9rMvJW6jAs3OJ7mJf4hES7qk3ReUObgKdRh3HtgjqoErDz1iin6Wxz9T4Y0RrYABjhlxg5pjEu6BvPEYUPQtkDgwZwvMy5bhlPK1c9gpjz3FjYPtCoFItF179ck3wzh3MkKp2PZW8yKxUJmWqfzvCIYeju16j5sG5OjVaNZlcB88LemlkJ1BuY5EfbrpA3u+COwQO9K2GV/zL8GX8SLsuQag78px3uWYyp0O/J55tJ2AzyvhytVjrci0NVPtYbTZcww+zivbEUCWT4JVIlhqPNGndQRUBPvXozp6Ns8dSOhS4mswJ8CoW5c9WDk4L3/Pqgjyn0h/JadNGpxYgkP10es8eqjTn/5t48u+u5i+JGq42AVByWAO8WR3TFgfU25g21HeEzLX+uKyovJwGvA/mtPRuODfM8eJftHmdop3PDt4h0ShdbW79RWc4FbfDC3gnQy9+6OljyhqLiJhhS0OdzB/yLXlD67mfFUqDp6qvnbbiWysGuR7WkAnXv9vAqhAynhKm04dLPp3fKIL7auKGOhM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(366004)(39860400002)(396003)(376002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(76116006)(66946007)(64756008)(66476007)(66446008)(54906003)(66556008)(966005)(110136005)(478600001)(83380400001)(9686003)(53546011)(7696005)(122000001)(71200400001)(6506007)(316002)(38100700002)(38070700009)(2906002)(86362001)(4326008)(8936002)(26005)(8676002)(52536014)(55016003)(41300700001)(107886003)(33656002)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RDVZOUdwQkFROUIyNy9DaFpDSEVjT3VvRmpNU3N2MUlJZ2hPQ2VEbndKV0ts?=
 =?utf-8?B?WGFES1QzNDlRUnlYSE1NYm1Gc1RPUW9YL0lZZ2U3bjg0ZXNrekthKzdDdHpB?=
 =?utf-8?B?NENqdElDZUhBWmlEM2xtY0lQVDJiT2swUjFJMzRaU2RZUkd2YlJqUm9WMENn?=
 =?utf-8?B?ckpjVnBLaDdzYVE3MjJGakc1OVRxd2JFVVkvb2xsaGw4RVRQUGlRL3VSaWNP?=
 =?utf-8?B?a0VuemJFVDNGcjZGNXU5Zm54eU5LNkpsUTFXbDFRVTZyWkxScWdoaDNKVHlh?=
 =?utf-8?B?NkhqYnE0eDljcmlUWVdESzMzbDI0UUxycGU5a1VDUWhzb1pqSnVmSndhTFdy?=
 =?utf-8?B?WTRqYU41MmY1Mlh3Q0R1djN6RlNDOTRWQVVIMVdPU1J3QVFrUnBMOE9jbEJP?=
 =?utf-8?B?bFo2S0FTR3NncVZxbzcySm9wTjdDeUM0eUp3Zzd3SUxFK015K25oWFdzeEc2?=
 =?utf-8?B?c3FhVGpGNTR0anV1QUVha2lZK0NGb1VMbHoyeCtCZ3RKek92cW05SXJWRWNw?=
 =?utf-8?B?a2tKOGIvTklNS3BzMm1EUWw5ZDFlMVBnY3l3TW9JSHdILzY4dEFiaVN3Vm9G?=
 =?utf-8?B?L0ZBQTNEZUJlUUVTaDI2amVReERBSXBhdHgzbC8ySmYzTllsdlJhcHBLNWxr?=
 =?utf-8?B?VE1LbVIwWVBuaWpXbFNsdVBjQkJBWGFPRjZsckxZajJIY09wWmFMQyttMFR4?=
 =?utf-8?B?VWlJd3pwRjU0N3pRTytHZ01xcUNrekVBTHFnb25LQ280cExnTEVleTRqSTky?=
 =?utf-8?B?d1d6UUtISXc0Q3VzUXhaTTdLSklpYmhLN2Y5U2kvT0lpVm5aVmVmVGV6bU5h?=
 =?utf-8?B?L3ZicnpPOWlWcXJNU092dUlvSUtMeWFxdzBEdnd1WHlMcTFiZ3NoVnlsYzlz?=
 =?utf-8?B?RUVGMGgzZ3JzM1VLSGczM0YyZjh0TDBURE9VRkNXUjJXVnVvNTliWnQvRXJz?=
 =?utf-8?B?MnFkUUZrYStUY1Z2T0VPTzdkamYvdi9lYmpzVTduYjIzeVdjV0l3ZlhpZ2U5?=
 =?utf-8?B?dkx0N29yMlAxMDM5K3Y2VStaYzVWNFJXRW5HRC9JMUh2M3dPWWFtZ2ZFcThk?=
 =?utf-8?B?RkFCd2ZVelJObFc5TE5pV1Q0cFVMaGZDQzFxZ0FBWWU5SXhZNHBSR280MExx?=
 =?utf-8?B?NzJnWVl3NmVBQys5S0V2ZktsMGZQcEFhQVBZN0xHMjFIZk5JUm1ORk95YzMz?=
 =?utf-8?B?OFJYUksvMHFHZUpjcXU2TTBRM3ovdXBCMVRVR0FITmgyYkZlM09WdHNZNHJE?=
 =?utf-8?B?K0xzcHM3aXNVZUJ5Qll3d21CcUxOYzZ3dVJmcXBXMlBCb1pGODRhT2pWcjRm?=
 =?utf-8?B?YnBDSzMxdHY0QmdPbUExUEVBcVhQS1p3bkZHdkJDekRCZ3hOUnZnZXFrdkg1?=
 =?utf-8?B?dnZXMnpMNk5yRS9icVYxOFU0Sy9Fa003M2EzbGszU3VoWkpYT2VydjZHOHVE?=
 =?utf-8?B?dlJqaTFBVUhjc0FkVmJZRDAxRmplZjNHanFTbG5MQWlZY2ZqS01UT0M3bU9x?=
 =?utf-8?B?cXJWbEdyWktKYU84cHF3LzZwM01TeWdFb2o4TzR0VXdYOWFGR2IzY2hFL0xC?=
 =?utf-8?B?c1ByOWRHZ0M2RnlBb0NydmFpVlhMa0Z5aWR2MFNWVytxZDU4aUhhWWFOWlY0?=
 =?utf-8?B?NzFqYURQWWNHajFvQm1yWVl2N3l4NWdTcXhseWdKTXYwN2plV055ejMrcGlk?=
 =?utf-8?B?MnN5bDZHbVZiamNXVFU1MGZNWFZGYmI0a3VkTjBGd0t0T2tCSndEb2lqTUZ4?=
 =?utf-8?B?QUMreVZVNXlMTEc0YmhiWWNxUm1XY2hudW41NjdZbW82ZkhwU1pzZS9oL05h?=
 =?utf-8?B?ZFFoOExNcVlWOUVBMjdvR0hUVjBidXFVdHVNK3FxTG5NM053NklTbTFpRzBj?=
 =?utf-8?B?UWQ4byt3QytKb25ReFBIejZBdjdCcjVHaEJIY3lmMm05Qm5FbS9GVVBzdFNl?=
 =?utf-8?B?REtkZ2Q2QWlrWXg1MCtCcVcvVUJsSlhId3VTOWt3S0ZaY21GYUY3YlB5V3Q4?=
 =?utf-8?B?anJXMHEzRFhFTG1HT0ZGYkV6cmNWeVBielBvdWhCYjdDR3BZM09rWDZ1K1A1?=
 =?utf-8?B?YXFKTi8rNXo4dEgra2RTckdRWVFFa3JTbzQ4c1gwSDh2SkVQaDVVcS9paTR1?=
 =?utf-8?Q?ki0g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 652d81cc-a8f1-4790-b0af-08dbd16bbedf
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2023 12:54:49.6589
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sGQDv0FR8LPAh3slDLvGFxyme7EcSpp0EtcwkC++bwTai0ua7gxpog0g0uzLz6bxaHlbM6Lm8lwQN1tcaNCdMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9265
Subject: RE: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

DQo+IEZyb206IFpodSwgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+DQo+IFNlbnQ6
IEZyaWRheSwgT2N0b2JlciAyMCwgMjAyMyAzOjAxIFBNDQo+IA0KPiBPbiAxMC8xOS8yMDIzIDY6
MzMgUE0sIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPj4gRnJvbTogWmh1LCBMaW5nc2hhbiA8bGlu
Z3NoYW4uemh1QGludGVsLmNvbT4NCj4gPj4gU2VudDogVGh1cnNkYXksIE9jdG9iZXIgMTksIDIw
MjMgMjo0OCBQTQ0KPiA+Pg0KPiA+PiBPbiAxMC8xOS8yMDIzIDU6MTQgUE0sIE1pY2hhZWwgUy4g
VHNpcmtpbiB3cm90ZToNCj4gPj4+IE9uIFRodSwgT2N0IDE5LCAyMDIzIGF0IDA5OjEzOjE2QU0g
KzAwMDAsIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPj4+Pj4gT2gsIHJlYWxseT8gUXVpdGUgaW50
ZXJlc3RpbmcsIGRvIHlvdSB3YW50IHRvIG1vdmUgYWxsIGNvbmZpZw0KPiA+Pj4+PiBzcGFjZSBm
aWVsZHMgaW4gVkYgdG8gYWRtaW4gdnE/IEhhdmUgYSBwbGFuPw0KPiA+Pj4+IE5vdCBpbiBteSBw
bGFuIGZvciBzcGVjIDEuNCB0aW1lIGZyYW1lLg0KPiA+Pj4+IEkgZG8gbm90IHdhbnQgdG8gZGl2
ZXJ0IHRoZSBkaXNjdXNzaW9uLCB3b3VsZCBsaWtlIHRvIGZvY3VzIG9uDQo+ID4+Pj4gZGV2aWNl
DQo+ID4+IG1pZ3JhdGlvbiBwaGFzZXMuDQo+ID4+Pj4gTGV0cyBwbGVhc2UgZGlzY3VzcyBpbiBz
b21lIG90aGVyIGRlZGljYXRlZCB0aHJlYWQuDQo+ID4+PiBQb3NzaWJseSwgaWYgdGhlcmUncyBh
IHdheSB0byBzZW5kIGFkbWluIGNvbW1hbmRzIHRvIHZmIGl0c2VsZiB0aGVuDQo+ID4+PiBMaW5n
c2hhbiB3aWxsIGJlIGhhcHB5Pw0KPiA+PiBzdGlsbCBuZWVkIHRvIHByb3ZlIHdoeSBhZG1pbiBj
b21tYW5kcyBhcmUgYmV0dGVyIHRoYW4gcmVnaXN0ZXJzLg0KPiA+IFZpcnRpbyBzcGVjIGRldmVs
b3BtZW50IGlzIG5vdCBwcm9vZiBiYXNlZCBhcHByb2FjaC4gUGxlYXNlIHN0b3AgYXNraW5nIGZv
ciBpdC4NCj4gPg0KPiA+IEkgdHJpZWQgbXkgYmVzdCB0byBoYXZlIHRlY2huaWNhbCBhbnN3ZXIg
aW4gWzFdLg0KPiA+IEkgZXhwbGFpbmVkIHRoYXQgcmVnaXN0ZXJzIHNpbXBseSBkbyBub3Qgd29y
ayBmb3IgcGFzc3Rocm91Z2ggbW9kZSAoaWYNCj4gPiB0aGlzIGlzIHdoYXQgeW91IGFyZSBhc2tp
bmcgd2hlbiB5b3UgYXJlIGFza2luZyBwcm92ZSBpdHMgYmV0dGVyKS4NCj4gPiBUaGV5IGNhbiB3
b3JrIGZvciBub25fcGFzc3Rocm91Z2ggbWVkaWF0ZWQgbW9kZS4NCj4gPg0KPiA+IEEgbWVtYmVy
IGRldmljZSBtYXkgZG8gYWRtaW4gY29tbWFuZHMgdXNpbmcgcmVnaXN0ZXJzLiBNaWNoYWVsIGFu
ZCBJIGFyZQ0KPiBkaXNjdXNzaW5nIHByZXNlbnRseSBpbiB0aGUgc2FtZSB0aHJlYWQuDQo+ID4N
Cj4gPiBTaW5jZSB0aGVyZSBhcmUgbXVsdGlwbGUgdGhpbmdzIHRvIGJlIGRvbmUgZm9yIGRldmlj
ZSBtaWdyYXRpb24sIGRlZGljYXRlZA0KPiByZWdpc3RlciBzZXQgZm9yIGVhY2ggZnVuY3Rpb25h
bGl0eSBkbyBub3Qgc2NhbGUgd2VsbCwgaGFyZCB0byBtYWludGFpbiBhbmQNCj4gZXh0ZW5kLg0K
PiA+IEEgcmVnaXN0ZXIgaG9sZGluZyBhIGNvbW1hbmQgY29udGVudCBtYWtlIHNlbnNlLg0KPiA+
DQo+ID4gTm93LCB3aXRoIHRoYXQsIGlmIHRoaXMgY2FuIGJlIHVzZWZ1bCBvbmx5IGZvciBub25f
cGFzc3Rocm91Z2gsIEkgbWFkZSBodW1ibGUNCj4gcmVxdWVzdCB0byB0cmFuc3BvcnQgdGhlbSB1
c2luZyBBUSwgdGhpcyB3YXksIHlvdSBnZXQgYWxsIGJlbmVmaXRzIG9mIEFRLg0KPiA+IEFuZCB0
cnlpbmcgdG8gdW5kZXJzdGFuZCwgd2h5IEFRIGNhbm5vdCBwb3NzaWJsZSBvciBpbmZlcmlvcj8N
Cj4gPg0KPiA+IElmIHlvdSBoYXZlIGNvbW1hbmRzIGxpa2Ugc3VzcGVuZC9yZXN1bWUgZGV2aWNl
LCByZWdpc3RlciBvciBxdWV1ZQ0KPiB0cmFuc3BvcnQgc2ltcGx5IGRvbuKAmXQgd29yaywgYmVj
YXVzZSBpdCdzIHdyb25nIHRvIGJpZnVyY2F0ZSB0aGUgZGV2aWNlIHdpdGgNCj4gc3VjaCB3ZWly
ZCBBUEkuDQo+ID4gSWYgeW91IHdhbnQgdG8gYmlmZXJhY2F0ZSBmb3IgbWVkaWF0aW9uIHNvZnR3
YXJlLCBpdCBwcm9iYWJseSBtYWtlcyBzZW5zZSB0bw0KPiBvcGVyYXRlIGF0IGVhY2ggVlEgbGV2
ZWwsIGNvbmZpZyBzcGFjZSBsZXZlbC4gU3VjaCBhcmUgdmVyeSBkaWZmZXJlbnQgY29tbWFuZHMN
Cj4gdGhhbiBwYXNzdGhyb3VnaC4NCj4gPiBJIHRoaW5rIHZkcGEgaGFzIGRlbW9uc3RyYXRlZCB0
aGF0IHZlcnkgd2VsbCBvbiBob3cgdG8gZG8gc3BlY2lmaWMgd29yayBmb3INCj4gc3BlY2lmaWMg
ZGV2aWNlIHR5cGUuIFNvIHNvbWUgb2YgdGhvc2Ugd29yayBjYW4gYmUgZG9uZSB1c2luZyBBUS4N
Cj4gPg0KPiA+IFsxXQ0KPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3ZpcnRpby1jb21tZW50
Lzg3MGFjZTAyLWY5OWMtNDU4Mi05MzJmLWJkMTAzMzYNCj4gPiAyZGFlOUBpbnRlbC5jb20vVC8j
bTM3NzQzYWE5MjQ1MzZkMDI1NmQ2YjNiOGU4M2ExMWM3NTBmMjg3OTQNCj4gV2UgaGF2ZSBiZWVu
IHRocm91Z2ggeW91ciBzdGF0ZW1lbnQgZm9yIG1hbnkgdGltZXMuDQo+IFRoaXMgaXMgbm90IGFi
b3V0IGhvdyBtYW55IHRpbWVzIHlvdSByZXBlYXRlZCwgaWYgeW91IHRoaW5rIHRoaXMgaXMgdHJ1
ZSwgeW91DQo+IG5lZWQgdG8gcHJvdmUgdGhhdCB3aXRoIHNvbGlkIGV2aWRlbmNlLg0KPiANCkkg
d2lsbCBub3QgcmVzcG9uZCB0byB0aGlzIGNvbW1lbnQgYW55bW9yZS4NCg0KPiANCj4gRm9yIHBh
c3MtdGhyb3VnaCwgSSBzdGlsbCByZWNvbW1lbmQgeW91IHRvIHRha2UgYSByZWZlcmVuY2Ugb2Yg
Y3VycmVudA0KPiB2aXJpdG8tcGNpIGltcGxlbWVudGF0aW9uLCBpdCB3b3JrcyBmb3IgcGFzcy10
aHJvdWdoLCByaWdodD8NCg0KV2hhdCBkbyB5b3UgbWVhbiBieSBjdXJyZW50IHZpcnRpby1wY2kg
aW1wbGVtZW50YXRpb24/DQoNCj4gRm9yIHNjYWxlLCBJIGFscmVhZHkgdG9sZCB5b3UgZm9yIG1h
bnkgdGltZXMgdGhhdCB0aGV5IGFyZSBwZXItZGV2aWNlDQo+IGZhY2lsaXRpZXMuIEhvdyBjYW4g
YSBwZXItZGV2aWNlIGZhY2lsaXR5IG5vdCBzY2FsZT8NCkVhY2ggVkYgZGV2aWNlIG11c3QgaW1w
bGVtZW50IG5ldyBzZXQgb2Ygb24tY2hpcCBtZW1vcnktYmFzZWQgcmVnaXN0ZXJzIHdoaWNoIGRl
bWFuZHMgbW9yZSBwb3dlciwgZGllIGFyZWEgd2hpY2ggZG9lcyBub3Qgc2NhbGUgZWZmaWNpZW50
bHkgdG8gdGhvdXNhbmRzIG9mIFZGcy4NCg0KPiB2RFBBIHdvcmtzIGZpbmUgb24gY29uZmlnIHNw
YWNlLg0KPiANCj4gU28sIGlmIHlvdSBzdGlsbCBpbnNpc3QgYWRtaW4gdnEgaXMgYmV0dGVyIHRo
YW4gY29uZmlnIHNwYWNlIGxpa2UgaW4NCj4gb3RoZXIgdGhyZWFkIHlvdSBoYXZlIGNvbmNsdWRl
ZCwgeW91IG1heSBpbXBseSB0aGF0IGNvbmZpZyBzcGFjZQ0KPiBpbnRlcmZhY2VzIHNob3VsZCBi
ZSByZS1mYWN0b3JlZCB0byBhZG1pbiB2cS4NCldoYXRldmVyIGlzIGRvbmUgaW4gcGFzdCBpcyBk
b25lLCB0aGVyZSBpcyBubyB3YXkgdG8gY2hhbmdlIGhpc3RvcnkuDQpBbiBuZXcgbm9uIGluaXQg
dGltZSByZWdpc3RlcnMgc2hvdWxkIG5vdCBiZSBwbGFjZWQgaW4gZGV2aWNlIHNwZWNpZmljIGNv
bmZpZyBzcGFjZSBhcyB2aXJ0aW8gc3BlYyBoYXMgY2xlYXIgZ3VpZGVsaW5lIG9uIGl0IGZvciBn
b29kLg0KRGV2aWNlIGNvbnRleHQgcmVhZGluZywgZGlydHkgcGFnZSBhZGRyZXNzIHJlYWRpbmcs
IGNoYW5naW5nIHZmIGRldmljZSBtb2RlcywgYWxsIG9mIHRoZXNlIGFyZSBjbGVhcmx5IG5vdCBh
IGluaXQgdGltZSBzZXR0aW5ncy4NCkhlbmNlLCB0aGV5IGRvIG5vdCBiZWxvbmcgdG8gdGhlIHJl
Z2lzdGVycy4NCg==

