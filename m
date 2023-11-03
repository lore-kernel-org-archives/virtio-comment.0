Return-Path: <virtio-comment-return-8165-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB44C4332F
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 15:50:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 052442A88E
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 15:50:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C4A4B986C41
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 15:50:37 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id ABF0D986C3F; Fri,  3 Nov 2023 15:50:37 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 726A0986C40
	for <virtio-comment@lists.oasis-open.org>; Fri,  3 Nov 2023 15:50:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dm1jiWqPEl0NNjVBJjP9SN/oSOXoGIy/SfflnmLHoEfmfzjCg+hhcWw1J68ZLBLAlxhjDdKCPgMk3azw5tA6LrP+qHeoudP66dtxAjG4smwH7rOgqt+dRtGreSiq3ylIHMP/YgkkqtKefW6R5PZOu3/626KyshQpbV50OinaaQ851jCpXpD/rya9+Kga00A9EJLHOCCa/bfIFYQjfnJF6Q54TkmhOislHoe3FCVSNDOCXpwx5QyTEODqDkwuCL93S00V6lv8wWaAOroy62FzwY4X1CpGdfxDHpOLRir9N8VAi5n1gSC6rgcfEz93FsAYRXcDfXOeups+MSqvmQ/Kfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytanTluCRLAj+gdJvYvditcduI81vM/337X2OBLtsmg=;
 b=oYmH51+MDfWOlXvLd+jAgZwWsu9PQus7bt8HuGaQxdo+eqJPrdO4fJKZefPL/vBOY2q7ODKBbBhaIbRuA/dunmopkMO2E4rrahLKX1AnewamqkmiYVL4FMdF+5Xk0O21/KXBO8ZHg2NTwGLjBaMRcqt9RELLa2VjS1fvub7VPDJftYg5qWfqzzH8N8sXqck0yX5nOCU/emqkIhUt1YJf+hYLzH7rLn/SL52LSgdIPyb2Ij5NZjN2rm2cfaiszQUraVktBIsfAqSLig5c0sX3VmfY/Ly+3Gfs4/GLsY19KkeOR0SxNL5KiEyiyUh1yI6egjNI319d5g8NEYQ/XnX2SA==
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
Thread-Topic: [virtio-comment] Re: [PATCH V2 4/6] virtio-pci: implement
 VIRTIO_F_QUEUE_STATE
Thread-Index: AQHaDkFl1Izi1X/8PEWVlDiafyu5VrBocsSwgAA8x4CAAA4dEA==
Date: Fri, 3 Nov 2023 15:50:27 +0000
Message-ID:
 <PH0PR12MB54814F9EEDD69ED434BF7994DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-5-lingshan.zhu@intel.com>
 <PH0PR12MB5481085F6E84FD2786FCD60BDCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <705607e3-39c3-47da-a688-80bbee31c48d@intel.com>
