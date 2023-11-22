Return-Path: <virtio-comment-return-8535-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF6AC61D92
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 06:32:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A3D2F3357F
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 06:32:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 765DF9868A6
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 06:32:40 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 52D919843C0; Wed, 22 Nov 2023 06:32:40 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 42694986894
	for <virtio-comment@lists.oasis-open.org>; Wed, 22 Nov 2023 06:32:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l4qCjHad5e7jqPaXfcTiG6xYDQS+yXa+cXyk2iVooDXX/6em6+tAYr+nrmZuLtxzK8WfwDbXCtTG59RekNG7aDJN8KM76RYjmgrBByjySyDyxXL3KxZFi47D31eaHGFn/8mUvPzWah1sh2h7FRL+2FRY+4SXQBhl63cyiR8h3Bs9l4MsRTDWcy4mkOCgywIFgwghDnSHCVLh+7iE5fSWvtdDwDE3jRc4zUKhKsbMzajAQ24B/SfZOVFZCMR7FsUrMcUhKhb0ZtQrCBsBuoVxpTmwUtalbsOJgPft34HhtFiziYdh97Ry199MObTD0jQU+8lF4I0Qi3FldBSvNA8lyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gueBfF263TDOXe331If7p4K2DiAtANprOFwp1VPbWjw=;
 b=apSFOyUtMvmh/Jk7Lat1Dkcl25vI+r631WmvuO7OHXx30OM7OPAff8cDYaL5+D4NNwXauSCQfWHO9xjLffvk7tA8P+bKRUagFGbALOpSb14G8GZiZBY4dIU/EPSEegSSW4JZ6ZNSWLyQwxlfEwGDR5qkfMqC32x6Uk1fGf3ZDRK37+D43omNX5aKxz6prdqpFAN5BebnhmkDPafdriGEGU+6gHJhn4LhnW6EGG2cfpJqw+mqKOLN4fWS+vBt1VdEoQLILNHOMb6zmj6DkiN8aixYeffyh9Nr/xd6pj+jZMKk5Vki7aAJT1XEWsqjV0Ipi67BR2cB5oR58LTb2IG7dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
CC: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "eperezma@redhat.com"
	<eperezma@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Thread-Topic: [virtio-comment] RE: [PATCH V2 3/6] virtio: dont reset vqs when
 SUSPEND
Thread-Index:
 AQHaDkFjDoKRbBsYgkWQI+N8LeuYiLBtEIiAgAGML4CAAh3lAIABD20AgAADyiCABdpcAIAD/JZggADHAYCAAANsQIAIDjuAgADmeQCAAIkWgIAADARA
Date: Wed, 22 Nov 2023 06:32:33 +0000
Message-ID:
 <PH0PR12MB5481CCD71A032A6590F14D8FDCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231106044836-mutt-send-email-mst@kernel.org>
 <c6cb6e6b-fd2b-43ac-9be5-c4a8cda1ac13@intel.com>
 <20231108124625-mutt-send-email-mst@kernel.org>
 <b125da70-a769-4662-876b-43664e39c976@intel.com>
 <PH0PR12MB5481577C0492D45C20CF9C62DCAFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvLYgnLtSqx_G=-KMuANEZ=xtAzJjV3pYqAZhA0qqW0sQ@mail.gmail.com>
 <PH0PR12MB54819A6E470D3ABE4BC1F450DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtxm8M5vKfOPOAS347JAJNeRDyPe+nif1LszuRWS0vShQ@mail.gmail.com>
 <PH0PR12MB54810EF71D0BF925F4F81A65DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtsMi9+MgDb=tTH=LrkReb3aZdB4wv-MJkxLmLhNmTDAg@mail.gmail.com>
 <20231121161218-mutt-send-email-mst@kernel.org>
 <CACGkMEuLFxsAZ6W0SdJSEHw4gtgM-aehfC+oTLxH4zHxjMw3vw@mail.gmail.com>
In-Reply-To:
 <CACGkMEuLFxsAZ6W0SdJSEHw4gtgM-aehfC+oTLxH4zHxjMw3vw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA1PR12MB8080:EE_
