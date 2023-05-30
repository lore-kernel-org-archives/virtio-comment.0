Return-Path: <virtio-comment-return-6039-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D533C77B73
	for <virtio-comment@archiver.kernel.org>; Tue, 30 May 2023 14:57:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6A1CB157EE9
	for <virtio-comment@archiver.kernel.org>; Tue, 30 May 2023 14:57:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5633D986597
	for <virtio-comment@archiver.kernel.org>; Tue, 30 May 2023 14:57:30 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4219998658D; Tue, 30 May 2023 14:57:30 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2B76498658E;
	Tue, 30 May 2023 14:57:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fUJd0G+RVEeIOvwt5zgpNOlWx7jseLVLscbd+hbj4eAGjHzZm/5rXrOTnTqXp2ujB1L4K0wv8aZ3kGiOFmaaFQw7qBkmMHkIv7ts+izN2d0ox4w+OwKrX5+btIZqENya/7m6nhVVavJU4mFWp1P+M1DK1zb7BRBAnlWwiooxkhw7+0vOALMVh3eqrRJXBUcdmQuKj6aEkWYR9CMSe7B3EhdMFmyHA929aU3zocGL/3V+8W6fSev4JQzBIj48HhHkAd0ZbmfCFoxRCWQ2CsEyHajW/yBZCUrSKDIXFPY4kwN5VNgQqTT8S2K0CbPnGEaxtf1+xasAP9vzD/k29t+wwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dekFiB2aw+qid+LmE65MoJHfuYQnohVjhysgYrw9/F4=;
 b=N/ZYK0o1pdxcPS6eO/z9CHPmiYm7acjXZXdtdTjv0kp28KKVqwEqxbk5FciIbG15J2IBW6ZTNjcSwv4peIx2NOEy8RqdBVuZeOvpKv8UwRAeH3sY0ZVawLS3ikyMHMtbGoGpB3xo14RxdiyC+OHdx9gs5PTMSVHGG9hqQz8wXzQTqyp3vqMpxaXUsaYFI/V/r+qcGAjfqUH43CWHu6NIVfisZscPtSsJVYAbC5roJ/xbkcnlC60WqHdV8wCFJXW4FSxJQjt4EiLCEpnp4DRxUzbAmcfY3whY2HvFim40W0pRcQgOksU2mSIJrpeCFo2QclT/Bcof0xpwm8xFEhs5Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
CC: "virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Ariel Adam <aadam@redhat.com>
Thread-Topic: RE: [virtio-comment] virtio networking collaboration meeting:
 call for agenda
Thread-Index: AdmJCcjCjRUFdJrUSz6FqEiskKvSlQAQoKoAALaNI1AADEHFAAGr2PHA
Date: Tue, 30 May 2023 14:57:27 +0000
Message-ID:
 <PH0PR12MB548120BD4CE4CD263F64BF48DC4B9@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <PH0PR12MB54816668AFE3CF0F90C8F342DC7F9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CANerMUV1vCA9j6QJ+0q93VoUeUkesuv_mToK6o3iz0989OC+Fg@mail.gmail.com>
 <PH0PR12MB54811AD7B2B63CF675EB7B76DC429@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1684723554.8737867-1-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1684723554.8737867-1-xuanzhuo@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DM6PR12MB4281:EE_
