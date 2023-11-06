Return-Path: <virtio-comment-return-8181-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71192C4332F
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 04:07:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D0E6872348
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 04:07:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C632E986718
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 04:07:20 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BB3849866FC; Mon,  6 Nov 2023 04:07:20 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AD61B9866FE
	for <virtio-comment@lists.oasis-open.org>; Mon,  6 Nov 2023 04:07:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nZFG5MO8tmx7JXlnEExGjnWPM3NgFcyDKhwPpMOqGkBFjXi3ZIIjegS9WTCy/SoQj5SnxyIVRZBNvpDhMJzs0fuh4jnXYVkercxbAuUQB5NnhYGSVliEVAEeiYAXV6ceLcG+IoWqyQrQ6o02PAlO1ZKjSbyR+ICmgLTCPUHUrx0iFixHSvWEDvjtEQknBp6YGeNRtCgfvQLfHtrzQG3kbWmUYxCt/8nVkupZtD5n8NHS82/A3KPVcDn/+WH+GN3gjCAkzb0VA651bC9Xea98bYopKWiO6f7W73uxoogKIQdYmMzy4zTL42BRVXLM+fXU3I+fbsfveUIF9gLChLWiuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bXymjDoXH/TNO19b0OsgWGCs3EdouakqJrFF7rKXCSg=;
 b=fY9Eb6Ye7pfjsDKE6I4FPjNC3CrDlTo7azrTQCy+kqC+W4JwrHMESXcYkxFIVU2bXPB9FoImVezRO6LuoQdbnfc3vXD3NGEKkgIpNPUbk+vIGwIM1IzCzc+wGBqaMneUXBQ74EceEa6PNyz7FgXHuW2RKRlGt3do0HWm6p0Pmaef8FI0Wm2USduLcL5Adhxv0O/SO571sbYGAT0QcGQMgLIOdeWf9JyOpa5sM9xog0xpjjDTf2joi7MQldD6Jx9yemh/DpSY+gJDPPi2USn09S4egnjPWsIAuTD2xPoQv+K9iKx46IlB5t8Qb/plty6KoLBVCs6relTnjq5bAOKJtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "stefanha@redhat.com" <stefanha@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
Thread-Topic: [PATCH V2 2/6] virtio: introduce SUSPEND bit in device status
Thread-Index: AQHaDkFjjjC0DC7RqE21KFAcdDb+trBob5HQgAA/agCAAA+P0IAD59oAgAAJz5A=
Date: Mon, 6 Nov 2023 04:07:16 +0000
Message-ID:
 <PH0PR12MB5481CD22F4AFF3DFA7F53B91DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-3-lingshan.zhu@intel.com>
 <PH0PR12MB54814E8B9E7D16C9EF421C82DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <78f206cd-1e07-4c20-a281-1ddf74cf4d84@intel.com>
 <PH0PR12MB5481F05E5A952E9A43B96F73DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <8eb1a4c5-eb7d-4f8d-8afd-4aab5559a8d6@intel.com>
