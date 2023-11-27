Return-Path: <virtio-comment-return-8634-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC7D8C4167B
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 11:12:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 21E432B055
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 11:12:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 019429863A1
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 11:12:51 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E268C98638E; Mon, 27 Nov 2023 11:12:50 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D4492986394
	for <virtio-comment@lists.oasis-open.org>; Mon, 27 Nov 2023 11:12:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iJJW5XjLO1YjWzzL/vFLWEMIXjxRAqupxQbfjt8JPav4VCgfmZea/xDZAy8EsY/vkjWUO9XIHfM1Al2fF0dQWc+BrL6/MX2a1VnwNvl4qIFx9mYHKv8apRsirD38mQ65+SGK1fPYreit4gZFTyfwdOmKkweE5CanTPieh7LIyPyggHEG+xJ+CN8ln03QTv4mxFRDHnwRr2c7Xc1T4ONwMlYw2hwK7W+p8TmOGz4OPMa+lCrtiEB/YdW2yhXuhiEtROWUvT9V5TueiCyD5WClu1TCJ2Exag06l43m3A92pKrkkSpvVMziUeS/kXqkxz7he18LeU6StwK4uNidaX20bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WtJfbmbJfsMdRnsAbA8aGlp5vP9RKp1B7Dr8IewwOS0=;
 b=CG2w3ozJLk2hejKZG/uiQr4wgW21DVnti83ulDiIcxTE5H57HZ8sgHl1Z0ePmmReBK3hWBqZKmVv64tPTLE/KFrXNrhb/CPv8HfYkn3m8ihajEuaN1zxzV2QiNyQUxvVt/mSeOCzCUf8pXEgBqccnlGl/MpKVAdJ5xk9lIYUcqB2AOythTCWeLRwjwDwDHS0cx9hPUK+h5OTn44p8WaoAqKgOja9NFspAgYM4/R1XT0ngYplmGt6J9x/vw2bwdonk1oNHh/qe29sfdih52fs3DTelN0rKq+1UUQM347XSMtAwNpjz4CF/DaNNRcG5ZlYByPBmKfg8PR4PQvbRgC5Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, "si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>, Heng Qi
	<hengqi@linux.alibaba.com>
Thread-Topic: [virtio-comment] Re: [PATCH v6 2/5] virtio-net: Add flow filter
 capabilities read commands
Thread-Index:
 AQHaE9L2DjdkCoB6dUewtbJsrpd4HbCGcWKAgAAAe3CAAA00AIACb1eAgAAArBCAABgnAIAAAHbggAAIJoCAAAhSgIAALSaAgAStofCAACoJgIAAACxw
Date: Mon, 27 Nov 2023 11:12:47 +0000
Message-ID:
 <PH0PR12MB5481EBEC8FA0A797D54D1FB1DCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <PH0PR12MB5481FF2A00B58060D9D69812DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231122094431-mutt-send-email-mst@kernel.org>
 <CACGkMEuEFsByRwTf_hAAZ+7-UuyYz-1wCP4vTpMAW6DbHQzVag@mail.gmail.com>
 <PH0PR12MB5481592754EE68E6F6A79EEEDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124002357-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54812482A68AC708A4E0764BDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsTBKVVnWriVEWAmVY+nfOCx7faHt3-ieSiMfJyEUYNEw@mail.gmail.com>
 <PH0PR12MB5481F5BC8384D1C5B4284A7EDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124040545-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548153830F24B8B8A22E3BDADCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231127060729-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231127060729-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA0PR12MB7723:EE_