In-Reply-To: <705607e3-39c3-47da-a688-80bbee31c48d@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA0PR12MB8423:EE_
x-ms-office365-filtering-correlation-id: 50fd8364-314e-43b0-6d0a-08dbdc8499b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 08pI8iV6kJziqNWTch2UPu/XzW/gItaIt5kuedJ2BK9qL7JgrYddq3bW/yxNWtX8Q8rF+eI0iv8o3cvTSv7UNbVLetcOekTORQBcxyyiMX2POe+Gx4MLy9Ltw6xiHB59J4uSM5ngM3IzpoctGgfws6tXxRsAuex1eYB3gupRwLSH2ucXGgMY0xCeM2/M9VQXJ4F8sJ8NbMvE/+M0NGT/tBxHflJPVUT2ttE+bUvzt+T0dnvW+GQeljFlkmXh6mMizv9YYaSMyfYszsUtYMtGZXvPbyYROqyAqyTeOEcfpkkm0oNeEAXNT6IVKHwwA2IidcUSrSCggTTkBRvhF2PAD10Jdagu+YI8YST+Bvd/M+tkgVRWTwQNTgd/MJVmZcgT+mN6//PG8qkjBjWVlP5/OE+gBan8t72HQ8j1SAU51LK/DGbqb00hDLay7FlQuns+AqZ69sA76pvedfnQJ51opINsfGKRqRlTpwHNc7IJKDQqmuNHhqM8ZnAepDrs9+1aRqihdc+c+NBe5XVvab7bYjLIrFqt/946jOTh0/82XoaCy2iwmhL9oGr/JX62Sy32nIQz2Yczicty/A2faocBndC0hRpfhHpOqui86Opx6MrUhO9y1/bmVjMO+85GAA2/LI+MhxnjLhQZoGAl9Ycur6vZcsEUQLYsCWZveb8uYyAW7hKGVV0/qFS+Fko3hJVpErOGtbrfkWbebHCSKhr/jQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(39860400002)(136003)(346002)(376002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(9686003)(8676002)(8936002)(4326008)(53546011)(52536014)(5660300002)(41300700001)(122000001)(2906002)(66899024)(86362001)(38100700002)(38070700009)(26005)(33656002)(83380400001)(966005)(478600001)(7696005)(6506007)(55016003)(64756008)(66446008)(66476007)(316002)(66556008)(76116006)(66946007)(110136005)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZWVISlhRclNtb3FIZ2NjUng1THFxSWtMZEJuS1h6YXkzVDZSU2VTNENFL3hz?=
 =?utf-8?B?bzhLYy9ybWlvMUdOTkoxOUw1a1BGMVhHQXhmZDFhMVlteWZjd3hkU1ROVlhC?=
 =?utf-8?B?WlIvWnZ5UUVPQU9qQmdQTDF4VURFeXc3VGlGZFBZRWVBQUJaMjAxaGVjZC84?=
 =?utf-8?B?NG5abENTQVpYejZvclR0OWYydzFBdXo1UmdIMG1Ud2RwUnBPbytuRWVONEds?=
 =?utf-8?B?WVk3VWwvekRpMnRweXc0Q2dNQVN5bmwxcW4zQUNQdXM0cFI4bFp5ZlM4T1Yy?=
 =?utf-8?B?VEN4THgxWjJiSHlsd0Q2M3ArRFBaQndZcGhCTUNkbzExVytFY1hsZ0pTZUxz?=
 =?utf-8?B?cEs3WjVqQk5seHcyQUpaeTJ6UHAxOWs2dnJtMmFaTTQ3bnloWkZWWVhvVHBF?=
 =?utf-8?B?Y0lCK2QyQ2REWXRlaXczN0g4VVRzaFpubndKakExMThMajk5WWVINGhJdmZO?=
 =?utf-8?B?ZlVTWkd6d05leUdFSWtpTk9Bd3UvL01XUW1hLzFRQmZsZDZBRENGTmNiVHBh?=
 =?utf-8?B?UDlEcDcxZ1MrVGt4bFJLSGUwYnhNZXNYN0tOTDlFNHlxOEJudXVkVTdJMTFC?=
 =?utf-8?B?Wmd4MWlaQS90eFJScXRXZm5MODJDZ1dUelNzYUIzTTZxeVFoNU12UXBaTCth?=
 =?utf-8?B?cUppYmpIcEdUY0lFdjlaSlYwN3NpTk1MZThBRFl6a0hjckkwdmJxRmM4dmN1?=
 =?utf-8?B?ZmJDTGFpWmppNXdYNGZTUUlTQnV6eFhzOHM2Z29HaXJkNm1LcEtEUis1VXBN?=
 =?utf-8?B?cExvWmVONmc0V3NNNVFaTXg0UTJLcyszQnVvMm1sN05WenJZUzFqeHFtQ1RT?=
 =?utf-8?B?WmxDNE5SWjE5TmpYQVo2T2RWa3NQUzQzSDhHMHQ1d1Vyem9DZDM3WnJlSWZW?=
 =?utf-8?B?N1Fob1N3aUM2Ni90aVB3R3lkQVFSRGVpUFZvNzMvWWZwY2xGNTVlQnJ4MFlW?=
 =?utf-8?B?OTRVSndFL0FDUXlQdkNGN2tsS1RYdWk5Tk9heXp3UGMvQVdrLzlKT2FoYTFh?=
 =?utf-8?B?ZW1Gbk50QVg1WmhPSU1KdXlUdm8vLzZjWDZtcWNWS3JlT21oY0c2MnVaRGZX?=
 =?utf-8?B?M29oa01KQ1U0TEx1RGdmbWFnQ21tenRQMzRSMVhxcVVJenMrQm9Pd21vMHN0?=
 =?utf-8?B?YWxPNGllK1hnWkU5ZzFLOTNrTWN5QldxeWd5RXpQUkNxblFsZ0dLN3MxS2Fn?=
 =?utf-8?B?YkJEUStCa3JNMk1Pd21pc0h1QWlqZ0I4YklITW1MNHJxc1FSNmEyc3ZoS2Rz?=
 =?utf-8?B?SnZ2Wkhyc2FGb05rV0ZXUFVSU3BQejhZWEJuRnp3OHZ3cGpsL0FzVVBNQjlo?=
 =?utf-8?B?ZzhQbnYycU1OY1hiUmFhbjM5cmJWNHZGNWhZd0hpWWFuRWhYTEJpTWhGeHNX?=
 =?utf-8?B?NXRRNVR2WEM2WkNzVHhHQjR2RnpHYnlDd1p3Yy9JblNBNHBDRnl6OGpkQXhv?=
 =?utf-8?B?MTk3MUJScFhUYU9QNDR1cXJFSDZLN2JmbXA2VFFsZVBkVEhQQmFCQXlYNFNm?=
 =?utf-8?B?ekxQV0c3V2t1S2NNbnZxeFpZY29NenBlWDBRRklOSWdLZnRvMFV4TENSWnAz?=
 =?utf-8?B?cm96Vk1ZYnY4bjNrdURBbWFoc0wzK2NseVhYUlNFR1ExaXRlWWVFQlpVSGJJ?=
 =?utf-8?B?OXpiWFRuWG10dGZFNGgxbXJZQkNxOWNkbEhGd1Zkb2x5TjZ2V1lvN2dXRTJX?=
 =?utf-8?B?VkN3Rmhra0ZiOG4yejV3NndYMlFzUm0yWHZOMytrWE9ZUGVxMFR2a1lIM1FQ?=
 =?utf-8?B?SkVwZU1xZFdMc2JYcUFUSzNmeTQ4dXBFME5EQk5zOG10bnUvT1RURkljVlFP?=
 =?utf-8?B?amxxaEVoRGhGa256MzNIcDhIV0YxR3VCaTZOTXIzYlBBV09GZXloczFtK0Q2?=
 =?utf-8?B?WW8zdUF4azNoSUFmRWtkZFg1WnloUzlGOFQzSEFVK09LQ0ZGcHI3R2RlUktw?=
 =?utf-8?B?T0ZISTFRa0F2QTFBcm5UNnhoT2d1NExwRUhyWmVqQy8rS1hNYStnamdMZVF6?=
 =?utf-8?B?VmNlQjcva0JZOU90K09MZmZ1YTJ6SmpzZkxRSUd1OTdqSTZUT2o5STVSQity?=
 =?utf-8?B?dStTSUp4Y3VSZVZNTDJDMzlhVDNNSm5mczlrSGNkRzNpc1puVUdLM3p4b0dB?=
 =?utf-8?Q?HuMk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50fd8364-314e-43b0-6d0a-08dbdc8499b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2023 15:50:27.5536
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ki2mjJl5dZf96bnwHLg8gsHW7B8USxQ86CyH5ZGXGbleLNOBEisIByCy0k7s5iIdwJBqCwaXyRyPrSvuVuY/9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8423
Subject: RE: [virtio-comment] Re: [PATCH V2 4/6] virtio-pci: implement
 VIRTIO_F_QUEUE_STATE

