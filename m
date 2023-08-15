Return-Path: <virtio-comment-return-7123-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AAFCC001DE
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 06:26:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C3F147950A
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 06:26:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9F8BA9863B2
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 06:26:57 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 817DB984035; Tue, 15 Aug 2023 06:26:57 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 705C298633F;
	Tue, 15 Aug 2023 06:26:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nb091HjQSyibsGuL/W1gixefnVK6DXBxZRfb0ob5fNZ4mDQf1ynCfi8s3J7VNMiU/RBs3MsDx9Kn9IoDvxhxueG0j8qAoBZMlHzq923LxYkTTVLivsgd9GNE+3cYvOJVNbisQqFj+im7NFXLfp0piPq6ed/i4mtY4qRHEQ+bXCl7Qw7VMcYGURcT2gwHzhBxs8PuOHlYHgRUVwcK4RkVrJx1UZ5lPwgi6GOat5Vfd2kMz3b/OaZ5c2sLH/hThOeEmvM5/chdvIQWMtiXTjmbVO5yHtArwQ3KwjotN4CV9+u0SVrf/zzIKzDa9a9a7lGheFyreNG0MVy9jFee0brhDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jq9NbXDN8VcoIbJjRkWutM9RL11o2JbjJOcva6lBveA=;
 b=a3MAyibkBzQwzjLEwiR7I9Hd5Zqni+QpqbWqd0N4J+y+jBnno7Nvc0i3ZMv5ZObaEu4ge5CJnSQa4wl/QeL9aw/GfS6lj5hy1iz/dUHMjkyG++118tJ1RL108K9ctUR+atxWAozC+e6OzFyxgJ0ETbYxqxSPyJy1mAghV4/4Ax419NgleIuX7eZ25Xhjs0C18j5WsLvpyj9kL4eyStKWNeO4CR+MEkWCsK7o9+7f6rftfbgfob6jP+HR0Au4zYWGsKpoKi22Gi9aR3fjX+DXHLG3HEMnGvjXwpD/dIVVxpJTS4Pziiw/c4o4mRm6KqioeNsRYRcnKkyu/6p6aWu9iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Jason Wang
	<jasowang@redhat.com>
CC: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Shahaf Shuler
	<shahafs@nvidia.com>, "hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Willem de Bruijn <willemb@google.com>
Thread-Topic: [virtio-comment] Re: [virtio] [PATCH requirements 6/7]
 net-features: Add packet timestamp requirements
Thread-Index: AQHZvd/P0UZ+85qNOEywdrF+BteiUK/hvTGAgAF2gACAAPOIAIAG3dyQ
Date: Tue, 15 Aug 2023 06:26:53 +0000
Message-ID:
 <PH0PR12MB548121B3CDF46BBCA4E0D07CDC14A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230724033421.249893-1-parav@nvidia.com>
 <20230724033421.249893-7-parav@nvidia.com>
 <1691570137.0487022-1-xuanzhuo@linux.alibaba.com>
 <CACGkMEs-d-zPLByDNuDNda7UPDsm6hgZKw-3A1aNA4npUsWy7g@mail.gmail.com>
 <CAF=yD-+LMY3yE3qtd4vHc8CGOz6UAf4njM2QiZcajrQgL=KZRQ@mail.gmail.com>
In-Reply-To:
 <CAF=yD-+LMY3yE3qtd4vHc8CGOz6UAf4njM2QiZcajrQgL=KZRQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA1PR12MB6626:EE_