x-ms-office365-filtering-correlation-id: 0c076938-f609-44b4-df62-08dbef39c98c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 OHobG886xASGpZiV2xFEp+UBUcF9Wf9bp+EfVQ7V308jPE6AWn2mq2S2XgZA/npETFp36F3g2HkHELsCF6OZYT0wbRoJIIja+EEZpbrnIte6/njw7kvBT+s30FoK0nnMXJUNrLbk7ckP5wFfWyZP1SiMtn9wwm8ouPFt1nfg+5DR98ZXbhauSuGxOY075/0AQBHzFl+QEvLNxoMZHwrd0VUi4hTra0JFzXs7SaFob6nTyUgyphDzddvfI6XIcgZEJb28zXLXnGX+id2NEboI4Z+Pe+Li4L06HWHkiQwG2s3CKpu97thFLN4M/+6DezgLX0l9GJl+Rw+tT80i3DT8S433xIrkUSHKyWuhlCqZAeoFBPJhfPfqc69C5P20Ik97pLGUEVusHYuyJXhoM43LuSYAOtjM3ZujkMtDmuLQ3JnYYGchaHXOhQNTzbXDocI3XM4knB+At1ArSQ2S4xqiv1AfWde0yrsFFldIIEVj7zKowsZA9kcN3C27+ga6P7oDZ/QHbZYMOwMjfeOiyrqXKlq0KA957VmMIkrNORiVuKzYuKZPe8XteUvn6lsf8Gr6CIVMTjNUBVhNaLHghArtJFQIj3RSeFIKv+bjFplDfXS+yj7KONPTvGVMy5K7/Xb9
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(376002)(346002)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(52536014)(71200400001)(8936002)(8676002)(4326008)(9686003)(6506007)(7696005)(55236004)(66446008)(66556008)(66476007)(66946007)(64756008)(54906003)(76116006)(6916009)(316002)(478600001)(122000001)(55016003)(33656002)(38100700002)(41300700001)(38070700009)(86362001)(26005)(2906002)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bHRiWng0OTZzaTgwTHk3ZHpGaVNFTWJsRFpJYU5IMG5NckxPNkUzSHV5WWJ3?=
 =?utf-8?B?My9iUWVZZEg3MEwxOGVzaDZzT2xuZlJPaG5TRHlsYkRmMGNxM0lkbExvaitN?=
 =?utf-8?B?WnBMOWZFcEY3YmFBQ1VhVklPQlVwQ2ptTi92WFZFTVBaN0cwQVc3OFR2bFp2?=
 =?utf-8?B?aFZVY0w5SEpSYTVCZGl1c0ptUHJ0TGQ0SHRaYnVOQnhodjBadTIrQ3B5Q25w?=
 =?utf-8?B?Z1lMQWw3bU1yWWpJKzkwbWNaSU1GaWV1cktuTThaTTRuMGkwWldiRUxic2hp?=
 =?utf-8?B?Y3h5QjJPYWVYTXZoRnJydzAzUnozMEwrSnJTZmlsbkRvV3VCWWs3cDFkNkgy?=
 =?utf-8?B?Qk1icWhTQkprODZFUDk4c2t0T0xPWkRJaWNwQURpYWl4bDVmbjRLSENLL3c2?=
 =?utf-8?B?eXVQcW1kQzZtWE5wU2tjQVR6TkNMWW1DVFNkWmVLMUdUSHVUSm9qMVJ6MzEx?=
 =?utf-8?B?Q1VFdzZUUGQvYUxZVjNIVXBQc1pwTy80aHpyT2RJSTF6aVpZc1pSN1NHZndM?=
 =?utf-8?B?V3FmRmV2dUtDU1hNaEh6QzFsTXM4ZVVtY0xrS0V3MGphVXFPUGpyblNWZEtX?=
 =?utf-8?B?Rmh1VjZCeGE2c3dKUm1JVjJnUzlDMUt0VEwvbHJ5QXhLVW96aWJHcE1ka2dh?=
 =?utf-8?B?NVllODg1T0FWN3BaRVRkcFdtVXNwTHJsRndaMmRWVlRMWnhTdGVqcWNQSHFq?=
 =?utf-8?B?REpuSmllYkFiYmIyM1cxSUxQbmp2enowUHZCRXlIeW1vSGl2MWt4RDBBZFNu?=
 =?utf-8?B?d2x4WFZCRnVrdlo0VnhUK01MZG9FSVYzbE1MWXByNm1TV3k1dEp5Wm1uUlpR?=
 =?utf-8?B?L3h1MlNkNnFqdXhRcUFWRW41T05BbmcvNmIzR3Z5clJzaCtUcXNobDNiSTZN?=
 =?utf-8?B?ZTdIZmlXdWxuU3M1UGQxUnZtZzh4YThLc1VmN1VZOEFFOUxCU0tPeTBRRnY3?=
 =?utf-8?B?S0lVdXdmZ3ZxZ3Q1em8rZFY5cFFtKzFNL21aSW5HaGRnL29pcFduQ2JQSHlh?=
 =?utf-8?B?cHVWOFMxSVMxSjVtdVJLVEQrc2NSZFRwM0dDRzZHVVdKTnJaQUkvVTlZOGpD?=
 =?utf-8?B?ZllIUlVzZzZLbVNBRVFGdTJlUVRMV1VteTJEdmFhY20wLzl0WFFLU3lSQ3g0?=
 =?utf-8?B?NjM3YXZHZE0zc1BPdWtSU1NYTDlsOTViUThMRUluai8zRHVodkx0cEVnUnlL?=
 =?utf-8?B?YWRrckszWk96ekFtUUZRSnYzQ2hZZ2hoMHZFMEN1NFYzdjFqUGRpS1ljRVlT?=
 =?utf-8?B?R3dyNzZVVGdoQXNKaVlMUTVXblY3SzBTMHhQRjFmdVlMd2JZYkFpQU9yaUZR?=
 =?utf-8?B?dnpUanFMUzNFblpsMlA0c3NYUWpXZ2t4elZqZDhKZkFaa3ZhRk1TTlpGRDRV?=
 =?utf-8?B?TWtFKzZNTExZQ0N3d3RSMWp6UXZRcS8rK1RQaGN4SHgvSTVOY25wUktEdHpy?=
 =?utf-8?B?dnlJQUg0b1BvQk1qdXNFYlJhdDJaWU1ON1N1Y0FselFFcFgvVUtBWHdRSzYx?=
 =?utf-8?B?S0pxZ1BaWStQN0hrMTQrNFNZU3ZNY0wrUmpGQTJDZGtGWERBdzNPN3ZrSHUz?=
 =?utf-8?B?aWl0bk5PaGdzdlhVbDVUYzJVRFRUeVhHV2pYMTRNVjRTeld4N1NSeWVsWllD?=
 =?utf-8?B?NmJiL2x1VU1reCs1WUV3TTYrS0RxY1crUkp3Q1pVSDIwQ1c2bnNiSFI4QmdP?=
 =?utf-8?B?MEIzT01ubHFCbzZncVNWdlhaNnYzYkgreVdaZng4czRSQzJrQmo3cDdDeS9n?=
 =?utf-8?B?V1pGSTFiTEV1WXMvZ0FVUEZRS3FpSG1lcVNxMlJyOHJMVkZZdUVJdnBqb0JF?=
 =?utf-8?B?R240SzZsQ1QzVm44Q2RJM1J0MzdzTFdTa3BSczE4UmFxcmxmZVZraThlZ1pm?=
 =?utf-8?B?emhoUnRQTkFzeTJsQjFpeUR2YnErM0xjUXIwVmNyakNUMGlqWG5aaDFYYTll?=
 =?utf-8?B?eW9SOVlPb0tVbXRqY3VFcW1Yb2NER2FXbDNZVWhLRFpkVUxIL0tvQ1NFRDE1?=
 =?utf-8?B?aDhZcEh2MVJ4V0xtS1NkR0FhcWk4ZW1aMGJUd0xDVmR3Wmd0SEl2YlRKVVdX?=
 =?utf-8?B?aUw5MWdwa2xrTWNvcU5hRWYwNG9OcXZGVk9BeTRkcU1zY0s5b3I3R1p5WStn?=
 =?utf-8?Q?EhAQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c076938-f609-44b4-df62-08dbef39c98c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2023 11:12:47.6277
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OHIRGKoBoXP/SCNBqQM0ODGgCzO3uza+hugxr5Klag68PECLdiT8ZbPi8fie3pxReunIIghzdENQ3RUCWgVN6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7723
Subject: RE: [virtio-comment] Re: [PATCH v6 2/5] virtio-net: Add flow filter
 capabilities read commands