In-Reply-To: <8eb1a4c5-eb7d-4f8d-8afd-4aab5559a8d6@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|PH0PR12MB5647:EE_
x-ms-office365-filtering-correlation-id: 0b6bf071-16c9-4ad6-0280-08dbde7ddcd5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 nfn9VB4Nhi/756DgG5gHXRGs76/ptbmhYIxFIfJuinM9n1lAgF2qx3UbZH3T8UiLtWF4H5n80OYR2lFRHBsQ4R9TrOUOxF2zhynIUkF/bOKs7ja6+UY1L6c/MOYz6QN+1MUEt/VvgKuX0ZozS5mM2fNMTGYxaVHaVBktCesuvrgr5zDc12EVSJaTggqYSB/CRJXxnebkix0E6Gv8XQ7ZW0+/tWHD+QVNGxna7JwsKEGTsGK3YEpqzP8VP2tJuzVI/RdWhBGIVlXVXDX3pHjlGB+9mBapHlxcPzIoPK0nhpt0JNqZIGp95V444POsgeba0ufUi7RFoGlneZKS0GSBOz5kZwMKmiM6t45q6uBA4opRLzM2VPRfmaes1cYZQuCJnKlYgKY9iVgpHUe614NltAGog59ORBmzU1XbwqlOKRwLSH6q+DVXWIAiG5lyqg9Pmh62gYx3Hg3uIfPOUcCe19+NJOYmNajg53pILN9n5QiwU7SuDzficqS36d07kqpnNlwNK/Hz7tlyy3lJALIFE74pjLZFDHIETBxyDWVQQvKSwELGPQ6PkCWs5TLSwc9xjNEFgmeMMCZ8/QCRUvWU8tokUKQ4zt0x1BEGDfhVh/Vvk0OK7xwPPpJ9Kr29Bc5vPROljXwdfl/boqWAtusCpQEqdI0S8u/oAV4Cs/IZ0nU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39860400002)(396003)(346002)(366004)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(55016003)(26005)(71200400001)(7696005)(6506007)(53546011)(83380400001)(9686003)(2906002)(41300700001)(52536014)(5660300002)(8676002)(4326008)(8936002)(15650500001)(966005)(478600001)(110136005)(316002)(66556008)(66476007)(64756008)(66946007)(66446008)(76116006)(33656002)(122000001)(86362001)(38100700002)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Rm8yWEl3TWdFYkZET1FJSXVwTDZCMmlWVUQxcEZWaklNdXBGWWl2dXg2MWVS?=
 =?utf-8?B?ZVVuMHVvcVRLSEUwbU1JWlMzL3NjZm5nSXhjR1FhRk5kNGdKazhvQXRvKzVY?=
 =?utf-8?B?YVR6cSsvN25CbXZjdTNIVjhmYTNkbmg2MmozNjNvS3QzYkQxNmkyd0QyM1Ur?=
 =?utf-8?B?bXB2bW1nbGluUDZMNi9kVUpqMUxFRUlVVjh5YloyYWgxb1VZZ2ZNMzNlc2x0?=
 =?utf-8?B?ZFloNElCbFYxejU0WGl6OEpDR2tEUllUa1ZFd2N0MlpWSVpZS2JyUjN5VnFU?=
 =?utf-8?B?QkZJRjE1cEwwV0UrK2tiMzdnY0ljRHhrRjhzZW54VG5PdlhLaDE4ZnlKUW8x?=
 =?utf-8?B?dTV1TDBtL0N4bWJYTGZNNlJYaUFMc2JYRnp3NTBORUZ3aFROZFpYK2tnanZO?=
 =?utf-8?B?aW82ZnRoMFNtNGVybUthQS8wNjR3b3BEWDcwbUNSQURuQWZ0WmZPa2lsZVdz?=
 =?utf-8?B?UnMvVCsxWWlicHBtYklJNVo3Z211Y3N0MmZ0UEJhQnBMSEV2SENpT1ZTV05D?=
 =?utf-8?B?NzE1elNpdXVrWHRTTk5HQXc5NTAzY3lseWM2TXRSSmpsZHAyQXpKSGVvMThq?=
 =?utf-8?B?NktEcTJFOWhSRmhNU2wxSGJ2Qmt0QnNBa1B2K1E1M3VMWXFOcnRBSmdrbkcx?=
 =?utf-8?B?MWhid0ZVODhyUGkyU3poZWZLaSszUlNTNmtxU1lPS3dJVDdxSHlEaVZLUnBk?=
 =?utf-8?B?T2UzKy9NeUhJdG5XaDZwUjRoUEhnTHBsZTBISkpMWDFVanl0UUE4WUNneEo3?=
 =?utf-8?B?NkNNdVIrcFRrdUpWbmYzcTRmTDNuQ0JEMXArWDVmTXM1TXJCZXdGYVFtMDFI?=
 =?utf-8?B?WHpRYW1kb1pPb2dYNFFldnE2dzhaajNaR3BGSmJudDdWNHpibmxUdVRlVDVK?=
 =?utf-8?B?V3daOW1ITUJXVFZnWWVyblN5c3JXOHE4WGRsVHRjYUFzREhBUHU3eENVaHJt?=
 =?utf-8?B?UVZiU3lHY0dTenhJY0dNdHdsKzVBTGlNdWUrL3JKZVVhUlBpaGtWUllWVllX?=
 =?utf-8?B?Rk9HQnNWL2p2QVllVHlXdytLczBRbmhleUpiRkcyUndqdUcvYjgvT3IxSGhJ?=
 =?utf-8?B?NFdGcDdxaGx4bHd3WHhiSkZ5dXRJeGNkWllad09LbURqRHZFSStHVHU1ZVMr?=
 =?utf-8?B?Mkpzaml2Qm9tTWRyOHBiUk9BSXJnRHFlUkxuT0Rjbzg5dUpEOFBlZWF1R3Jk?=
 =?utf-8?B?TDF0T1JDOG95Nm1hd1Z2bXFwVDU5a3YzcEVqT0l1NG83SWdXaC9BYml4bFpF?=
 =?utf-8?B?bENITlZheXQ1NzhTUWIwZ3ovb1NvZzFQdTN1bzVnb01SUkVKc0dDOGdzWHhF?=
 =?utf-8?B?ekZwa0JZcUtWY3UrVWFybkhqcG1tZy9MRTlLQVg2RVVLVU5EQ3JWNDk3VFU5?=
 =?utf-8?B?NE1vTkkrdDF2cWdhSGV5M1htaTk1dnFRQ2FnaVh1ajRodmNTQlUwSlF4SkVQ?=
 =?utf-8?B?U2hxdEQyVWFSTFJWakNOR1hZQS9FNUxTZk0wbkdzanVYa2Z3dXJTeGovRm1s?=
 =?utf-8?B?M1JydytCWkd6TXp5Qk10NXlhd045VjcyT3Zwb0x0QWJ5RGl2YmRpK085b0ti?=
 =?utf-8?B?Z0lacEppM3l6WHd2QkR5RGh3dm9lTE1RNkcwbStYN3V3MDhrcUFacmZoV282?=
 =?utf-8?B?QnVBdjdNNGQ1WXdvaW85aStlcFdPdy9ndnhWOGRSazNQOWFOalZPaitJVVZD?=
 =?utf-8?B?eTRVY2ZDckdnOUlpelhPTlZMWkx5QWFBdElER0gxZHlmeTN6M2VuZ1V4eUVH?=
 =?utf-8?B?NHNHQnhXUElmRzNxNTVmajE4UkRyREY2WCtla24rVE1sWUVYOEVwZ1cxNXZ5?=
 =?utf-8?B?bkcxTjdGeGVNZU01YUllbWVQVU5PTVFDR0tZN2F6TlJmQ3hCempGZm5HOWNt?=
 =?utf-8?B?cXpROHlIU2VzeXZrMXhTdEd2SXhpUjhWVnJOc1VLOWQ3bmlTUXluZkdubDA0?=
 =?utf-8?B?dzVKT3VYbWpvQSs1ZCtFM2NnU2NCbDZmUEtNNTdxNUxFNVJhS3F0UHYweEc5?=
 =?utf-8?B?bEEyK2xibWVZeGQzZHFQRjlxUXNQNlpxUnE4Qzcvc2Y5K1V2VEU0ZEp0S0tR?=
 =?utf-8?B?VXE0L3dTdEkwNjZuZmdGSzJnd1Z3bGhZNjlQVWFYcTVKVW5OdlpVNSs4ZVZI?=
 =?utf-8?Q?zkMQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b6bf071-16c9-4ad6-0280-08dbde7ddcd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2023 04:07:16.0226
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V9w+84lJkd1g/0FZb9/EBMjywt4q1+O6NyN8ciD+wwZzncSGkdzH8P4orOvSnARYsWcI9n/twTU9c+KWJ0hMlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5647
Subject: [virtio-comment] RE: [PATCH V2 2/6] virtio: introduce SUSPEND bit in device status