x-ms-office365-filtering-correlation-id: 09821e74-7129-4fc7-78b2-08db9d589dc1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ct5qi35r6W4evL7C/fJRMd1Ji0lJGinBHYxCMe9AIm7MMsp2EMNby0UQmxUX+o4Yv4SDxLz77Yeni7eCUrvOxhpQpfWUBYQO5B+sOblXijOV0ZW5OX727kV+vYHOVuAXvyojad0FR2rDNgvm+q60qaFuj2wwBmoxEU0OwCy2yKsyYGldK4lUNmXkQYinhx1JpAUC2Hc0VO3f2h+negziZkeljGhfq/kxF+aQI7shDbyBEYNWToL1HloRNvApkWChmxCdfzRf+nobUOc8ckhL8/eqh1PTmypBVq3WpHT6EOWLZ+8KRjSk17c2IQaNsMubpzn1qi5oBhtvq7HWJFB3quvTfdQibvIYgm/rJQU1UfzU7fM7MaFWJ8C7Dt4HfRRMRm7oyd0b+44jRtHnrETk+SqEflXuRwxU2O86Iy+gfRCw5nCYb+mohMqzATWcmxcpqbu9iDI5nT9uBtrk3b7Z5rJ2llmz74DAkCnTZXmmkBl/1qbYnJdewgXne5Awy6qp9t1pRfG8CQ2P24zPbJYlcIFquZakzLJExQTRFTU8Y/Q3pUQW4znbxKfYL6xpRBAheD6ExZPOQwAcYIIFmlTF3f8lS2mpCcQwhE66T5+duDYRvicqqrTZjWQsFij7MpIoa9SU44QuyZhUuFJZ6t4qUa8Qvr6TkfstAR7nQy9Y1yg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(366004)(376002)(396003)(136003)(1800799006)(186006)(451199021)(2906002)(83380400001)(38070700005)(38100700002)(122000001)(55016003)(7696005)(6506007)(316002)(41300700001)(66446008)(71200400001)(66946007)(76116006)(66476007)(54906003)(64756008)(66556008)(110136005)(8676002)(8936002)(4326008)(9686003)(478600001)(966005)(33656002)(86362001)(16799955002)(5660300002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U2RQVFZnSUQ2OHVVTDB6d3YySVlqSldLWFJTeXFka0wrSUlDOWN6b2swVEh4?=
 =?utf-8?B?YnlRek9nVFZleklqaVpzRnN2NVRFS1RhOXlaYnBwZlRLUDNOay9BamVWMWRD?=
 =?utf-8?B?WlFoaTRueXIzSFgzWk9jWjNqMWRNN2NYOTFJbW9Lbmw3L2IwVm1qZXRaSEhP?=
 =?utf-8?B?NEtzL3RTTG5YclZ0RHlMa0VLcmIzYzIzbnd5YmsrNjUwZGR0a2VNWDdhK0pW?=
 =?utf-8?B?Zm1GeG5takNVRFdqaVp6L3VzMzdZUjYvZUpJa2NnR096WmxicjJnbVEwSGNY?=
 =?utf-8?B?aFVsS1UvQzgvcGFGRCtncFEvbUpBeWZqdWVMUUJRWFk5TnRCV1VoaC9VeVMy?=
 =?utf-8?B?U09KQjEyMDBLL3FsYTg3YWJUTms0SERKQzFCZmwzMGc4dk12T1U1dnhyU3NC?=
 =?utf-8?B?eEIwTDdGR3ZsK0o0dU45eVlqS2E2b2VaTmI3a0UwRU4zUlMrOUhHdGlMemdy?=
 =?utf-8?B?cjA0ejZCVXY0Um1yTUtNZ3pEbjMzK3F2TDdFL2NiTW96bnpPSEpncXV3WXNR?=
 =?utf-8?B?ZTVxclczWUFGRkJ5eURpTVg5T01BTSt1WS9vOHFQYjN4a2VFelZmU25DVHlO?=
 =?utf-8?B?UHI0UUM2T0poRnJKcW9YQTBNcVZCakpMSXVMUU5YOWIwc0haSXYxV2FPUUY2?=
 =?utf-8?B?Q1YzQVVYQzNYL3dMVUROMEZMcEVsYXJaZm9oSlNKMjNhMEdyVmo4UVlZREV2?=
 =?utf-8?B?UUJ5TEY2QmVjZjNzTTZZK0tBTmhISmd6WlprdklvUGlXWTRYZHErN2IzU2sv?=
 =?utf-8?B?REZnZ25UMnRkWFl0VVhpWitEZjRlTnJHejB0L3J5VTVGbkZoSXJKa2JrVkpI?=
 =?utf-8?B?MnV2WlhXMTZnVjN3bk0zOW45bGlBTmdCeXZzeERWWnExNlg4cFlnb013YWc1?=
 =?utf-8?B?Zmx6RkpqeGZSSkh0KzJjaEVvV05GM0JmTjNxcnhFWXBxSUJrbi95bm92M3JS?=
 =?utf-8?B?djJZU3ZWbkdaSmhGRkJsc2NJNEFzN1JjRnpKSStLby9KQVhaVU1GYVQzcmM5?=
 =?utf-8?B?UzdMby9IWFA2Ylp0UnlTYjFKREFEcUxDcmcwU3NtbmJGWnhsV0tteEtNc2Ja?=
 =?utf-8?B?MmJ3dDRXZlNFaS91c1FTTy9MNVBlcTZtd2twemVLaDU1UmxsenNFL2FRRVNi?=
 =?utf-8?B?TmNKSEhtQVBrSlh4em1LdTJuOE01dXpmelo4RVJwb1F4Ry9wOGdhVUJXZVg4?=
 =?utf-8?B?eTVOdkR5bHNJbTVsdU1qTlNVZUx3bUtEQjc1RUhNUWh0RXc4Ri93ZGdCcFVW?=
 =?utf-8?B?Qk4wZnNhejU0RWlUMjhnSFhGLzNJWFJWTkJEcEcyckE4MmZQdzBUcEF2ZTVa?=
 =?utf-8?B?NlE1UWZjcldaRU5YWm0xVENMSUhHa2RUWEFMZ3JWZDI5d29vRmorNnBHYjZ6?=
 =?utf-8?B?NW9NcnRwUU13VmM0QjhFbmhrR2x0WmRSSXQzU25hbURVNGU5anNWM2JiUGZa?=
 =?utf-8?B?L2V0R0ZHQ2RkSWJiQjM1ZjhFZzYwTFR1TTliL1hCZmhOWTlVR2RyclNxN2Fn?=
 =?utf-8?B?dEJ0RjArUkdBOUdBWWV5cUIwV2E3djFkYkpLOGt6WWgwV0tUN05TWUpPaXZn?=
 =?utf-8?B?a0Jzd2ZvKzV2KzQzTllWb1owVTFJbXRHeVRlMHp1WGRBZ0RzVnpibXY5U3Rt?=
 =?utf-8?B?TGJSNDcrUU5RNDZIK2FKZVBVZVBhUy9yNUIzMWl6ZEFXbWphbGx0ZEE0RGdP?=
 =?utf-8?B?aGg2ZWE3ZXFxQXhnTnlsTEZsZGYxNDZTMHA2ZzFQVUs0V3hZTlhvVytUVUNV?=
 =?utf-8?B?MW5LKzZneHJaS3NUNFNYclFWR0dzU2pCdEdkdGZnMUlrak14Wk9kS1FEdFJW?=
 =?utf-8?B?aXRIM3hSaFdIMkVISlhVVThEUlR4ZEluRG1ZZW1qVWc1YkJpQkNLWCtyYmRm?=
 =?utf-8?B?TmtTYlJ6NkJEei9PaGxJdHhRenpHdUlqYTRiT3AwSUMyZ2UyM25HM1RaSDV3?=
 =?utf-8?B?TUpuU2FUZ1hLTzdzVk1ic280OWxTTTA0akRta1ZadThvTzkvRlJXRmpkaHBs?=
 =?utf-8?B?N0pnQ2ZwNVJPV0d4Ny9SOWZMcFJ1L2xCdHpFblczYXJwbld4QjZ4TnU0Y2hr?=
 =?utf-8?B?UFh1VUt5ckhvdXlnRUQ4aUY0M1ZrTzJoVzErMlFSekNjclZvN1RGUWFqeEZD?=
 =?utf-8?B?MGNOQTlkTit6SFNWTDBTNkFLT3BsVlNjenZRYVViV21NbVJxd1hNNmxUd243?=
 =?utf-8?Q?wQA+3zgkHs7qEj0ORr45YRc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09821e74-7129-4fc7-78b2-08db9d589dc1
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2023 06:26:53.2425
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hpp4DeHibwd9e1ef0v42FFuMc5cjL9dShW7/WBRq8myJOTmzrocbrHfErORXQ6utbabidNiE7WYYuAZwvJTDwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6626
Subject: RE: [virtio-comment] Re: [virtio] [PATCH requirements 6/7]
 net-features: Add packet timestamp requirements

SGkgV2lsbGVtLA0KDQo+IEZyb206IFdpbGxlbSBkZSBCcnVpam4gPHdpbGxlbWRlYnJ1aWpuLmtl
cm5lbEBnbWFpbC5jb20+DQo+IFNlbnQ6IEZyaWRheSwgQXVndXN0IDExLCAyMDIzIDI6NTggQU0N
Cj4gDQo+IEZvciBzeW5jaHJvbml6YXRpb24sIGEgc2luZ2xlIDY0LWJpdCBNTUlPIHJlYWQgaXMg
bm90IG5lY2Vzc2FyaWx5IHRoZSBmYXN0ZXN0DQo+IHdoZW4gdHJhdmVyc2luZyByZWFsIGhhcmR3
YXJlIGJvdW5kYXJpZXMsIG9yIHN1ZmZpY2llbnQuIFBDSWUgaGFzIFByZWNpc2lvbiBUaW1lDQo+
IE1lYXN1cmVtZW50IChQVE0pIGhhcmR3YXJlIGxvZ2ljIHRvIGNhcHR1cmUgY2xvY2sgbWVhc3Vy
ZW1lbnQgd2l0aCBsZXNzDQo+IHVuY2VydGFpbnR5IGFuZCBwb3NzaWJseSBsYXRlbmN5LCBmb3Ig
aW5zdGFuY2UuDQo+IEluZGVlZCwgdW5jZXJ0YWludHkgaXMgbW9yZSBpbXBvcnRhbnQgdGhhbiBy
YXcgbGF0ZW5jeS4NCj4gDQpQVE0gd291bGQgdGhlIG5leHQgaW4gb3VyIGxpbmUgdG8gc3VwcG9y
dCBvbiB2aXJ0aW8sIG1haW5seSBmb3IgdGhlIFBDSWUgUEZzLg0KDQo+IEZXSVcsIHdlJ3JlIGFs
c28gdHJ5aW5nIHRvIGNhcHR1cmUgc2ltaWxhciByZXF1aXJlcyBmb3IgcGh5c2ljYWwgZGV2aWNl
cyB0aHJvdWdoDQo+IHRoZSBPcGVuIENvbXB1dGUgUGxhdGZvcm0gTklDIENvcmUgT2ZmbG9hZHMg
ZWZmb3J0Og0KPiBodHRwczovL3d3dy5vcGVuY29tcHV0ZS5vcmcvdy9pbmRleC5waHA/dGl0bGU9
Q29yZV9PZmZsb2FkcyNUaW1lc3RhbXBpbg0KPiBnDQo+DQpUaGFua3MgZm9yIHRoZSBhYm92ZSBw
b2ludGVyIGFuZCB5b3VyIGlucHV0cywgd2UgYXJlIGNvbnNpZGVyaW5nIG1hbnkgb2YgdGhlbSBp
biAxLjQgdGltZWZyYW1lLg0KTWFueSBhcmUgcG9zdCAxLjQgc28gdGhhdCBvbmUgY2FuIGltcGxl
bWVudCBhbHNvIGluIHByYWN0aWNhbCB0aW1lIGZyYW1lIDopDQogDQo+IFZpcnRpbyBkZWZpbmVz
IGJvdGggYSB2aXJ0dWFsIGludGVyZmFjZSBhbmQgb25lIHRoYXQgY2FuIGJlIHN1cHBvcnRlZCBi
eQ0KPiBoYXJkd2FyZSwgc28gaXQncyBub3QgYSAxOjEgbWF0Y2gsIGJ1dCBtYW55IHN1YnRsZSBw
b2ludHMgcHJvYmFibHkgYXBwbHkgdG8NCj4gYm90aC4NCj4gDQpZZXMsIGl0IGRvZXMgYW5kIHRo
ZSBwcm9wb3NhbCBoZXJlIGluIGZpcnN0IHBoYXNlIGlzIHRvIHN1cHBvcnQgYm90aCBzbyB0aGF0
IHByZWNpc2lvbiBtYXkgbm90IGJlIG5zZWMgbGV2ZWwgYnV0IGF0IHVzZWMgZm9yIHNlbWkgdmly
dHVhbCBpbnRlcmZhY2VzLg0KQW5kIHByb2dyZXNzIHRvd2FyZHMgc3VwcG9ydGluZyBQVE0gYWZ0
ZXIgdGhhdC4NCg0KPiANCj4gRm9yIHRpbWVzdGFtcGluZywgdGhlIGRpZmZpY3VsdCBwYXJ0IGlz
IHRoZSB0cmFuc21pdCBjb21wbGV0aW9uIHN0YW1wLA0KPiBhc3luY2hyb25vdXMgd2l0aCBkYXRh
IGZsb3cuIElmIHRoaXMgaXMgdGFrZW4gb24gdGhlIGRldmljZSBiZWZvcmUgb3IgYXQgdGhlIHRp
bWUNCj4gb2YgcXVldWluZyB0aGUgY29tcGxldGlvbiB0byB0aGUgaG9zdCwgdGhlbiBpdCBjYW4g
YmUgc3RvcmVkIGluXCB0aGUgY29tcGxldGlvbg0KPiBkZXNjcmlwdG9yLiANCkF0IHRoaXMgcG9p
bnQgd2UgYXJlIGNvbnNpZGVyaW5nIGJlZm9yZSB0aGUgUEhZIGFuZCBhZnRlciB0aGUgcXVldWlu
ZyBhcyBsaXN0ZWQgaW4gdGhpcyBkb2MuDQpTbyB0aGF0IGNvbXBsZXRpb24gY2FuIGhvbGQgdGhp
cy4NCg0KPiBCdXQgaWYgdGFrZW4gYXQgdGhlIFBIWSwgc2F5LCBpdCBpcyBub3QgdW5jb21tb24g
Zm9yIHRoaXMgdG8gaGFwcGVuDQo+IGFmdGVyIHRoZSBjb21wbGV0aW9uIGlzIHdyaXR0ZW4uIEFu
ZCBpbnN0ZWFkIGEgYmxvY2sgb2YgZGVkaWNhdGVkIHJlZ2lzdGVycyBpcw0KPiB1c2VkIGFuZCB0
aGUgaG9zdCBtdXN0IHBvbGwgYSByZWdpc3Rlci4gVGhlcmUgYXJlIGV4YW1wbGVzIG9mIHRoZXNl
IGluIHRoZSBMaW51eA0KPiBkZXZpY2UgZHJpdmVyIGRpcmVjdG9yeS4gRm9yIHZpcnRpbywgaXQg
aXMgcHJvYmFibHkgc3VmZmljaWVudCB0byBvbmx5IHN1cHBvcnQgdGhlDQo+IGZpcnN0IGtpbmQu
DQo+IA0KV2UgZG8gbm90IGhhdmUgZ29vZCBhYnN0cmFjdGlvbiBvZiB0aGUgUEhZIHlldCBhbmQg
aXQgaXMgYml0IGhhcmQgdG8gYWRvcHQgdG8gcGh5IHdoZW4gaXRzIG1peCBvZiB2aXJ0dWFsIGFu
ZCBwaHlzaWNhbC4NClNvIGN1cnJlbnQgcGxhbiBpcyB0byBwbGFjZSB0aGVtIGluIHRoZSBjb21w
bGV0aW9ucyBmb3IgdHggYW5kIHJ4Lg0KDQo+IA0KPiBBIHRoaXJkIGFzcGVjdCBpcyB0aGUgY29u
dHJvbCBwYXRoOiBxdWVyeWluZyBhbmQgY29uZmlndXJpbmcgaGFyZHdhcmUNCj4gdGltZXN0YW1w
cyAoc2lvY2dzdGFtcC9zaW9zZ3N0YW1wKS4gSWYgaGFyZHdhcmUgaXMgY2FwYWJsZSwgZWFzaWVz
dCBpcyB0byBqdXN0DQo+IHRpbWVzdGFtcCBldmVyeSBwYWNrZXQuIE11Y2ggaGFyZHdhcmUgb3V0
IHRoZXJlIHRhcmdldHMgbG93IHJhdGUgUFRQDQo+IG1lc3NhZ2VzLiBCdXQgYSB2aXJ0dWFsaXpl
ZCB2aXJ0aW8gZGV2aWNlIGNvdWxkIHRpbWVzdGFtcCBhbGwuIEluIHdoaWNoIGNhc2UgdGhpcw0K
PiBjb250cm9sIEFQSSBjYW4gbWF5YmUgYmUgcHVudGVkIG9uLg0KDQpWaXJ0dWFsaXplZCB2aXJ0
aW8gZGV2aWNlIHdpbGwgYmUgYWJsZSB0byBkbyBtb3N0IG9mIHRoZSBjb250cm9sIGFuZCBkYXRh
IHBhdGggdGltZXN0YXBpbmcgd2hhdCBodyBjYW4gZG8uDQpMaWtlbHkgYXQgbG93ZXIgcHJlY2lz
aW9uIG9yIGFjY3VyYWN5Li4uIDopDQo=