x-ms-office365-filtering-correlation-id: b466ea58-ae87-401a-ab15-08db611e2f52
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Kwy22VdRTOMm2nd7M1BMl+gNdWH35IK0mGXYAhAR9JGvFnPm2z7+q41rZGOeNyqjwST6UR8TvhrPbCE/wp8JSwoK1fZGgQAUtDYXHlMCnf1mOzXXdT+xVKhj7N28uTuAmA6IiDTg5MB/YIq3fTi2NPdIfewt/k6wu0byqXVJi2R58dpfX2U3jb3h6UYkht5AbHAHtPVElT+/4x4N0Jz8H/HIu7jqxMt4CxQSxtM+YvgZ21soWX9L+Th+DrISKYC/8WE8gbACra5UsPPxriQq9d4RQI4dH7iU5gXv4yQQtcSsa7YegNQsu8gh0mxJMFQZj+jDykYharAzbVoGe5Ik50/3+Sz6ApR8pj3X8zSFxM4l4fpxmFRJjWMt4uAHXVkJsb5LqEE46yu9u+z7jRx1W484BSvTI8Rcj2LsWqaZpKQc9Bt+iU0WH5s4o6hkyRgBvwoAXZ4iIVvW8HgYo6t6zDYvEhO0QrRfflcS6uHyVVs8P0H4Mr8SAyP4ZTCvuxnuX3pYgc1S4bEW5QRupdOPCxMc/GOIbfeT6h5xqoB1eD0c8YCx4Mkxrtl3/1eTub7tjSU5Yy3qnjMLqan2HePRi05Hk4pSC8gcpe/PRb9YljDNFt3VqFndJRaPv/txVNh1
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(39860400002)(366004)(346002)(396003)(451199021)(186003)(38100700002)(41300700001)(6506007)(53546011)(9686003)(26005)(7696005)(478600001)(71200400001)(54906003)(6916009)(66476007)(66446008)(66946007)(64756008)(66556008)(76116006)(122000001)(4326008)(55016003)(316002)(52536014)(5660300002)(8936002)(8676002)(2906002)(4744005)(86362001)(33656002)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b1I1OURERTVSYWhJRHUyVUllbVNNSHVGMitvVXNzK2ZLV1BxWHNsTEZlaEtL?=
 =?utf-8?B?Zk9SU09HaE5Ra2xWc3A4L0ZRbk9lLy9EaDhIZjFSUnZGNkNaZlptQWh4S2Vw?=
 =?utf-8?B?cjNJK3RHTWtkMzg1T1dTMUMzSWJackxHWDdqY0hxZjJDc0ZCQU5IclRRMk1J?=
 =?utf-8?B?enBOcDRGRFBRcmdCaVI3R1dBTG5vVVhGQU5tV1pKY1pzamxxMnQzYW1vMlZz?=
 =?utf-8?B?VTJiZnRRM0ZJNE1LbzQvemZGSnZPTHA3bFRvT1pXL2J5VTZhTDc5NjZHSWhZ?=
 =?utf-8?B?NTJzcXRBRWVMVEF2WjZ4clZITy93SUNuRnJQVzVwQ2o1aTVhY1dwOWo1dXBC?=
 =?utf-8?B?SDZldUJuMHcrY3Flb05BUG4xNnJodjNPcXdRcWJFZnZrRTlnWFZYK2RmeU8r?=
 =?utf-8?B?RDh6aXFGZWlvZy9EV0hTSW1qb09aendNMVJVTzhGNXQvelVyODdGK1NpRm9D?=
 =?utf-8?B?MHlQUmZGeC8weHpCTE5EaHhmdEN6TzNweXNkamtEQ1Q5L3h6VGVmN3RVaDdz?=
 =?utf-8?B?T0FQRm5Tcm9FTHdZdER0YWhyR0plN2JEMTZUelhieEJWUmt6UlJyc2QzZllv?=
 =?utf-8?B?MGttcmZOVGdwdTFqWGRobXRUV0ZvU2E5UXZTWjRZN1Rxdk1kS1FsQ0NjSEdG?=
 =?utf-8?B?NWlHaTM1aDNyMWRLdVNLbEhqOXowNG9nLzlHeEZrUHBxU2x6YVV0WFRXZTBX?=
 =?utf-8?B?aDJiRkZScDNGYmxVa3VkektKMFZ2T3hndE92ZnhlRk8wR3RhaGpDOGFaUXdT?=
 =?utf-8?B?cFRFTm1aV2FPSTI0VFZ2aTJpeUovYUoxQmhOMUlZUUlQaVVwQXkvSEFUVUxZ?=
 =?utf-8?B?aEh4MzlEbnpJbVliNk95VEkweitmc05aR2U4d0pOczJLd0w2dW1BTTdKSi9S?=
 =?utf-8?B?WVpWY2tla09uZ1lpdTVVT2xqOXh4OFlka0p3ajhLTmNYcEZ2bVB2bWVwVVlj?=
 =?utf-8?B?Mi9vMEt4RE0vbW4xanJVcDAyTFhibkhMN0ZOODR4WXF5K1YyTkNpUkt3VTZE?=
 =?utf-8?B?czRhVHFtYjZkRHRpT2FaaWNZUHBoaldOWVZZVGMvdDY3UUtQK1RXU09yeFV0?=
 =?utf-8?B?K1JheGdPWU04MzdYdFVPUVpWcCtNZG5YZkV6YlJyRUNGbmNFU3hLSkJ3ZnJH?=
 =?utf-8?B?Tno3NUVwZjZKbGVCNUZRSEVlNmNycXNXTGxmeTVIZmNTdlR0aWRSTUJvbThk?=
 =?utf-8?B?cVUwRTdseHRlWUxCS3FMeUVGa0FYNys5L2hpZ1VNdCt3RnV2SzFvVHZzVktp?=
 =?utf-8?B?eEFVVGhkYUhKdlFtRFBtcW9wWUo4azJnaWs0Zld6NTNJd25seFBVMVRPUi9R?=
 =?utf-8?B?eFRTZTMyT3Z4bElRSldybm03U05PSkpoSjNzemY5VCs2ZHE4SG1YcHpqWWhT?=
 =?utf-8?B?MkZZVGlXb0VzQWNZRTdWZW5IM1o4cVF1ZkdMUHZsZ1BGZk8vMUI3V0kwOEhR?=
 =?utf-8?B?a09SWkhxRmlDRm5vV3QzR0RaMkMzVmpaR2pSQ0xsS0FEMWMzazZMRThhR0My?=
 =?utf-8?B?M3lxOXQxTy83czhQN09xa2Jud0xVTVovbEhKRWh5a2RTQWttamtjcDNzdDF6?=
 =?utf-8?B?OHE3dXZ5eG81Y1NseTNVYzRFaThNa01Cd0FLdDBtQzJNdnlqRUduZGltN1hO?=
 =?utf-8?B?SURpZjFaVlVOTnZpNHBHaWVUNjNvYU5WWnZFNW1VbFQ3SzU5alVlekhkTDMx?=
 =?utf-8?B?Nlh0SzFxR2dzWDN2UUhGc1RQOGVHT0dkUEt5R2hUb3Y4bG5CMURERHlXVmpp?=
 =?utf-8?B?UVJXYkxLTDN3UUY4ZUJ1eTFQUGhqWUYvekY3a1BVdy9WbkRzcGdpMFl1MWcr?=
 =?utf-8?B?WjhCUlhnckNKMHNZK0JZTTFVZGcycWJXa3pwRG5Ba2lwMTZKVTlaNVhqR2Fm?=
 =?utf-8?B?ZEl3TlBXWUhaWStLOG5wdTRNOHpnMFRFQkZGQm83VEVoSldYNEs0WXRkRHZW?=
 =?utf-8?B?QlZmcFZJRGo1Q0ZqN1lXRmhlZWpvV3YrNG5rSTIwTWdrVG10MENnTlZwUkJY?=
 =?utf-8?B?NkNGeXlUdTdvOGlTTXd0TDd3dkVHOEFMTWh4VDZUUk5Ea1ZhUVI4eUZwbVMr?=
 =?utf-8?B?OFp6bmVGeDhocTFUTERtWGovT09tN1NJYnlLTWhhRGZJdUJEQWxJRnhwNEow?=
 =?utf-8?Q?U1g0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b466ea58-ae87-401a-ab15-08db611e2f52
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2023 14:57:27.3390
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0PHMwsh+Tm8vlTKk4iXdGS5r/0oOscJzyf899pdWp0PjZiI2LT44cndTN7ISIksb21CQeKIeV1BsjcLDKEWyYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4281
Subject: RE: RE: [virtio-comment] virtio networking collaboration meeting:
 call for agenda

