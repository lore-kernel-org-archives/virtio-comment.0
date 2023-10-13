Return-Path: <virtio-comment-return-7721-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6E4CDB483
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 12:00:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 387DF3E564
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 12:00:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E867D986845
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 12:00:19 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id CA4E3986836; Fri, 13 Oct 2023 12:00:19 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BA70C986837
	for <virtio-comment@lists.oasis-open.org>; Fri, 13 Oct 2023 12:00:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FoKQnQLA/1KIr9Njcf8S4yZXeLUQLU1oPHvV78D+whrySLf3ycXivVZSsQhw6jvGQ5ySHPveZh2/wItTuBt8Pwpw5oDqXjP9D/uV+R3C824aIBhYe4c0tvarm1EPWhd4ayxF7SR4tKS+GpWedPA50qkREnYbChsEUioWdKxh8p7q4BAbMZrzTFNr43gDhfuiAC5W94CGjA5hkjZHcYUfXsaZ7cbeDvImtQuKaz6heMRMPge9IwjG2sbi9/hjMN8sfbxve5rVkfecUHl3smfSxzXy+C6KS7eJcCTKuRlRbFXWU28+mMCowPPSgMBIn6bITE4fP5xq1Kce2cubbw85+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8BBlsNkFfPYH3nJ4lF1SUllsFklJQxNXzSvLRKRD5gQ=;
 b=RfAGgxAMwyjLySNN3IYOd9mkpmOV9ZjcMieJPm55oIBeFZurdRcvZj6EudED+JBDWkTxktHrdy/hYLKJeP/KdE3eDcZUsA7H4vp9ShT4VhE9ga66xURNfq5wT1fmTvFDplHNqyHledT1/iXFxycceXmsVAOD5DV3sEUY2XsMFU1o8eu/VaygmdRA6VdtWEgnksyCZ1FSarCkWBTQsl+YAdVJK12DTRntnDPEoQTQbjwweKEuNUvQd3JdV0h8tVLKSmuDlDq/rPGriJvbW6v89L1B//VqgQTYMStHGh5SdrRJILgJJ8LXv9idR+QCBWKr0+Eah+tTWimMXLT/sL7Cvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "Zhu, Lingshan" <lingshan.zhu@intel.com>, Jason Wang
	<jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration
Thread-Index:
 AQHZ+dpD+jj/KUeLHUaMn2y+w39Cb7BBJzcAgAA1HlCAAEi6gIAAERjwgAEF2ACAAAjm4IABoeMAgAAIQWCAAYjxAIAAAHqAgAF80QCAABwfUIAAEX8AgAACyWA=
Date: Fri, 13 Oct 2023 12:00:16 +0000
Message-ID:
 <PH0PR12MB5481F3DD691A02082D7228F7DCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231009121638-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5480E0F15A1BBDD745EE3AF4DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <25375529-9c40-9ea9-692e-f557c514c72f@intel.com>
 <PH0PR12MB54812E59B581546FFB118F3FDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f875fa3b-4b33-71c2-e612-bc2a674a1e59@intel.com>
 <PH0PR12MB548171A06CCE458C913E4961DCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <97aa9108-0715-2483-f5cf-02698c745d60@intel.com>
 <PH0PR12MB5481F4F3B4FADD79770ADEA6DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <4a8bf09e-9aa3-4aec-a20e-8c92f3da3d3c@intel.com>
 <PH0PR12MB5481F0C9549BFCD2EF1C175BDCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231013074226-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231013074226-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|BL1PR12MB5080:EE_