DQo+IEZyb206IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+DQo+IFNlbnQ6IE1v
bmRheSwgTm92ZW1iZXIgMjcsIDIwMjMgNDo0MCBQTQ0KPiANCj4gT24gTW9uLCBOb3YgMjcsIDIw
MjMgYXQgMTA6MTk6NDVBTSArMDAwMCwgUGFyYXYgUGFuZGl0IHdyb3RlOg0KPiA+ID4NCj4gPiA+
ID4gVGhlIGJyaWdodCBsaW5lIGluIGJhc2VkIG9uIHRoaXMgdXNhZ2U6IGJvb3RzdGFwIG9yIG5v
dC4NCj4gPiA+ID4gSWYgaXRzIHJ1bnRpbWUsIHN1cmUgaGF2ZSBpdCBvdmVyIENWUS4NCj4gPiA+
ID4gRm9sbG93aW5nIHRoZSBuaWNlIHRlbmV0IG9mIEIuMiBvZiB0aGUgc3BlYyBzbmlwcGV0OiAi
RGV2aWNlDQo+ID4gPiA+IGNvbmZpZ3VyYXRpb24NCj4gPiA+IHNwYWNlIHNob3VsZCBvbmx5IGJl
IHVzZWQgZm9yIGluaXRpYWxpemF0aW9uLXRpbWUgcGFyYW1ldGVycyINCj4gPiA+ID4gVGhhdOKA
mXMgaXQuDQo+ID4gPiA+IEFuZCBldmVyeW9uZSBpcyBhbHJlYWR5IGFsaWduZWQgdG8gaXQuDQo+
ID4gPg0KPiA+ID4gQWJzb2x1dGVseS4gU3BlY2lmaWNhbGx5LCB3aGVuIGRvIHlvdSBleHBlY3Qg
ZHJpdmVyIHRvIHByb2JlIHRoZXNlDQo+ID4gPiBjYXBzPyBBcyB5b3UgeW91cnNlbGYgZXhwbGFp
bmVkLCBpdCBoYXMgdG8gZG8gaXQgYmVmb3JlIGV0aHRvb2wNCj4gPiA+IGNhbGxzIC0gdGhhdCBj
bGVhcmx5IG1lYW5zIGl0IHdpbGwgZG8gaXQgaW4gcHJvYmUuDQo+ID4gPiBUbyBtZSB0aGlzIHNp
bXBseSBzY3JlYW1zICJpbml0aWFsaXphdGlvbiB0aW1lIi4NCj4gPiA+DQo+ID4gSXQgY2FuIGJl
IGRvbmUgaW4gZHJpdmVyIHByb2JlIHJvdXRpbmUgYWZ0ZXIgRFJJVkVSX09LLCB0aGlzIGlzIGZp
bmUuDQo+IA0KPiBObyAtIGl0IGlzIHByZWZlcmFibGUgdG8gZG8gaXQgYmVmb3JlIERSSVZFUl9P
SyBiZWNhdXNlIFZRcyBhcmUgcHJvYmVkIGFuZA0KPiBpbml0aWFsaXplZCBiZWZvcmUgRFJJVkVS
X09LLg0KPiBGb3IgZXhhbXBsZSwgaXQgaXMgcmVhc29uYWJsZSB0byBkZWNpZGUgdG8gb25seSBl
bmFibGUgTVEgaWYgc3BlY2lmaWMgZmxvdw0KPiBjb250cm9sIGNhbiBsYXRlciBiZSBlbmFibGVk
Lg0KDQpGb3IgZmxvdyBmaWx0ZXIgcmVsYXRlZCBjYXBzIGhhcyBubyBoYXJkIGRlcGVuZGVuY3kg
dG8gaXQgYmVmb3JlIGRyaXZlcl9vaywgc2FtZSBhcyBzdGF0cy4NCk1RIGhhcyB1c2VycyBldmVu
IHdpdGhvdXQgZmxvdyBmaWx0ZXIuDQo=