SGkgWHVhbiwNCg0KPiBGcm9tOiBYdWFuIFpodW8gPHh1YW56aHVvQGxpbnV4LmFsaWJhYmEuY29t
Pg0KPiBTZW50OiBTdW5kYXksIE1heSAyMSwgMjAyMyAxMDo0NiBQTQ0KPiBUbzogUGFyYXYgUGFu
ZGl0IDxwYXJhdkBudmlkaWEuY29tPg0KPiBDYzogdmlydGlvQGxpc3RzLm9hc2lzLW9wZW4ub3Jn
OyB2aXJ0aW8tY29tbWVudEBsaXN0cy5vYXNpcy1vcGVuLm9yZzsgQXJpZWwNCj4gQWRhbSA8YWFk
YW1AcmVkaGF0LmNvbT4NCj4gU3ViamVjdDogUmU6IFJFOiBbdmlydGlvLWNvbW1lbnRdIHZpcnRp
byBuZXR3b3JraW5nIGNvbGxhYm9yYXRpb24gbWVldGluZzogY2FsbA0KPiBmb3IgYWdlbmRhDQo+
IA0KPiBPbiBTdW4sIDIxIE1heSAyMDIzIDIwOjU4OjQyICswMDAwLCBQYXJhdiBQYW5kaXQgPHBh
cmF2QG52aWRpYS5jb20+IHdyb3RlOg0KPiA+IEhpIEFyaWVsLA0KPiA+DQo+ID4gVGhhbmtzIGZv
ciB0aGUgc3VnZ2VzdGlvbi4NCj4gPiBUd28gc2VwYXJhdGUgbWVldGluZ3MgZW5hYmxlIHRoZSBh
dHRlbmRlZXMgdG8gY2hvb3NlIGFsbCAzIG9wdGlvbnMgYmFzZWQgb24NCj4gdGhlaXIgaW50ZXJl
c3QsIHRpbWUsIHByb2plY3QgcGFydGljaXBhdGlvbiBhbmQgbW9yZS4NCj4gPg0KPiA+ICAgMS4g
IEpvaW4gYm90aA0KPiA+ICAgMi4gIEpvaW4gdmRwYSBkaXNjdXNzaW9ucw0KPiA+ICAgMy4gIEpv
aW4gdmlydGlvIG5ldCBzcGVjIGRpc2N1c3Npb25zDQo+ID4NCj4gPiBTbyBJIHdpbGwgY29udGlu
dWUgYXMgZGVkaWNhdGUgb25lLg0KPiA+DQo+IA0KPiBJIHByZWZlciAjMy4NCj4gDQo+IA0KDQpU
aGFua3MgZm9yIHRoZSBhY2suIEkgbmVlZCB0byBkaWZmZXIgaXQgYnkgYW5vdGhlciB3ZWVrIGR1
ZSB0byBvdGhlciBpc3N1ZXMgZnJvbSBteSBzaWRlLg0KDQo=