x-ms-office365-filtering-correlation-id: 048aef3b-d464-4b86-2034-08dbcbe3f6f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 tTtfSKLYyPcUFEmTTOFghlJRdNOJ09raUrZFVZ4fBQrJUgzplWpJGzgyRSr+6LYRc4KBNP5N7SZzh5jGpZUFYlN8K0F+rIeuUBXAvMH87x7yzNhepHChGHvA84lEcOjWT74GDW1trhLDgdHS5CO8Dyh8WRbHukQqsELzRh7hfRDNDb8UJqru6lVW+ecGi361ellzeTSI+/zVGAAqpt9pg4rYOMHAvxKm7KxXYHRpcRf67yNzGFW5ivaF30O5UTClPVr/6ThNaoVVkZ0XSBZazEQkAsFc3KuueutOsf7pSIU+QqGLjs6935g2CGD66aHB+MVqOj3P6R+DpdKL/WVzZfShq7se6Ue3BIDzEcVfKX7u7TprgaXTzlGTPBpfjoPUtOjAkDluk6q2VamhK7Pd0PRjYLjSfFdMA8g1hTRex1KWfdAoZchuxO5iufK5NASsKgXRH3vlr9lJ0BNImcsBBI6TSHM3rCPoz9tQsDTciPEl1ntodDSWMnSrw8lZNlr+pJ9m1LTRFgFsicMdFcKDoVfhh39O6UJkhvsh9XXgWnr5Z7yx+zLzLJqi5mXF6d6Vk5XCb/b95kjap+TQfFHDUin2+ALVJWN40OnpFlHOHh/kUUKI6QveRWLOBfZAxz/+
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(346002)(396003)(366004)(136003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(71200400001)(9686003)(6506007)(7696005)(478600001)(83380400001)(107886003)(26005)(2906002)(6916009)(54906003)(64756008)(41300700001)(66446008)(66476007)(66946007)(76116006)(5660300002)(66556008)(4326008)(52536014)(8676002)(8936002)(316002)(33656002)(86362001)(38070700005)(38100700002)(122000001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NXhncndnei9DcUdmQWNyMXl4YjlqTEJYNzNMMzkxcUh6NGRxMlRPbmtJZ0c1?=
 =?utf-8?B?ek8yaU5hNm5FeUo2M01oN0FMbTA2aWxPQloxSWdhMlRJZFQrLy8yd3NRSng5?=
 =?utf-8?B?dFFUK0FHNkdJZ3FJN1RlKzVLcTF1MXRJclcrbTMyYThxc2l2TUIxUzlwRHNq?=
 =?utf-8?B?R2Q4RkpVMDByTWtPRzBFNDY3YWJrV2pveFJvSEQwWTFBaTNrT2lZRC82aSt4?=
 =?utf-8?B?Ukd2VW9EVmZiVHBBU1BkSHNmY2FBYkVFK3VrOHBQZlQxcFVhOWpkY2Z0dzJX?=
 =?utf-8?B?M1RLZUJJOUwvS2NvMGNqRlpCV0RXL0Nva0Y2aWovOVBVZ3RrMkVmVE1Nd1Iy?=
 =?utf-8?B?V29OWE5PSEJGRUlXaVAwOW1HN2ZBV2VJZEZ5bFBrcFpQZnRpdWRJQWVhZ24v?=
 =?utf-8?B?K2FMVlE3Znovd0toSjJXekVxU1VHOXdIVlplRTRZakM4djB4SUZvL0NEOE9h?=
 =?utf-8?B?NHVhaDFEZjBac0tJbUpVNDdIbGtTZFJETkg5TDFENFNOQmpaai9zbE1ldk9O?=
 =?utf-8?B?WWlUOHBqUDd4UHIyZnNZU3d6aEJ2RDUxd3dWakhYbjBubytIYmRoQlpud3gw?=
 =?utf-8?B?Q3Vxb3haS0k3akw5YTcwQ3ZhUUJPY0QweXlNekJ4SUtvSUZ6VnlOQTFZak1C?=
 =?utf-8?B?eXdvK3l4TENBQkdVNGNJV0dIdE1LaVBLL1BlREQ2ZjR5VE1YVVpyb3NqRUJN?=
 =?utf-8?B?QVI1NVYyUmFxMFhSZHhGTVp4dWl1NU5ZN1VKYXBDWGNiYlJqRnh1TUNIY21k?=
 =?utf-8?B?dHBlK0JuVjBoSTFtNjcxeHExSTBCOEt1WStGb2ZLek1Pem1lYk5sS2hPTS83?=
 =?utf-8?B?ZWRPek5DOVNCMkNrYjEzSFUzY0NTYU9seW1nZGxqVmF6Kzg0TU12NVZPZFF3?=
 =?utf-8?B?ejZ6MVQ5TEJ0dVpIODVoV3RGN2FvdDJHRjZKK081enJLakt5QzE1YWttR25l?=
 =?utf-8?B?Wmo5RnArbUczcnR1V3FBb3NBT1gydFlBV2RrUWZGUVlLU0Nmb1Z3cWZWRlZl?=
 =?utf-8?B?dlR4SlEzM1JlWEhjL1hWWk4yR0k1MmVKOTZkOXpCZW1seU5kZkMzWVFvclE4?=
 =?utf-8?B?RUZUVlE5T09FS2N1SzlqM1NzZGp5ZVVuY3BoMmdENk9YcEZLaXZIbmpBcmF5?=
 =?utf-8?B?Z043SUV1S2o0YzlMN2VZZm9aM2JDaWdJS3pseGY5bWo2QlVDVDRMNHpvTTFV?=
 =?utf-8?B?K2V6NXNwbVg1Vmg0R0NDUEk2MWZhQ2VwMGhwRjcyT2h3bjVyT2ZqNS9uSWl5?=
 =?utf-8?B?L1UwcEdKbjQrU284QjErRVlhdlc3a1AwNUdRQ0ttdnA5NUtvdXhSMEdzbVpH?=
 =?utf-8?B?czJBV2tITVk1anJReW5WYjRtZVJ0VjlMVzZQd1k3K3A1QmZMazQ3RFpEekhu?=
 =?utf-8?B?SGgxZlZ4UjZSZldCN3RIQUE3TUwyeVdNMGhCQXMva1hnNDNmZXphc0VORHBk?=
 =?utf-8?B?aXNMeGZSQlFpYXF3eHphak52WmNtdEs5N0tYdHY1eXdPanJrMTI0QUxqcGRj?=
 =?utf-8?B?UUs4c0x0WGF0K2JSQUdMcDAwQkVlU3pvZmJFWjV3bTdYZnpubHVBS2hhV293?=
 =?utf-8?B?S3dOT0ZxcVNBWTk5T2g0WHd3SzRKSHdMWmxKN1pOMG15V2Z0bU13L2hSNDhW?=
 =?utf-8?B?WG9oNDc1UmNiN1lZQVA5RzZVcTlEVHBYZTMxRmFSSTdpZTdIQTU2cEYrcUNO?=
 =?utf-8?B?S1dncUdGbGdnNXVmT0ZoWnFsR0FhaVNUeklwYVhVUG9IZHVoeFhsZlM0VGVp?=
 =?utf-8?B?bURsRkttaC9mcEFMV0JOcmRQZ3R1TXcvNHRQRzdoNTRpQjlYbzZzR2ozVnp3?=
 =?utf-8?B?ZllRNnFKRHNWMGVZcVE0WHhldXgwNDY4QjVPMFdNM2NBYW5hQXVram10QXFU?=
 =?utf-8?B?U2ZYT0ZNUkdIUElCUEFzRjNJbmNXcUgwb2Viajk0UTZEUU02Z3pDbi84MmJu?=
 =?utf-8?B?NXhhUWJDZjZ3aEJsZXhHR2s0S3c0SVo4V0kwUFpvYmI2OEpxMkw5S1pjL0c4?=
 =?utf-8?B?Vys2NHhYM3dtVEhXbGFtbzNLTjV5SkRmMStVdkFMTmNnUFF3WFQ5RW0ySkwv?=
 =?utf-8?B?VzBPWHVNSmx3QUxocUh5c3dQeEkvbWRKTFFFUHpZbk12K2djV2prNldtK2xh?=
 =?utf-8?Q?dZ8E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 048aef3b-d464-4b86-2034-08dbcbe3f6f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2023 12:00:16.4064
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8yTN03LSqT+0Gh1OEAy9N2lOK6OZYHbJseJCcRK/+VtPelACaJZM9wFOZI0XtYoZKS5UVY6ReyC5zyzHrbacRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5080
Subject: RE: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

DQo+IEZyb206IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+DQo+IFNlbnQ6IEZy
aWRheSwgT2N0b2JlciAxMywgMjAyMyA1OjE5IFBNDQo+IA0KPiBPbiBGcmksIE9jdCAxMywgMjAy
MyBhdCAxMToyODo1MEFNICswMDAwLCBQYXJhdiBQYW5kaXQgd3JvdGU6DQo+ID4gPiA+Pj4+IGlu
ZmxpZ2h0IGRlc2NyaXB0b3IgdHJhY2tpbmcgd2lsbCBiZSBpbXBsZW1lbnRlZCBieSBFdWdlbmlv
IGluIFYyLg0KPiA+ID4gPj4+IFdoZW4gd2UgaGF2ZSBuZWFyIGNvbXBsZXRlIHByb3Bvc2FsIGZy
b20gdHdvIGRldmljZSB2ZW5kb3JzLCB5b3UNCj4gPiA+ID4+PiB3YW50IHRvIHB1c2ggc29tZXRo
aW5nIHRvIHVua25vd24gZnV0dXJlIHdpdGhvdXQgcmV2aWV3aW5nIHRoZQ0KPiA+ID4gPj4+IHdv
cms7IGRvZXMgbm90DQo+ID4gPiA+PiBtYWtlIHNlbnNlLg0KPiA+ID4gPj4gRGlkbid0IEkgZXZl
ciBwcm92aWRlIGZlZWRiYWNrIHRvIHlvdT8gUmVhbGx5Pw0KPiA+ID4gPiBOby4gSSBkaWRu4oCZ
dCBzZWUgd2h5IHlvdSBuZWVkIHRvIHBvc3QgYSBuZXcgcGF0Y2ggZm9yIGRpcnR5IHBhZ2UNCj4g
PiA+ID4gdHJhY2tpbmcsDQo+ID4gPiB3aGVuIGl0IGlzIGFscmVhZHkgcHJlc2VudCBpbiB0aGlz
IHNlcmllcy4NCj4gPiBUaGlzIGlzIHBsYWluIGlnbm9yYW5jZSBhbmQgc2hvd3Mgbm9uX2Nvb3Bl
cmF0aXZlIG1vZGUgb2Ygd29ya2luZyBpbg0KPiB0ZWNobmljYWwgY29tbWl0dGVlLg0KPiANCj4g
DQo+IEkgcGVyc29uYWxseSB0aGluayBpdCdzIGZpbmUgdG8gaGF2ZSBtdWx0aXBsZSBwcm9wb3Nh
bHMgb24gdGhlIHRhYmxlLg0KPiBGb3IgZXhhbXBsZSwgY3VycmVudCBaaHUgTGluZ3NoYW4ncyBw
YXRjaCBpcyBjbGVhcmx5IGluY29tcGxldGUgd2l0aG91dA0KPiBtZW1vcnkgY2hhbmdlIHRyYWNr
aW5nLg0KPiBXaHkgc2hvdWxkbid0IGhlIHBvc3QgYSBwYXRjaHNldCBkZW1vbnN0cmF0aW5nIGhv
dyB0aGF0IGlzIHN1cHBvc2VkIHRvIHdvcmsNCj4gaW4gaGlzIHZpZXc/DQo+IEkgYW0gcGVyc29u
YWxseSBpbnRlcmVzdGVkIGluIHNlZWluZyBob3cgaXMgdGhhdA0KPiBzdXBwb3NlZCB0byB3b3Jr
ICAgLSBoaXMgbGF0ZXN0IHByb3Bvc2FsIHJlbGllcyBvbiBtaWdyYXRpbmcgYnkNCj4gdHJhcHBp
bmcgbWVtb3J5IGFjY2Vzc2VzIGJ1dCBETUEgY2FuJ3QgYmUgdHJhcHBlZCBsaWtlIHRoaXMgZ2Vu
ZXJhbGx5Lg0KPiANCj4gSW4gdGhlIGVuZCB3ZSB3YW50IHNvbWV0aGluZyBhZGRyZXNzaW5nIGFs
bCB1c2UgY2FzZXMgdGhvdWdoIGFuZCBpbnRlZ3JhdGluZw0KPiByZWFzb25hYmx5IHdlbGwgd2l0
aCBleGlzdGluZyBlY29zeXN0ZW0uDQoNClRydWUuDQpMZXQgbWUgZml4IGNvbW1lbnRzIG9mIHlv
dXJzIGFuZCBKYXNvbiwgd2hpY2ggaGFzIHNvbWUgaW1wb3J0YW50IHBvaW50cyB0byBjb3ZlciBp
biB2Mi4NCg0K