x-ms-office365-filtering-correlation-id: b590a98f-c607-4667-3f94-08dbeb24cfc9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 XqkiE6eDce6bZSVNECVYA+xdwjKY2v0uvrLUTiXYVRPf9l596vHjc+Xs+dUEaJYN6OVi3CKEq7h4OzCx94jFXvnc8hTSmzCCDCftErtDAc8pYwafqMVVQ2vwqrfJTXHqpiNlhNmD19rGHaQm6bKcIzio+c8S7GUQ/8YKEOxREGGgo6FQdA4NLzKl+zKH0VG/mPx0zbzXUX3bRp70Uc1MGdIUMvUwCmUoaLBPiYs1GYaW38q8AsNB6lQFvf2wv9c84dqPZidxp5g8XBZ7wjtdYfDMmm2ILqoo0C6J7XO9rWwG/UC4q1JHF1X7B3FKXIYEWDTJy5PnOE6qYlSkQ5VhS4i3eVrPRb7bJEEQ/BsduC35qc8b7/W8E+oC7cgbV2KmTLf1gF4AApMEgFJJlQGF/zc0suJcpzJ5k0Z8NGUtU4bIONNTBwRWoswO19Fu68F7jQwwgVYneNSUzBZJpWgy/lcMJlpl1OwhKklVTbiCAq75X6UFfdWd71/9ZTbndsW7CFHNs+dHdNg50S8vrXYtgBmIdCaFVmGs+cx+JItFtugSzbnTTkf1FYIz21leKKG5qDdjYbgl+3lDNh29jS9KV6tpLbEWzsRIcLo8R/Ute6YViAtBIdopksmsGNG7jFbMgHuY/jAI/6T6ETyfsNIhvw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(346002)(366004)(396003)(376002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(86362001)(33656002)(5660300002)(2906002)(15650500001)(8936002)(4326008)(8676002)(110136005)(76116006)(66946007)(66446008)(66556008)(66476007)(316002)(54906003)(64756008)(52536014)(38070700009)(41300700001)(9686003)(26005)(83380400001)(55016003)(71200400001)(6506007)(7696005)(53546011)(38100700002)(122000001)(19627235002)(478600001)(192303002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UVBVTXhORStiWjdDMzd3cVBlZm54Wm1NbDUzcXBkWEMydUNFWjdZSUxvT0lv?=
 =?utf-8?B?WVQ4QllFaEYzUVpPMitzcWN6VDArT0w5T21KR29pd2ZUTUJvRkJHcERZbzBL?=
 =?utf-8?B?ZFN2SDB6dFRqanBYSUFoa2N4WjFoazRxNHk4RzlXa3I1ZS9Ga1RlM2xhelds?=
 =?utf-8?B?QVBZNUFMMDZsa1VabVMxQ1NvYjhyaUY4RmhiZTZjdm56SERGSnVVVkdSRGRj?=
 =?utf-8?B?eXFPL1NjRFczcGxjUGxmWkNLZjMreHBiY0lRYUtWMXNGc3dBTDV5UmJkRFVq?=
 =?utf-8?B?Y0dBRGlEbXVhcmNUWHZnYlFjcEtoN2xoMEJXSTNPRkMzRUlMQ2RKTUcybXFB?=
 =?utf-8?B?ZFBiV21naW13R1J4WlAwd1ZldnpwTERFa2NWcklIRzE1dzdGSHM5L3pjc29E?=
 =?utf-8?B?dzZHdlZ6V2N2clBtOVFRYit1MTdNMTRuNGkybEk3ekNGQTBiV25xcTE0M3lN?=
 =?utf-8?B?bGpQYVFaamloK3BFVWJyUzZyZFBEUVdvdWE3dFdXTlJpMHB5dFJpVENySDRQ?=
 =?utf-8?B?dmFocmRIUGhncDNmZkpuNHZ4NlNiR3plUnBTNGVPUE1lM3NmeG9vc2g1cnRS?=
 =?utf-8?B?M0wvdmlSbGZ3enliVmtoYktFdSsycDdOWnhCQ3REVW95ejZsZnhMZXFRSmF6?=
 =?utf-8?B?Mm42dG8rSUNCZ1B0OTh4dXFJT0UwM0lTM3VoV2pNYSs2Y2FBZE5RNUJvY3JB?=
 =?utf-8?B?YmVaVmh2K0MxWTRGVHkwSGlpNlc4RmJ0cU44akMwQ01zY2YwUVJhaFFDZnhL?=
 =?utf-8?B?TU0vMGJhMnlKK3dhbzlEanFLeDdqdXBDbFkwQ2NrVXBrVUVrOERkNWh4cjR4?=
 =?utf-8?B?VTExQ1paNDVsT1Z2dnMzTjVCeW4vTEs0cVErRlFucURheVRKc0pqVVpkcWVm?=
 =?utf-8?B?VkRlWWU2SUtVWENENlY4dGRYNXhiRFVmVHdScUR5NXFOV1BiRWlLdXhtTHQw?=
 =?utf-8?B?a2dtWVpiZlIxTUg2KzArcmtPS05iOUp2RG9NQlRLYkk1ZXFCbVdYWjJFelpJ?=
 =?utf-8?B?TmUwWVI1YXFCaWhjUk56ZEtUQWNGak9iejBmN29jaHp3d3pRQ0dWaGkvOWl4?=
 =?utf-8?B?MWJEQTg0ZjJaaE9YM0xwTjMyQ2tLSmI4WVU5cVN1MnkvRmpCeC8vTGV4V1RB?=
 =?utf-8?B?UHZkVW81QkhOM0dZVTlqYjlHSkFEODMxSzN0ZUtqTEllR0NOUDdUWFh4L3JN?=
 =?utf-8?B?OWNCMTRHSWdPTE1yS0FURmFLODlSOEpOWDNVM0hiTTJUT3VDRng2dE1hMUFi?=
 =?utf-8?B?NVYzZW1VYUx6OGQzOHgzL1U1UXRJeWttRXA2cks3L3dTczdPNmZreVNVZlV6?=
 =?utf-8?B?dzJZbHpuNUhkc1NZZm96M2xQOCtiblVuV2czV2JJOHM4N0VZaHVjRklqWnMv?=
 =?utf-8?B?L1czMEM1QlpNcEh0dVVFdVc5eTVHU2F5djFRcnVSVjZLdGwzdnZWbERYaTRu?=
 =?utf-8?B?eDZ1b1BHbmlzYS95SlFBTnl4Rkl6ZEhIN0xJWW5FVjRmYi92ZXdiMm1TUytB?=
 =?utf-8?B?S2VwbUpvb2FYOGhyeERxR0hkY0JMTG5BT2hPVSt0ZUh3VnF3eVVyTmJzT3gx?=
 =?utf-8?B?d3RGUEFCUkQwU2dzSWpoQ3RSdjQ1NUZUUVYwVjduZnhpQ2JhOHI1ZU5ac2Qr?=
 =?utf-8?B?bFdtRmM2a3h6K2EzY1ZFS0xzbW51bFJTV1Fiak0rLytTeE5Tdmswd3BPV3pP?=
 =?utf-8?B?d3ZzWTJKcEZFQ0V4NkZpTU8zZjFwcnJRQnJ0YWR4UlhyWldpRWZtRDR3angz?=
 =?utf-8?B?MC9uQXFBM3hCRnZDWXlUUkl6ZUlabXdLdks1R2g4bWFyWXVnaHozdW5UUUw3?=
 =?utf-8?B?QytVSVZsUEZEbGJkdkU1NHY0b05WZWJPcVFkUkF4MERaMjF4SWV5UkR5RkF6?=
 =?utf-8?B?WVJHRWhONlFMajk3bENja3ZLS3dwR2lyMmJNM3B5cFRaMXVpSk1tQk1udGFV?=
 =?utf-8?B?TUlsQnd2dnVGS2pCb2ZnV1Q0bnVMZ3NYbWVqTC9iS2VxTnNwMHhERVZ1STBh?=
 =?utf-8?B?cEtHMENYUjVFRVVYVzZTSHFTTFd4VXBGYUY1OFVpc3dSK25BOEhOQXU2QzEy?=
 =?utf-8?B?SGppUmdUUjdCQUJPc1dzbnB4MzYwTTFGVGxWbzRpSFFiRjFiL29ic2FXdVpw?=
 =?utf-8?Q?1nV0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b590a98f-c607-4667-3f94-08dbeb24cfc9
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2023 06:32:33.9953
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xNF7D7YcZKATkJvKgreQxzKTldsDBOe60X4SlcIiglGiiRqWdel3KPXgtd5Xwnb6KqvRr2dncWLUXejRx38Btg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8080
Subject: RE: [virtio-comment] RE: [PATCH V2 3/6] virtio: dont reset vqs when
 SUSPEND

DQo+IEZyb206IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+DQo+IFNlbnQ6IFdlZG5l
c2RheSwgTm92ZW1iZXIgMjIsIDIwMjMgMTA6NTkgQU0NCj4gDQo+IE9uIFdlZCwgTm92IDIyLCAy
MDIzIGF0IDU6MTjigK9BTSBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPg0KPiB3
cm90ZToNCj4gPg0KPiA+IE9uIFR1ZSwgTm92IDIxLCAyMDIzIGF0IDAzOjMzOjA3UE0gKzA4MDAs
IEphc29uIFdhbmcgd3JvdGU6DQo+ID4gPiA+IExpbmdzaGFuIGNsYWltZWQgdGhhdCBzdXNwZW5k
aW5nIGRldmljZSBpcyBmb3IgbGl2ZSBtaWdyYXRpb24gaW4gY29tbWl0DQo+IGxvZyBhbmQgaW4g
ZGlzY3Vzc2lvbiBoZSBwb3J0cmF5IGl0IGFzIHNvbWUgYmFzaWMgZmFjaWxpdHkgdW5yZWxhdGVk
IHRvIGRldmljZQ0KPiBtaWdyYXRpb24gc3VjaCBhcyBkZWJ1ZyBldGMuDQo+ID4gPiA+IEluc3Rl
YWQgb2YgY2xhaW1pbmcgaXQgYXMgc29tZSBub25fZGV2aWNlX21pZ3JhdGlvbiBmYWNpbGl0eSBk
b2VzIG5vdA0KPiBtYWtlIHNlbnNlLg0KPiA+ID4NCj4gPiA+IEl0IGlzIHVzZWQgZm9yIG1pZ3Jh
dGlvbiBmb3Igc3VyZS4NCj4gPg0KPiA+IFdlbGwgaGF2aW5nIGEgZ2VuZXJpYyBmYWNpbGl0eSB0
byBzdG9wIGRldmljZSBzb3VuZHMgbGlrZSBhIG5pY2UgdGhpbmcuDQo+ID4gSG93ZXZlciB0aGUg
ZGV2aWwgaXMgaW4gdGhlIGRldGFpbC4gQSBsb3Qgb2YgZGV0YWlsIGhlcmUgc2VlbXMgdmVyeQ0K
PiA+IG11Y2ggdGFpbG9yZWQgdG8gYSB2ZXJ5IHNwZWNpZmljIGltcGxlbWVudGF0aW9uIGluIG1p
bmQuDQo+ID4gU28gdGhpbmtpbmcgdGhyb3VnaCBob3cgaXQgd2lsbCB3b3JrIGUuZy4gZm9yIHBv
d2VyIG1hbmFnZW1lbnQgd291bGQNCj4gPiBiZSBhIGdvb2QgZXhjZXJjaXNlIHRvIGZpZ3VyZSBv
dXQgaG93IGl0IHNob3VsZCB3b3JrIGluIGRldGFpbC4NCj4gDQo+IEl0IG1pZ2h0IHdvcmsgaW4g
dGhlIGNhc2Ugd2hlcmUgdGhlcmUncyBubyBQTSBzdXBwb3J0IGluIHRoZSB0cmFuc3BvcnQuIEUu
ZyBmb3INCj4gTU1JTyBkZXZpY2VzLg0KPiANCk1NSU8gc2hvdWxkIGltcGxlbWVudCBQTSBsaWtl
IG90aGVyIHRyYW5zcG9ydC4gVGhhdCBicmluZ3MgdGhlIGVxdWl2YWxlbmN5IHByaW5jaXBsZS4N
Cg0KPiBUaGFua3MNCj4gDQo+IA0KPiA+IFBhcmF2IGRpZCB5b3UgaW5kaWNhdGUgYXQgc29tZSBw
b2ludCBhIHZpcnRpbyBzcGVjaWZpYyBTVVNQRU5EIGJpdCBjYW4NCj4gPiBiZSB1c2VmdWwgZm9y
IFBNPyBDb3VsZCB5b3Ugc2hhcmUgaG93IGl0J3MgYmV0dGVyIHRoYW4gdHJhbnNwb3J0IGxldmVs
DQo+ID4gUE0gYW5kIHdoYXQgdGhlIHJlcXVpcmVtZW50cyBhcmU/DQoNClRoZSBwcmFjdGljYWwg
cmVhc29uIGZvciBoYXZpbmcgc3VzcGVuZCBiaXQgaXMsDQpTb21lIGRldmljZXMgbWF5IG5vdCBi
ZSBhYmxlIHRvIHN1cHBvcnQgSW1tZWRpYXRlX1JlYWRpbmVzc19vbl9SZXR1cm5fdG9fRDAuDQpU
aGlzIGlzIGJlY2F1c2UgdGhlIGNvbnRleHQgbWF5IGJlIGh1Z2UgdG8gZmluaXNoIHJlc3Rvcmlu
ZyBpbiAxMG1zZWMuDQoNCkhlbmNlLCB0aGUgY29tcGxleCBkZXZpY2VzIHJlbHkgb24gZGV2aWNl
IHNwZWNpZmljIGJpdCB0byBlbnN1cmUgdGhhdCB0aGUgZGV2aWNlIGlzIHJlYWR5Lg0KDQpUaGlz
IGlzIHdoeSBzdXNwZW5kIGJpdCB1bmRlciBkaXJlY3QgZ3Vlc3QgY29udHJvbCBpcyB1c2VmdWwu
DQoNClRoaXMgbXVzdCBub3QgYmUgY29uZnVzZWQgd2l0aCB0aGUgaHlwZXJ2aXNvciBjb250cm9s
bGVkIGFjdGl2ZS9zdG9wL2ZyZWV6ZSBtb2RlIHRvIGRyaXZlIGR1cmluZyBkZXZpY2UgbWlncmF0
aW9uLg0K

