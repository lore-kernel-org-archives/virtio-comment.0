Return-Path: <virtio-comment-return-8522-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCFBC61D92
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 04:20:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 231A242A85
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 04:20:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7624E986EB2
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 04:20:34 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E7E2E98689C; Wed, 22 Nov 2023 04:20:33 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A1737986895
	for <virtio-comment@lists.oasis-open.org>; Wed, 22 Nov 2023 04:19:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nO6JlGT20//dW6VgFsChxn4v+ZOGk2pOvoK3xRiQ7IZYG8eFKr8ab1yKLh5rsQvevZOKZTlbGcMD570DoTD3g8PLwQ3LQXjPZT5UgyO0nJFbfTvboDX8L4X/dP7qiO+jHLDGklJPROrMVMrp/Kwx6yG7Lnh16SY2GKVaTtWJgZbjSJ9Bew+r/xmA5d42NJ2Ywx5humEq62Ky9cWmsFcfvW1CDJkIRpJNF6txbQVkngqPGZ0y6mSbPZTwEhO9mUlr2Y1TzuDbMkyDplY7Qdvgbue2laQgNyrg0r8GvakSDTW1mcjn4b+2QoWdRCBUC5HsGKq7R5pMiqO1HjxbG0OnkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6NWOjkVYaqJ+BuOhB0751Y08ZgXc4QD5SOQ+0+RXOIU=;
 b=JqceDZ4jrAmTN0INP8VFPBU/MP2Gx91JwwIbWw2uB/1ZiZW55RtTfX8qigZ54TDgkLTVavJHIMGyL5id8NL/ROouxdsFCsFifVsGbTS1F3bzqEg4dh1FyENYN1RPiY12mV/xWvCKbX8EFVqHivM8g5UWeq9m3Wvqw1/IBRBQ80mrLlyWciD+0RZXSMLnEuXds5Q9xuuXGbVNy3lrBky190p0WKR+kf1tZ3qOvGrVW3vGvjf76qHNMaYBjyFKYbgoHbO/mxkpXdGkSJ4HXr9XSgBcnqgQ9rwyudRpPRNhbaMtH8oRlY9tVLFodIzGFcUszuhCpZbirywhBrw7w+6tMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Jason Wang <jasowang@redhat.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com"
	<sburla@marvell.com>, Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb
	<maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
	"lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Thread-Topic: [PATCH v3 6/8] admin: Add theory of operation for write
 recording commands
Thread-Index:
 AQHaCzPonHREgkZknEiTjfT1JtA3fLBjIMmAgAAcy4CAAWD+gIAAKSfAgAGqygCAABTkAIAGWMEAgAADI2CAAWVPgIACFpEAgAdP4YCAA//WQIAAxB+AgAAJgRCAAA8CgIAAHSmAgAAA6/CAAEWagIAATXNQgAAQ3wCAAAB/YIAADsiAgACQwGCABmFpAIAAsomwgADdAQCAAABLwA==
Date: Wed, 22 Nov 2023 04:19:35 +0000
Message-ID:
 <PH0PR12MB5481CFFD246EDAFE51304848DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <PH0PR12MB54810AFC15EAC51755CFC045DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtP+W4mdfn5PszoSHW3tNS+KPAMKXvJhpWKa_NchxVpZA@mail.gmail.com>
 <PH0PR12MB54815F616E0CF024927984C2DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116004037-mutt-send-email-mst@kernel.org>
 <20231116023443-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548118E76BAFD5FA470B92A1DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116064611-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54814EC9577B1197E2A13BDBDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116121958-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481F4D1B07F2809AA7D7C9BDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116131303-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54818DBAE43A566C807E1AE9DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvWK65GY_U4MMa6=43wqnM8T4-ALK07d7zEHp8Aa36wGg@mail.gmail.com>
 <PH0PR12MB5481D5A3FF96B355348A7F2ADCBBA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEurz8kxONQPTBcXzjnVLpBazNdjJwC6LQr-+Wm96fG=Hw@mail.gmail.com>