DQo+IEZyb206IFpodSwgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+DQo+IFNlbnQ6
IE1vbmRheSwgTm92ZW1iZXIgNiwgMjAyMyA5OjAwIEFNDQo+IA0KPiBPbiAxMS8zLzIwMjMgMTE6
NTQgUE0sIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPj4gRnJvbTogWmh1LCBMaW5nc2hhbiA8bGlu
Z3NoYW4uemh1QGludGVsLmNvbT4NCj4gPj4gU2VudDogRnJpZGF5LCBOb3ZlbWJlciAzLCAyMDIz
IDg6MjUgUE0NCj4gPj4NCj4gPj4gT24gMTEvMy8yMDIzIDc6MzUgUE0sIFBhcmF2IFBhbmRpdCB3
cm90ZToNCj4gPj4+PiBGcm9tOiBaaHUgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+
DQo+ID4+Pj4gU2VudDogRnJpZGF5LCBOb3ZlbWJlciAzLCAyMDIzIDQ6MDUgUE0NCj4gPj4+Pg0K
PiA+Pj4+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBhIG5ldyBzdGF0dXMgYml0IGluIHRoZSBkZXZp
Y2Ugc3RhdHVzOiBTVVNQRU5ELg0KPiA+Pj4+DQo+ID4+Pj4gVGhpcyBTVVNQRU5EIGJpdCBjYW4g
YmUgdXNlZCBieSB0aGUgZHJpdmVyIHRvIHN1c3BlbmQgYSBkZXZpY2UsIGluDQo+ID4+Pj4gb3Jk
ZXIgdG8gc3RhYmlsaXplIHRoZSBkZXZpY2Ugc3RhdGVzIGFuZCB2aXJ0cXVldWUgc3RhdGVzLg0K
PiA+Pj4+DQo+ID4+Pj4gSXRzIG1haW4gdXNlIGNhc2UgaXMgbGl2ZSBtaWdyYXRpb24uDQo+ID4+
Pj4NCj4gPj4+PiBTaWduZWQtb2ZmLWJ5OiBaaHUgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBpbnRl
bC5jb20+DQo+ID4+Pj4gU2lnbmVkLW9mZi1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0
LmNvbT4NCj4gPj4+IFlvdSBjb25zdGFudGx5IGNvbXBsYWluZWQgdGhhdCB3aGF0ZXZlciB3YXMg
cHJvcG9zZWQgdXNpbmcgYWRtaW4NCj4gPj4gY29tbWFuZHMgbWV0aG9kIGluIFsxXSBtdXN0IHdv
cmsgZm9yIHBhc3N0aHJvdWdoIGFuZCBub24tcGFzc3Rocm91Z2guDQo+ID4+PiBBbmQgaGFsZndh
eSBpbiB0aGUgZGlzY3Vzc2lvbiB5b3UgcHJvcG9zZSBhIG1ldGhvZCBhZnRlciBsZWFybmluZw0K
PiA+Pj4gYWxsIHRoZQ0KPiA+PiBsaW1pdGF0aW9ucyBvZiBpbi1iYW5kLCB5b3UgcHJvcG9zZSBh
IHNvbHV0aW9uIG9ubHkgd29ya3MgZm9yDQo+ID4+IG5vbi1wYXNzdGhyb3VnaCBtb2RlLg0KPiA+
Pj4gWW91IGFza2VkIHNvbWVvbmUgdG8gaGF2ZSBjb21wcmVoZW5zaXZlIHByb3Bvc2FsIGFuZCB3
aGVuIGl0IGNvbWVzDQo+ID4+PiB0bw0KPiA+PiB5b3UgZm9sbG93aW5nIGl0LCB5b3UganVzdCBk
b27igJl0Lg0KPiA+PiBub3Qgc3VyZSB3aGF0IHlvdSBhcmUgdGFsa2luZyBhYm91dC4NCj4gPj4+
IEFuZCBoYXZlIG1vc3Qgc2hhbGxvdyBjb21taXQgbWVzc2FnZSB0byBub3QgZXZlbiBtZW50aW9u
IGl0Lg0KPiA+Pj4NCj4gPj4+IFBsZWFzZSBiZSBjb25zaXN0ZW50IGluIGRlc2lnbiBhcHByb2Fj
aC4NCj4gPj4+IEFuZCBpZiB5b3UgZG9u4oCZdCB3YW50IHRvIGJlLCBzdG9wIGFza2luZyBvdGhl
cnMuDQo+ID4+IHRoaXMgU1VTUEVORC9SRVNVTUUgZG9lc24ndCBjaGFuZ2Ugc2luY2UgdGhlIFJG
QyBzZXJpZXMsIGhvdyBjYW4gaXQNCj4gPj4gbm90IGJlIGluY29uc2lzdGVudD8/Pw0KPiA+Pj4g
VGhpcyBpcyBub3QgdGhlIHdheSBUQyBjb2xsYWJvcmF0aW9uIHdvcmtzLg0KPiA+Pj4gSSBwcm9i
YWJseSBzaG91bGRu4oCZdCBldmVuIGV4cGVjdCB0aGlzIGZyb20geW91Lg0KPiA+IFlvdXIgcHJv
cG9zYWwgZG9lcyBub3QgY292ZXIgYm90aCB0aGUgdXNlIGNhc2VzIG9mIHBhc3N0aHJvdWdoIGFu
ZCBub24tDQo+IHBhc3N0aHJvdWdoLg0KPiA+IFlldCB5b3Uga2VwdCBkZW1hbmRpbmcgdGhlbSBm
b3Igb3RoZXJzLg0KPiA+IFRoaXMgaXMganVzdCB3cm9uZy4NCj4gPg0KPiA+IEkgYW0gYXdhcmUg
dGhhdCBib3RoIG1vZGVscyBhcyB0ZWNobmljYWwgcHJvcyBhbmQgY29ucy4NCj4gV2h5IHRoaXMg
ZG9lc24ndCB3b3JrPyB0aGUgZGV2aWNlIHN0YXR1cyBieXRlIGhhcyBiZWVuIHdvcmtpbmcgZm9y
IG1hbnkNCj4geWVhcnMsIGFuZCBkbyB5b3Uga25vdyB3aGVuIGd1ZXN0IGZyZWV6ZSwgdGhlIGh5
cGVydmlzb3Igb3ducyB0aGUgZGV2aWNlPz8/Pw0KDQpXaGVuIHRoZSBndWVzdCBpcyBub3QgZnJv
emVuIGFuZCBkdXJpbmcgdGhlIHByZS1jb3B5IHBoYXNlLCBoeXBlcnZpc29yIG5lZWRzIHRvIGFj
Y2VzcyB0aGUgZGV2aWNlIChjb250ZXh0LCBkaXJ0eSBwYWdlcykuDQpIb3cgZG9lcyBpdCB3b3Jr
IGlmIHRoZSBndWVzdCBvd25zIHRoZSBkZXZpY2U/DQoNCj4gPg0KPiA+Pj4gWzFdDQo+ID4+PiBo
dHRwczovL2xpc3RzLm9hc2lzLW9wZW4ub3JnL2FyY2hpdmVzL3ZpcnRpby1jb21tZW50LzIwMjMx
MC9tc2cwMDQ3Mg0KPiA+Pj4gLmgNCj4gPj4+IHRtbA0KPiA+PiBQbGVhc2UgZG9uJ3QgYmUgc28g
ZW1vdGlvbmFsIGFuZCBwbGVhc2UgYmUgcHJvZmVzc2lvbmFsLg0KPiA+Pg0KPiA+PiBXaHkgdGhp
cyBzb2x1dGlvbiBjYW4gbm90IHdvcmsgZm9yIHBhc3MtdGhyb3VnaD8gRG8geW91IGtub3cgdGhl
DQo+ID4+IGRldmljZSBvd25lcnNoaXAgd2lsbCBiZSB0cmFuc2ZlcnJlZCB0byB0aGUgaHlwZXJ2
aXNvciB3aGVuIGd1ZXN0DQo+ID4+IHN1c3BlbmRlZCBpbiBsaXZlIG1pZ3JhdGlvbj8NCj4gPiBJ
IGV4cGxhaW5lZCA1IHJlYXNvbnMgd2h5IGl0IGRvZXMgbm90IHdvcmsgaW4gcHJldmlvdXMgcmVw
bHkuDQo+ID4NCj4gPiBBcyB0aGUgd29yZCBpbmRpY2F0ZXMgImxpdmUgbWlncmF0aW9uIiwgdGhl
IGh5cGVydmlzb3IgbmVlZHMgdG8gYWNjZXNzIHRoZQ0KPiBkZXZpY2Ugd2hlbiBpdCBpcyAibGl2
ZSIgKG5vdCBqdXN0IGFmdGVyKS4NCj4gPiBIZW5jZSwgcGFzc3Rocm91Z2ggbW9kZSBtdXN0IGJl
IGFibGUgdG8gY2FwdHVyZSB0aGUgc3RhdGUgb2YgdGhlIGRldmljZSBhbmQNCj4gZGlydHkgcGFn
ZXMgZGF0YWJhc2Ugd2hlbiBpdHMgbGl2ZS4NCj4gPiAoYW5kIGFmdGVyIHRoZSBzb3VyY2UgaXMg
c3VzcGVuZGVkKS4NCj4gTm8sIHRoZSBoeXBlcnZpc29yIHNob3VsZCBvbmx5IGNvbGxlY3QgZGly
dHkgcGFnZXMgd2hlbiB0aGUgZGV2aWNlIGFsaXZlLg0KDQpJdCBpcyBuZWVkZWQgZHVyaW5nIGJv
dGggdGhlIHRpbWVzLg0KV2hlbiB0aGUgZGV2aWNlIGFuZCBndWVzdCBpcyBsaXZlIGR1cmluZyBw
cmUtY29weSBwaGFzZS4NCkFuZCBhZnRlciB0aGUgZGV2aWNlIGlzIGZyb3plbiwgdG8gZ2V0IHRo
ZSBmaW5hbCByb3VuZCBvZiBwYWdlcy4NCg0KPiBBcyB5b3UgY2FuIHNlZSwgdGhlIGRpcnR5IHBh
Z2UgdHJhY2tpbmcgZmFjaWxpdHkgaGFzIGEgUEFTSUQgZm9yIGlzb2xhdGlvbi4gQnV0IHN0aWxs
LA0KPiB0aGUgcXVlc3Rpb24gaXMsIHdlIHNob3VsZCBiZXR0ZXIgdXNlIHBsYXRmb3JtIGRpcnR5
IHBhZ2UgdHJhY2tpbmcNCj4NCk5vdGhpbmcgdG8gZG8gd2l0aCBQQVNJRCwgYXMgUEFTSUQgaXMg
b3duZWQgYnkgdGhlIGd1ZXN0Lg0KIA0KPiBUaGVuIHN1c3BlbmQgdGhlIGRldmljZSBhZnRlciBn
dWVzdCBmcmVlemUsIHRvIHN0YWJpbGl6ZSB0aGUgZGV2aWNlIHN0YXR1cywgdGhlbg0KPiByZWFk
IHRoZSBzdGF0dXMuDQo+IA0KPiBIb3cgY2FuIHlvdSBzYXkgdGhpcyBkb2VzIG5vdCB3b3JrPz8/
DQpJIGV4cGxhaW5lZCBhYm92ZS4NCg==