DQo+IEZyb206IHZpcnRpby1jb21tZW50QGxpc3RzLm9hc2lzLW9wZW4ub3JnIDx2aXJ0aW8tY29t
bWVudEBsaXN0cy5vYXNpcy0NCj4gb3Blbi5vcmc+IE9uIEJlaGFsZiBPZiBaaHUsIExpbmdzaGFu
DQo+IFNlbnQ6IEZyaWRheSwgTm92ZW1iZXIgMywgMjAyMyA4OjI3IFBNDQo+IA0KPiBPbiAxMS8z
LzIwMjMgNzozNSBQTSwgUGFyYXYgUGFuZGl0IHdyb3RlOg0KPiA+PiBGcm9tOiBaaHUgTGluZ3No
YW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+DQo+ID4+IFNlbnQ6IEZyaWRheSwgTm92ZW1iZXIg
MywgMjAyMyA0OjA1IFBNDQo+ID4+DQo+ID4+IFRoaXMgcGF0Y2ggYWRkcyB0d28gbmV3IGxlMTYg
ZmllbGRzIHRvIGNvbW1vbiBjb25maWd1cmF0aW9uIHN0cnVjdHVyZQ0KPiA+PiB0byBzdXBwb3J0
IFZJUlRJT19GX1FVRVVFX1NUQVRFIGluIFBDSSB0cmFuc3BvcnQgbGF5ZXIuDQo+ID4+DQo+ID4+
IFNpZ25lZC1vZmYtYnk6IFpodSBMaW5nc2hhbiA8bGluZ3NoYW4uemh1QGludGVsLmNvbT4NCj4g
Pj4gLS0tDQo+ID4+ICAgdHJhbnNwb3J0LXBjaS50ZXggfCAxOCArKysrKysrKysrKysrKysrKysN
Cj4gPj4gICAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKQ0KPiA+Pg0KPiA+PiBkaWZm
IC0tZ2l0IGEvdHJhbnNwb3J0LXBjaS50ZXggYi90cmFuc3BvcnQtcGNpLnRleCBpbmRleA0KPiA+
PiBhNWM2NzE5Li4zMTYxNTE5IDEwMDY0NA0KPiA+PiAtLS0gYS90cmFuc3BvcnQtcGNpLnRleA0K
PiA+PiArKysgYi90cmFuc3BvcnQtcGNpLnRleA0KPiA+PiBAQCAtMzI1LDYgKzMyNSwxMCBAQCBc
c3Vic3Vic2VjdGlvbntDb21tb24gY29uZmlndXJhdGlvbiBzdHJ1Y3R1cmUNCj4gPj4gbGF5b3V0
fVxsYWJlbHtzZWM6VmlydGlvIFRyYW5zcG9ydA0KPiA+PiAgICAgICAgICAgLyogQWJvdXQgdGhl
IGFkbWluaXN0cmF0aW9uIHZpcnRxdWV1ZS4gKi8NCj4gPj4gICAgICAgICAgIGxlMTYgYWRtaW5f
cXVldWVfaW5kZXg7ICAgICAgICAgLyogcmVhZC1vbmx5IGZvciBkcml2ZXIgKi8NCj4gPj4gICAg
ICAgICAgIGxlMTYgYWRtaW5fcXVldWVfbnVtOyAgICAgICAgIC8qIHJlYWQtb25seSBmb3IgZHJp
dmVyICovDQo+ID4+ICsNCj4gPj4gKwkvKiBWaXJ0cXVldWUgc3RhdGUgKi8NCj4gPj4gKyAgICAg
ICAgbGUxNiBxdWV1ZV9hdmFpbF9zdGF0ZTsgICAgICAgICAvKiByZWFkLXdyaXRlICovDQo+ID4+
ICsgICAgICAgIGxlMTYgcXVldWVfdXNlZF9zdGF0ZTsgICAgICAgICAgLyogcmVhZC13cml0ZSAq
Lw0KPiA+IFRoaXMgdGlueSBpbnRlcmZhY2UgZm9yIDEyOCB2aXJ0aW8gbmV0IHF1ZXVlcyB0aHJv
dWdoIHJlZ2lzdGVyIHJlYWQgd3JpdGVzLCBkb2VzDQo+IG5vdCB3b3JrIGVmZmVjdGl2ZWx5Lg0K
PiA+IFRoZXJlIGFyZSBpbmZsaWdodCBvdXQgb2Ygb3JkZXIgZGVzY3JpcHRvcnMgZm9yIGJsb2Nr
IGFsc28uDQo+ID4gSGVuY2UgdG95IHJlZ2lzdGVycyBsaWtlIHRoaXMgZG8gbm90IHdvcmsuDQo+
IERvIHlvdSBrbm93IHRoZXJlIGlzIGEgcXVldWVfc2VsZWN0PyBXaHkgdGhpcyBkb2VzIG5vdCB3
b3JrPyBEbyB5b3Uga25vdw0KPiBob3cgb3RoZXIgcXVldWUgcmVsYXRlZCBmaWVsZHMgd29yaz8N
CjopDQpZZXMuIElmIHlvdSBub3RpY2UgcXVldWVfcmVzZXQgcmVsYXRlZCBjcml0aWNhbCBzcGVj
IGJ1ZyBmaXggd2FzIGRvbmUgd2hlbiBpdCB3YXMgaW50cm9kdWNlZCBzbyB0aGF0IGxpdmUgbWln
cmF0aW9uIGNhbiBfYWN0dWFsbHlfIHdvcmsuDQoNCldoZW4gcXVldWVfc2VsZWN0IGlzIGRvbmUg
Zm9yIDEyOCBxdWV1ZXMgc2VyaWFsbHksIGl0IHRha2UgYSBsb3Qgb2YgdGltZSB0byByZWFkIHRo
b3NlIHNsb3cgcmVnaXN0ZXIgaW50ZXJmYWNlIGZvciB0aGlzICsgaW5mbGlnaHQgZGVzY3JpcHRv
cnMgKyBtb3JlLg0KDQo+IExpa2UgaG93IHRvIHNldCBhIHF1ZXVlIHNpemUgYW5kIGVuYWJsZSBp
dD8NClRob3NlIGFyZSBtZWFudCB0byBiZSB1c2VkIGJlZm9yZSBEUklWRVJfT0sgc3RhZ2UgYXMg
dGhleSBhcmUgaW5pdCB0aW1lIHJlZ2lzdGVycy4NCk5vdCB0byBrZWVwIGFidXNpbmcgdGhlbS4u
DQoNCj4gPg0KPiA+IFNlcmllcyBbMV0gaXMgY29tcHJlaGVuc2l2ZSB0aGF0IGNvdmVycyBpdCBl
dmVuIGlmIHlvdSBjb25zaWRlciBub24tDQo+IHBhc3N0cmhvdWdoIGRldmljZSBtaWdyYXRpb24g
bW9kZWwuDQo+ID4gV2hlcmUgeW91IGNhbiBzdXNwZW5kIGluZGl2aWR1YWwgcXVldWVzIHVzaW5n
IG5ldyBhZG1pbiBjb21tYW5kIGFuZCBnZXQNCj4gdGhlbSBpbiB0aGUgZGV2aWNlIGNvbnRleHQg
c3RhdGUuDQo+ID4NCj4gPiBbMV0NCj4gPiBodHRwczovL2xpc3RzLm9hc2lzLW9wZW4ub3JnL2Fy
Y2hpdmVzL3ZpcnRpby1jb21tZW50LzIwMjMxMC9tc2cwMDQ3Mi5oDQo+ID4gdG1sDQo+IEkgc3Vn
Z2VzdCB5b3UgcmVhZCBRRU1VIG1pZ3JhdGlvbiBjb2RlLiBJZiB5b3UgZG9uJ3Qgd2FudCB0bywg
bm90IG15IGZhdWx0Lg0KPiA+DQo+ID4+ICAgfTsNCj4gPj4gICBcZW5ke2xzdGxpc3Rpbmd9DQo+
ID4+DQo+ID4+IEBAIC00MjgsNiArNDMyLDE3IEBAIFxzdWJzdWJzZWN0aW9ue0NvbW1vbiBjb25m
aWd1cmF0aW9uIHN0cnVjdHVyZQ0KPiA+PiBsYXlvdXR9XGxhYmVse3NlYzpWaXJ0aW8gVHJhbnNw
b3J0DQo+ID4+ICAgCVRoZSB2YWx1ZSAwIGluZGljYXRlcyBubyBzdXBwb3J0ZWQgYWRtaW5pc3Ry
YXRpb24gdmlydHF1ZXVlcy4NCj4gPj4gICAJVGhpcyBmaWVsZCBpcyB2YWxpZCBvbmx5IGlmIFZJ
UlRJT19GX0FETUlOX1ZRIGhhcyBiZWVuDQo+ID4+ICAgCW5lZ290aWF0ZWQuDQo+ID4+ICsNCj4g
Pj4gK1xpdGVtW1xmaWVsZHtxdWV1ZV9hdmFpbF9zdGF0ZX1dDQo+ID4+ICsgICAgICAgIFRoaXMg
ZmllbGQgaXMgdmFsaWQgb25seSBpZiBWSVJUSU9fRl9RVUVVRV9TVEFURSBoYXMgYmVlbg0KPiA+
PiArICAgICAgICBuZWdvdGlhdGVkLiBUaGUgZHJpdmVyIHNldHMgYW5kIGdldHMgdGhlIGF2YWls
YWJsZSBzdGF0ZSBvZg0KPiA+PiArICAgICAgICB0aGUgdmlydHF1ZXVlIGhlcmUgKHNlZSBccmVm
e3NlYzpWaXJ0cXVldWVzIC8gVmlydHF1ZXVlIFN0YXRlfSkuDQo+ID4+ICsNCj4gPj4gK1xpdGVt
W1xmaWVsZHtxdWV1ZV91c2VkX3N0YXRlfV0NCj4gPj4gKyAgICAgICAgVGhpcyBmaWVsZCBpcyB2
YWxpZCBvbmx5IGlmIFZJUlRJT19GX1FVRVVFX1NUQVRFIGhhcyBiZWVuDQo+ID4+ICsgICAgICAg
IG5lZ290aWF0ZWQuIFRoZSBkcml2ZXIgc2V0cyBhbmQgZ2V0cyB0aGUgdXNlZCBzdGF0ZSBvZiB0
aGUNCj4gPj4gKyAgICAgICAgdmlydHF1ZXVlIGhlcmUgKHNlZSBccmVme3NlYzpWaXJ0cXVldWVz
IC8gVmlydHF1ZXVlIFN0YXRlfSkuDQo+ID4+ICsNCj4gPj4gICBcZW5ke2Rlc2NyaXB0aW9ufQ0K
PiA+Pg0KPiA+PiAgIFxkZXZpY2Vub3JtYXRpdmV7XHBhcmFncmFwaH17Q29tbW9uIGNvbmZpZ3Vy
YXRpb24gc3RydWN0dXJlDQo+ID4+IGxheW91dH17VmlydGlvIFRyYW5zcG9ydCBPcHRpb25zIC8g
VmlydGlvIE92ZXIgUENJIEJ1cyAvIFBDSSBEZXZpY2UNCj4gPj4gTGF5b3V0IC8gQ29tbW9uIGNv
bmZpZ3VyYXRpb24gc3RydWN0dXJlIGxheW91dH0gQEAgLTQ4OCw2ICs1MDMsOSBAQA0KPiA+PiBc
c3Vic3Vic2VjdGlvbntDb21tb24gY29uZmlndXJhdGlvbiBzdHJ1Y3R1cmUNCj4gPj4gbGF5b3V0
fVxsYWJlbHtzZWM6VmlydGlvIFRyYW5zcG9ydCAgcHJlc2VudCBlaXRoZXIgYSB2YWx1ZSBvZiAw
IG9yIGEgcG93ZXIgb2YgMg0KPiBpbiAgXGZpZWxke3F1ZXVlX3NpemV9Lg0KPiA+Pg0KPiA+PiAr
SWYgVklSVElPX0ZfUVVFVUVfU1RBVEUgaGFzIG5vdCBiZWVuIG5lZ290aWF0ZWQsIHRoZSBkZXZp
Y2UgTVVTVA0KPiA+PiAraWdub3JlIGFueSBhY2Nlc3NlcyB0byBcZmllbGR7cXVldWVfYXZhaWxf
c3RhdGV9IGFuZA0KPiBcZmllbGR7cXVldWVfdXNlZF9zdGF0ZX0uDQo+ID4+ICsNCj4gPj4gICBJ
ZiBWSVJUSU9fRl9BRE1JTl9WUSBoYXMgYmVlbiBuZWdvdGlhdGVkLCB0aGUgdmFsdWUNCj4gPj4g
XGZpZWxke2FkbWluX3F1ZXVlX2luZGV4fSBNVVNUIGJlIGVxdWFsIHRvLCBvciBiaWdnZXIgdGhh
bg0KPiA+PiBcZmllbGR7bnVtX3F1ZXVlc307IGFsc28sIFxmaWVsZHthZG1pbl9xdWV1ZV9udW19
IE1VU1QgYmUNCj4gPj4gLS0NCj4gPj4gMi4zNS4zDQo+IA0KPiANCj4gVGhpcyBwdWJsaWNseSBh
cmNoaXZlZCBsaXN0IG9mZmVycyBhIG1lYW5zIHRvIHByb3ZpZGUgaW5wdXQgdG8gdGhlIE9BU0lT
IFZpcnR1YWwNCj4gSS9PIERldmljZSAoVklSVElPKSBUQy4NCj4gDQo+IEluIG9yZGVyIHRvIHZl
cmlmeSB1c2VyIGNvbnNlbnQgdG8gdGhlIEZlZWRiYWNrIExpY2Vuc2UgdGVybXMgYW5kIHRvIG1p
bmltaXplDQo+IHNwYW0gaW4gdGhlIGxpc3QgYXJjaGl2ZSwgc3Vic2NyaXB0aW9uIGlzIHJlcXVp
cmVkIGJlZm9yZSBwb3N0aW5nLg0KPiANCj4gU3Vic2NyaWJlOiB2aXJ0aW8tY29tbWVudC1zdWJz
Y3JpYmVAbGlzdHMub2FzaXMtb3Blbi5vcmcNCj4gVW5zdWJzY3JpYmU6IHZpcnRpby1jb21tZW50
LXVuc3Vic2NyaWJlQGxpc3RzLm9hc2lzLW9wZW4ub3JnDQo+IExpc3QgaGVscDogdmlydGlvLWNv
bW1lbnQtaGVscEBsaXN0cy5vYXNpcy1vcGVuLm9yZw0KPiBMaXN0IGFyY2hpdmU6IGh0dHBzOi8v
bGlzdHMub2FzaXMtb3Blbi5vcmcvYXJjaGl2ZXMvdmlydGlvLWNvbW1lbnQvDQo+IEZlZWRiYWNr
IExpY2Vuc2U6IGh0dHBzOi8vd3d3Lm9hc2lzLW9wZW4ub3JnL3doby9pcHIvZmVlZGJhY2tfbGlj
ZW5zZS5wZGYNCj4gTGlzdCBHdWlkZWxpbmVzOiBodHRwczovL3d3dy5vYXNpcy1vcGVuLm9yZy9w
b2xpY2llcy1ndWlkZWxpbmVzL21haWxpbmctbGlzdHMNCj4gQ29tbWl0dGVlOiBodHRwczovL3d3
dy5vYXNpcy1vcGVuLm9yZy9jb21taXR0ZWVzL3ZpcnRpby8NCj4gSm9pbiBPQVNJUzogaHR0cHM6
Ly93d3cub2FzaXMtb3Blbi5vcmcvam9pbi8NCg0K