In-Reply-To:
 <CACGkMEurz8kxONQPTBcXzjnVLpBazNdjJwC6LQr-+Wm96fG=Hw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|MW6PR12MB9020:EE_
x-ms-office365-filtering-correlation-id: 2bcaaf82-1873-4a78-f9b2-08dbeb123c6f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 vms/8vwJP1YKChEEQg5un1Sla7umkWQXbWWOTn6JfkmCpjFVtQazHEHTqV6daes63vdk3kt69sIIU8adILQoQ/bOc0lilDEARniNZjuEOccM32ZDZvWczou4JYuDYZmpi8gt4LhjPQCOjlbcD6NzDPt3Zs7PoCU/WcR9ClRsH52wb+GcbxNhOx8CTAuxpH+DoRqiRWA4lRJGQ62k8IJoC7NvxxOE6ai7nZAG86Ky8bf+31/vXHvMD7J+2Che2MruY/M/bw2XqYGqqFL6n6OE8wye3y9IdlmvZhhSXJHyxn7xtAoG3u4Zs1zrvr54XV6ebCnh3LPgFZKy+lcrH2FmhsAqO+ZV4vDNVtFkrs2qiUbfqz2b6ImqokOuuDzQnVzaE3QAs+E2w5ghEE1OdTVgTcFyCn63ODTLP2uKuSQYKswqyQnM1GtQEM/BPjFnP6zt5pY6k6zekMEZP0xxuUu8tXHo+XEBzM22cwrTbqIfM4aKeg0m1Amw8BLXzqjtMqTGjbD7mmvTAmaBjQEx3c2rjIJSpZMa95nMOT9fbrYkCLe5JqBmzgbrgY9f7nXC8ZA0KM+AdHvnBkIuOxZEjI4gwkuP5spNbqJ7zHWMlyri768x0rzAjsUvumWRIx7uyqHl
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39860400002)(346002)(376002)(136003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(86362001)(38070700009)(55016003)(83380400001)(66946007)(76116006)(71200400001)(6506007)(6916009)(7696005)(54906003)(316002)(66446008)(66476007)(64756008)(33656002)(122000001)(66556008)(9686003)(26005)(53546011)(478600001)(2906002)(5660300002)(4326008)(41300700001)(52536014)(38100700002)(8676002)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OE9ySlpoYmlmREFTcEZ1bTF1cUlXUE9jaFNRZWQ1cHl0UklvOVBzT3g1R09p?=
 =?utf-8?B?dzJsRmJvMzVwM2s5cXo1YXE0b3k2Z3pTMG9Qc2wzd1NMY0lkeDJ6Vk1XQ3pq?=
 =?utf-8?B?WmRPY3JvSEVNSkM3blBpNlBjRW5RU25qWldIelVibDVhZ2JxSTJsWUJ5cE1h?=
 =?utf-8?B?Z0VBM2o1SXd2Q1RDa0k0VUdhL0lzS28zU2p3a3p4dUxtREU0Rzg3RnJZVCtH?=
 =?utf-8?B?T2szcEI4UVJmS3hoMXdsZFdwVHdON3hST1dreTlzRm83dVVDMGgvdkxjRGxU?=
 =?utf-8?B?dzcyZjJsUmdLOUd3K1ZPVEFUWFVHcGszTS9iMERKMjZOMDBOdUNHNWVpVXVa?=
 =?utf-8?B?clNDQ21CMWVQNmx4ZUlRYWFZaHlOYkdudFFQdDVVaWNSTjhoUlhiWjZ1enpr?=
 =?utf-8?B?YTlXekJkSHVnQndjdG5oeURCU1gwaXNuTUx5RFQ3N3RZODR4ZWN2NmRVK2cx?=
 =?utf-8?B?dFhNSzNzVE1jWXFXMlI1VTg4R2hqVWxQVno4b01Od1pxS0gwTU5wa0tKYXZo?=
 =?utf-8?B?QjZiUVl1YWp4Nzk5dWxuNmc5OVZMd01kdnVjdFFoWGdMM3ZQam80VjY1Qm1J?=
 =?utf-8?B?MU5xKysvVzlaOVZlalU5b0NUVkZ2YjIxS2tQQ2d3UUw3aFM0eEUzMFhjYUFX?=
 =?utf-8?B?YjFKMWpkVHEwUk5tdnpJVTIra3RjS3hDSUpyd3dxMFRnQ29IZEtFVFg5VUFH?=
 =?utf-8?B?TEMrUGNQOVN1c2FpeFdYVEg3MUhzV0oxOStSeThmQVJ5VmF1VjEzQ2pTdGtj?=
 =?utf-8?B?cnBycjRxbmp3VytCV0ZGeThISWxGdEdZbnJJY3BLaE9EU2ZtbUQwSjNqMWU5?=
 =?utf-8?B?T201U3AzMUU3QTVmVkRkd1FlR2tJUjZjT09WL2JmSUx2elVybUpSQnVqbkZW?=
 =?utf-8?B?Ti9IQlAyVXQxVzJzblV1bGswc1U2cUUwVkNOL2NtZ1cvSks2bGxDYU54K2Fy?=
 =?utf-8?B?UlUvUWlmU2xkandFU3UxeVJRYjNkWDdrdFp2T1RmYlFvOTQzcmFrUTJ3dE9R?=
 =?utf-8?B?SGhCZkdvL2l5L2cyNWdUSzVzTmlJZ3d2ckxIekNsd2ZXakJoVWVTYmt0Qnc5?=
 =?utf-8?B?elpyTE41a2U1Vy9wTGFEN21Yc3lUOGpKeXlvS0h0VHU1c0IyZE9qVzZOOWQ3?=
 =?utf-8?B?SE5Gbnk5ZEMvSklLM2VycGdIc2lOUmRpaTcyZTVxMUZvWUFxc01zQTVYQ0Qw?=
 =?utf-8?B?bURsR0lMSEVPYm5XYnRYTktDMGJaRERjc0JCdTJhWFlRbUhGSXAyY2VMK0RX?=
 =?utf-8?B?NzUyMERxU3ljT1BiVG9CTlRqZ3BTL00wOEhnNldFWmlGL08vVmxnT3h0T2sz?=
 =?utf-8?B?by8yM0pFMlFnYUppbFV0YWVVUnJ2cUJkVnprZ3Roa3hZQU1QK1FhYjZURWQ4?=
 =?utf-8?B?RjlnRWJhaXZOUHFHVjNzbjY1M2tlN2ptOE1YUHdFbk1Ta0t6TTgyNXo0Z2ZC?=
 =?utf-8?B?dms2b2MrM01UOXZwb3FQT1o5djhJampaS1FNd1oxQUs1OFZSYjJudlNiRG8y?=
 =?utf-8?B?UThnSS9zTldIaUpUcUVUbnpHTW0rOVRpc2U1NEdWOXhvUHJUOGJPL1hPM0gv?=
 =?utf-8?B?aDZPaUVPRG03Vk44RDdJWlNSbnVTZVZTME0vNUtYczRBSnlhTmRCMXlBWDE1?=
 =?utf-8?B?NEpwYWNaMTJkN09Fc2I3WDU4WWJIUWRYTFM4YThZWEt4cWp0TnBhUlFOYlRP?=
 =?utf-8?B?akhLSC9BVFB0cTB5MU95Vk9nR2xEUWhSRno3aUtZME1rQ2NBaUdVTXV3MFVS?=
 =?utf-8?B?SVVwbGNVR2NaNW5PTGZ0Y25CZFpzUUtCcTZyVVRJTEpRL3ZSUFJMUzlYamdS?=
 =?utf-8?B?emUvTjdHUzdaRVpTWCtRYkZ2NGVkNVNrb0MwekovRjV0NmtxQVEwbXJRTWkw?=
 =?utf-8?B?d2llaktieUc5YUlUVFZaSTNiMEV6NUpzSWsxa1pUc0JUSVVxdklHbVdDQmxj?=
 =?utf-8?B?REtaek1pQjFaQzRKaGNsT0tnYVZoQnMzQmFEVDlyaEc0K0JWZXM2TFJ3Y2VT?=
 =?utf-8?B?SzJZclh6Q3h2a3dkYTFTc2V0UDdkTElZa29mRXFEUzFMV2tRS0YwQzlRVlp3?=
 =?utf-8?B?YWcrMEtwV05RV201dkVnZEpRcXR4WWhLY1ZpbmhiR1Q1dzlSaVA5ODd5cDRL?=
 =?utf-8?Q?IFZo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bcaaf82-1873-4a78-f9b2-08dbeb123c6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2023 04:19:35.8782
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ta+0RinubT4dnXlidL4O30Pe+BUU+1aepdLiJP635Vdr6dRZQ6P/CytqcQbBuxX9LhwWKOZkiVaH90+uSiUYcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB9020
Subject: [virtio-comment] RE: [PATCH v3 6/8] admin: Add theory of operation for write recording
 commands

DQoNCj4gRnJvbTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4NCj4gU2VudDogV2Vk
bmVzZGF5LCBOb3ZlbWJlciAyMiwgMjAyMyA5OjQ1IEFNDQo+IA0KPiBPbiBXZWQsIE5vdiAyMiwg
MjAyMyBhdCAxMjoyNuKAr0FNIFBhcmF2IFBhbmRpdCA8cGFyYXZAbnZpZGlhLmNvbT4gd3JvdGU6
DQo+ID4NCj4gPg0KPiA+ID4gRnJvbTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4N
Cj4gPiA+IFNlbnQ6IFR1ZXNkYXksIE5vdmVtYmVyIDIxLCAyMDIzIDk6NTUgQU0NCj4gPiA+DQo+
ID4gPiBPbiBGcmksIE5vdiAxNywgMjAyMyBhdCAxMTowMuKAr0FNIFBhcmF2IFBhbmRpdCA8cGFy
YXZAbnZpZGlhLmNvbT4NCj4gd3JvdGU6DQo+ID4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+DQo+ID4g
PiA+ID4gRnJvbTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4NCj4gPiA+ID4g
PiBTZW50OiBUaHVyc2RheSwgTm92ZW1iZXIgMTYsIDIwMjMgMTE6NTEgUE0NCj4gPiA+ID4gPg0K
PiA+ID4gPiA+IE9uIFRodSwgTm92IDE2LCAyMDIzIGF0IDA1OjI5OjQ5UE0gKzAwMDAsIFBhcmF2
IFBhbmRpdCB3cm90ZToNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IEZyb206IE1pY2hhZWwg
Uy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+DQo+ID4gPiA+ID4gPiA+IFNlbnQ6IFRodXJzZGF5
LCBOb3ZlbWJlciAxNiwgMjAyMyAxMDo1NiBQTQ0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4g
PiBPbiBUaHUsIE5vdiAxNiwgMjAyMyBhdCAwNDoyNjo1M1BNICswMDAwLCBQYXJhdiBQYW5kaXQg
d3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gPiBGcm9tOiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEBy
ZWRoYXQuY29tPg0KPiA+ID4gPiA+ID4gPiA+ID4gU2VudDogVGh1cnNkYXksIE5vdmVtYmVyIDE2
LCAyMDIzIDU6MTggUE0NCj4gPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPiBPbiBU
aHUsIE5vdiAxNiwgMjAyMyBhdCAwNzo0MDo1N0FNICswMDAwLCBQYXJhdiBQYW5kaXQNCj4gd3Jv
dGU6DQo+ID4gPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gRnJvbTogTWlj
aGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4NCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiBT
ZW50OiBUaHVyc2RheSwgTm92ZW1iZXIgMTYsIDIwMjMgMTowNiBQTQ0KPiA+ID4gPiA+ID4gPiA+
ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gT24gVGh1LCBOb3YgMTYsIDIwMjMgYXQgMTI6
NTE6NDBBTSAtMDUwMCwgTWljaGFlbCBTLg0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+IFRzaXJraW4N
Cj4gPiA+IHdyb3RlOg0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gT24gVGh1LCBOb3YgMTYsIDIw
MjMgYXQgMDU6Mjk6NTRBTSArMDAwMCwgUGFyYXYNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IFBh
bmRpdA0KPiA+ID4gd3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IFdlIHNob3VsZCBl
eHBvc2UgYSBsaW1pdCBvZiB0aGUgZGV2aWNlIGluIHRoZQ0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+
ID4gPiBwcm9wb3NlZA0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+IFdSSVRFX1JFQ09SRF9DQVBfUVVF
UlkgY29tbWFuZCwgdGhhdCBob3cgbXVjaA0KPiByYW5nZQ0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+
IGl0IGNhbg0KPiA+ID4gPiA+ID4gPiB0cmFjay4NCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4g
U28gdGhhdCBmdXR1cmUgcHJvdmlzaW9uaW5nIGZyYW1ld29yayBjYW4gdXNlIGl0Lg0KPiA+ID4g
PiA+ID4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiBJIHdpbGwgY292
ZXIgdGhpcyBpbiB2NSBlYXJseSBuZXh0IHdlZWsuDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPg0K
PiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gSSBkbyB3b3JyeSBhYm91dCBob3cgdGhpcyBjYW4gZXZl
biB3b3JrIHRob3VnaC4gSWYNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IHlvdSB3YW50IGEgZ2Vu
ZXJpYyBkZXZpY2UgeW91IGRvIG5vdCBnZXQgdG8NCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IGRp
Y3RhdGUgaG93IG11Y2ggbWVtb3J5DQo+ID4gPiA+ID4gVk0gaGFzLg0KPiA+ID4gPiA+ID4gPiA+
ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IEFyZW4ndCB3ZSB0YWxraW5nIGJpdCBw
ZXIgcGFnZT8gV2l0aCAxVEJ5dGUgb2YNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IG1lbW9yeSB0
byB0cmFjaw0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gLT4gMjU2R2JpdCAtPiAzMkdiaXQgLT4g
OEdieXRlIHBlciBWRj8NCj4gPiA+ID4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+ID4g
PiA+IFVnaC4gQWN0dWFsbHkgb2YgY291cnNlOg0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+IFdpdGgg
MVRCeXRlIG9mIG1lbW9yeSB0byB0cmFjayAtPiAyNTZNYml0IC0+IDMyTWJpdA0KPiA+ID4gPiA+
ID4gPiA+ID4gPiA+IC0+IDhNYnl0ZSBwZXIgVkYNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPg0KPiA+
ID4gPiA+ID4gPiA+ID4gPiA+IDhHYnl0ZSBwZXIgKlBGKiB3aXRoIDFLIFZGcy4NCj4gPiA+ID4g
PiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+ID4gPiBEZXZpY2UgbWF5IG5vdCBtYWludGFp
biBhcyBhIGJpdG1hcC4NCj4gPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPiBIb3dl
dmVyIHlvdSBtYWludGFpbiBpdCwgdGhlcmUncyAyNTZNZWdhIGJpdCBvZiBpbmZvcm1hdGlvbi4N
Cj4gPiA+ID4gPiA+ID4gPiBUaGVyZSBtYXkgYmUgb3RoZXIgZGF0YSBzdHJ1Y3R1cmVzIHRoYXQg
ZGV2aWNlIG1heSBkZXBsb3kNCj4gPiA+ID4gPiA+ID4gPiBhcyBmb3IgZXhhbXBsZQ0KPiA+ID4g
PiA+ID4gPiBoYXNoIG9yIHRyZWUgb3Igc29tZXRoaW5nIGVsc2UuDQo+ID4gPiA+ID4gPiA+DQo+
ID4gPiA+ID4gPiA+IFBvaW50IGJlaW5nPw0KPiA+ID4gPiA+ID4gVGhlIGRldmljZSBtYXkgaGF2
ZSBzb21lIGhhc2hpbmcgYWNjZWxlcmF0b3Igb3Igb3RoZXINCj4gPiA+ID4gPiA+IGltcHJvdmVt
ZW50cyB0aGF0DQo+ID4gPiA+ID4gbWF5IHBlcmZvcm0gYmV0dGVyIHRoYW4gYml0bWFwIGFzIG1h
bnkgcXVldWVzIGluIHBhcmFsbGVsDQo+ID4gPiA+ID4gYXR0ZW1wdCB0byB1cGRhdGUgdGhlIHNo
YXJlZCBkYXRhYmFzZS4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IE1heWJlLCBJIGRpZG4ndCBnaXZl
IHRoaXMgdGhvdWdodC4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IE15IHBvaW50IHdhcyB0aGF0IHRv
IGJlIGFibGUgdG8ga2VlcCBhbGwgY29tYmluYXRpb25zIG9mDQo+ID4gPiA+ID4gZGlydHkvbm9u
IGRpcnR5IHBhZ2UgZm9yIGVhY2ggNGsgcGFnZSBpbiBhIDFUQnl0ZSBndWVzdCBkZXZpY2UNCj4g
PiA+ID4gPiBuZWVkcyA4TUJ5dGVzIG9mIG9uLWRldmljZSBtZW1vcnkgcGVyIFZGLiBBcyBkZXNp
Z25lZCB0aGUgcXVlcnkNCj4gPiA+ID4gPiBhbHNvIGhhcyB0byByZXBvcnQgaXQgZm9yIGVhY2gg
VkYgYWNjdXJhdGVseSBldmVuIGlmIG11bHRpcGxlIFZGcyBhcmUNCj4gYWNjZXNzaW5nIHNhbWUg
Z3Vlc3QuDQo+ID4gPiA+IFllcy4NCj4gPiA+ID4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPg0K
PiA+ID4gPiA+ID4gPiA+IEFuZCB0aGlzIGlzIHJ1bnRpbWUgbWVtb3J5IG9ubHkgZHVyaW5nIHRo
ZSBzaG9ydCBsaXZlDQo+ID4gPiA+ID4gPiA+ID4gbWlncmF0aW9uIHBlcmlvZCBvZg0KPiA+ID4g
PiA+ID4gPiA0MDBtc2VjIG9yIGxlc3MuDQo+ID4gPiA+ID4gPiA+ID4gSXQgaXMgbm90IHNvbWUg
X2Fsd2F5c18gcmVzaWRlbnQgbWVtb3J5Lg0KPiA+ID4NCj4gPiA+IFdoZW4gZGV2ZWxvcGluZyB0
aGUgc3BlYywgd2Ugc2hvdWxkIG5vdCBoYXZlIGFueSBhc3N1bXB0aW9uIGZvciB0aGUNCj4gPiA+
IGltcGxlbWVudGF0aW9uLiBGb3IgZXhhbXBsZSwgeW91IGNhbid0IGp1c3QgYXNzdW1lIHZpcnRp
byBpcyBhbHdheXMNCj4gPiA+IGVtdWxhdGVkIGluIHRoZSBzb2Z0d2FyZSBpbiB0aGUgRFBVLg0K
PiA+ID4NCj4gPiBUaGVyZSBpcyBubyBzdWNoIGFzc3VtcHRpb24uDQo+ID4gSXQgaXMgc3VwcG9y
dGVkIG9uIG5vbiBEUFUgZGV2aWNlcyB0b28uDQo+IA0KPiBZb3UgbWVhbnQgZS5nIGEgOE1CIG9u
LWNoaXAgcmVzb3VyY2UgcGVyIFZGIGlzIGdvb2QgdG8gZ28/DQo+DQpJdCBpcyB0aGUgZGV2aWNl
IGltcGxlbWVudGF0aW9uIGRldGFpbC4gTWF5YmUgaXQgdXNlcyA4TUIsIG1heSBiZSBub3QuDQpB
bmQgaWYgeW91IGFyZSBnb2luZyB0byBjb21wYXJlIGFnYWluIHdpdGggc2xvdyByZWdpc3RlcnMg
bWVtb3J5LCBpdCBpcyBub3QgYXBwbGUgdG8gYXBwbGUgY29tcGFyaXNvbiBhbnl3YXkuDQoNCk5v
biBEUFUgZGV2aWNlIG1heSBoYXZlIHN1Y2ggbWVtb3J5IGZvciBkYXRhIHBhdGggYWNjZWxlcmF0
aW9uLg0KIA0KPiA+DQo+ID4gPiBIb3cgY2FuIHlvdSBtYWtlIHN1cmUgeW91IGNhbiBjb252ZXJn
ZSBpbiA0MDBtcyB3aXRob3V0IGhhdmluZyBhDQo+ID4gPiBpbnRlcmZhY2UgZm9yIHRoZSBkcml2
ZXIgdG8gc2V0IHRoZSBjb3JyZWN0IHBhcmFtZXRlciBsaWtlIGRpcnR5IHJhdGVzPw0KPiA+DQo+
ID4gNDAwbXNlYyBpcyBhbHNvIHdyaXR0ZW4gYW55d2hlcmUgYXMgcmVxdWlyZW1lbnQgaWYgdGhp
cyBpcyB3aGF0IHlvdSB3YW50IHRvDQo+IGFyZ3VlIGFib3V0Lg0KPiANCj4gTm8sIHRoZSBkb3du
dGltZSBuZWVkcyB0byBjb29yZGluYXRlIHdpdGggdGhlIGh5cGVydmlzb3IsIHRoYXQgaXMgd2hh
dCBJDQo+IHdhbnQgdG8gc2F5LiBVbmZvcnR1bmF0ZWx5LCBJIGRvbid0IHNlZSBhbnkgaW50ZXJm
YWNlIGluIHRoaXMgc2VyaWVzLg0KPiANCldoYXQgZG8geW91IG1lYW4gYnkgY29vcmRpbmF0ZWQ/
DQpUaGlzIHNlcmllcyBoYXMgbWVjaGFuaXNtIHRvIGVsaW1pbmF0ZSB0aGUgZG93bnRpbWUgb24g
c3JjIGFuZCBkc3Qgc2lkZSBkdXJpbmcgZGV2aWNlIG1pZ3JhdGlvbiBkdXJpbmcgcHJlLWNvcHkg
cGhhc2UuDQoNCj4gPiBUaGVyZSBpcyBub3RoaW5nIHByZXZlbnRzIHRvIGV4dGVuZCB0aGUgaW50
ZXJmYWNlIHRvIGRlZmluZSB0aGUgU0xBIGFzDQo+IGFkZGl0aW9uYWwgY29tbWFuZHMgaW4gdGhl
IGZ1dHVyZSB0byBpbXByb3ZlIHRoZSBzb2x1dGlvbi4NCj4gPg0KPiA+IFRoZXJlIGlzIG5vIG5l
ZWQgdG8gYm9pbCB0aGUgb2NlYW4gbm93LiBPbmNlIHRoZSBiYXNlIGluZnJhc3RydWN0dXJlIGlz
DQo+IGJ1aWx0LCB3ZSB3aWxsIGltcHJvdmUgaXQgZnVydGhlci4NCj4gPiBBbmQgcHJvcG9zZWQg
cGF0Y2hlcyBhcmUgcmVhc29uYWJseSB3ZWxsIGNvdmVyZWQgdG8gb3VyIGtub3dsZWRnZS4NCj4g
DQo+IFdlbGwsIGl0IGlzIG5vdCBtZSBidXQgeW91IHRoYXQgY2xhaW1zIGl0IGNhbiBiZSBkb25l
IGluIDQwMG1zLiBJJ20gd29uZGVyaW5nDQo+IGhvdyBhbmQgeW91IHRvbGQgbWUgaXQgY291bGQg
YmUgZG9uZSBpbiB0aGUgZnV0dXJlPw0KPg0KSW4gb3VyIHRlc3RzIGl0IGlzIG5lYXIgdG8gdGhp
cyBudW1iZXIuDQpUaGUgZGlzY3Vzc2lvbiBpcyBhYm91dCBwcm9ncmFtbWluZyB0aGUgU0xBIGFu
ZCB0aGF0IGNhbiBiZSBhbiBleHRlbnNpb24uDQo=

