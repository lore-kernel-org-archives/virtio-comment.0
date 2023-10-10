Return-Path: <virtio-comment-return-7652-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3B1CD80DB
	for <virtio-comment@archiver.kernel.org>; Tue, 10 Oct 2023 14:09:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B7104774E6
	for <virtio-comment@archiver.kernel.org>; Tue, 10 Oct 2023 14:09:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9EC3398657D
	for <virtio-comment@archiver.kernel.org>; Tue, 10 Oct 2023 14:09:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8912798655D; Tue, 10 Oct 2023 14:09:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 78A29986561
	for <virtio-comment@lists.oasis-open.org>; Tue, 10 Oct 2023 14:09:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h9NbLCXDw0YFdcreDj7g6lHYxxIxXHtvlOHyIzhOOhxI6appb2WNBLMhkgAyLiUUcfO9RFJ5++rEv57dcT7tDoH5TOHAFhuRrv+X0txEWn5fnRFsj7TCQ0Leq3NaRKmjsNAIkbc+yWzjQXzwQ5gEruQ0MGeVMem4fPiGYM27b9nmyIKKLoQh8X3N0GpXu3wmoqGc247q9N0MmEGSrm6bfdhHxA3TMwCAh8qCNje/5efPMHED67dTKjoSD0olUJ68zi56tnIl/C2E8lYVvVGsN4DiUWHTxsdl5Z4uOSbvCB4ViSLKGXrzRSfair6t4pKB9cxdMnDpnBidj47tFu7MHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dkhNDLWxgpsqVK5NwzTS2yoybCKVAxEHI/hKdhn4Gx4=;
 b=Gd4l2ctro6Yw1T4Um/CKZCYK82jjxLMOjkwpw85ffqIBKnwuXX85rN0R+CLMHHWBxwZuhmM0S7nGg2D1engNKPAqxn8D1vtQ9J1JREEdKLigYDnDtYace+W3gsFtmHcaqqL3tlpo5DfFlUNvVClHKhbYGB9hsr4oduQxZeox5VKVMOSvKNUJDkQMdfY7T7PuhF50K6HUVlcikzeARB1f3laLqbJfdj3r1kDvx0VdWMRgEUpuWePiqJpzccnvmvoK75no/UIFh1A7BFFzuyts3ZkA4XhP2Ye3MHdNVctZjDcDNjgMlHqlI8BXfY7P32ktKD5inka42PoTPlSOf/98aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Thread-Topic: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration
Thread-Index:
 AQHZ+dpD+jj/KUeLHUaMn2y+w39Cb7BBJzcAgAAHNXCAAVl+AIAABSzAgABtXQCAAASCoIAAEYaAgAABgCA=
Date: Tue, 10 Oct 2023 14:09:27 +0000
Message-ID:
 <PH0PR12MB5481E7E016CA5B8723D38FFFDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231008112555.473895-1-parav@nvidia.com>
 <20231008112555.473895-2-parav@nvidia.com>
 <CACGkMEt0PNFUoVEYDtgziE5scYqauADX6PF-_f0NSCcWB_FrCA@mail.gmail.com>
 <DM8PR12MB548029E1AAB8529339D22D4DDCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEswD2XLjRNzyqo9M-yT77PsOJqJmDLxSKd2ZOgqLYjjZQ@mail.gmail.com>
 <PH0PR12MB548143D2AB83CA90E7F1C9D6DCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231010083331-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481E43F008C4BB0A906074FDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231010095713-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231010095713-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|MW4PR12MB5628:EE_
x-ms-office365-filtering-correlation-id: 6f1c845e-a2ef-4f8e-233b-08dbc99a8378
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 WDGcQnr5R+d4e45VJXpgaoMaWiI6L+bdc/xCXkteqrQZ+lpghie73finjuq/loxey+o2mLuToWO3IlBlsIKU98LECXYZuUI/UwNcm+jP3TGTDSkR5T8hyBKiMzTfzmf1Wkapo+qcxlLLhXhoVuJULQ+afmVVig5IEDjzNpAWrd2jgkRpb7HII6MbzSvT/NfcWDBtgC0vmcFaK5JG3BxLU+y26FazV9+cPqMWVUpMBGQO8yh8BEASkUetZ6sSkGUYQ2fLakXNIke6ac9cAj0k210Bmd3LhKAEAhG9G2k/+N5vGHRjQBS4m7JGTdCmCoxC//kFz5cJQJ4RueiiYc0Ktpq4M4HbmnKNTfCHSjjrFQSmPjSqM3egjn3G1lqvbofLIHpC0GDqj9Dd22GeOqMAuC/9l8SMk5I1+l/o34H0bq0UJ5/md0NEfUExsAcV9toUFJJ/slXzuQBakO7RRHLdKsOn7o7RukSzr72C0DtE0duQXgfUWN7HJutCEKyy50TRJfuxeBNLDcUsshUyz+BWmFcnYpMVsKBxZXVrtDIvZL8GOT+xMhbjamwGB62lEooQ54cWdB6o3GWa4xpJacIxGKsZgnWK7K6gdyXiOacnLb9P1IMsGIOayKce3GKlniqk
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(39860400002)(396003)(366004)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(55016003)(71200400001)(478600001)(26005)(83380400001)(38070700005)(122000001)(9686003)(7696005)(6506007)(86362001)(33656002)(2906002)(38100700002)(5660300002)(41300700001)(66556008)(66446008)(66476007)(316002)(66946007)(64756008)(6916009)(54906003)(52536014)(4326008)(8936002)(8676002)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dXJVQzF6bWxIQVNjZmpybXFrL1VQTndDeGVKN0RkMktsdTVIem1ZWHdkWWl3?=
 =?utf-8?B?c0MwbmJPWlVZQnBrTEFVTlBSNjdMeG9PYkl2YnF0VGo4MHR4R3l1QkxpbERr?=
 =?utf-8?B?ZDUreHpEcDZDRXNKRFpzeERqemw3VElUaTBtRFdyelNVdEd4a1RxWUh4TWhj?=
 =?utf-8?B?NFlvbGs4UUJuZFhZQzZlNGtlbDZyWTdzNTV2S21kcjF6YlhNQk1CV1VueVJj?=
 =?utf-8?B?WjcrajlnY1hFV1J4NEk5UUh0aWZ5UDBiazRvaFhxRk5DUlN0WE0vamozNkZ4?=
 =?utf-8?B?eDNibVpVaDBueUxpUHJwWE1DQXFUOEY2Ulh5Vm1uQi8xbEdFL3JpWlErbXpT?=
 =?utf-8?B?cE5teVBMN09DQ1h1aC9NRmRvMlRrZ05SaHh6YlFMekZ1SjdwK0pBL1VVb2Nt?=
 =?utf-8?B?K3lnYVFCMCtSNFBQc1ljZnpjcVRBWXNKV2ZNNVppQ3BsVDdvYTgweGsrOTJt?=
 =?utf-8?B?bW5QVjRSQjlDRWNEZHpkeGxLaHovb21ibUpqaGx0d2tvSEVQNE4xWEVWbmRu?=
 =?utf-8?B?eTRZSUI1dlplSlNZWmgxUlJidHJmRkE4MHZ6NWpLdUJ2K2JGdmQ5dTZ2Q2k2?=
 =?utf-8?B?RGYzd0kyZU9qNnp6RFlkaTBET09xWDh0SGJZNUF6WjJNT1krZldzKzhnaXVp?=
 =?utf-8?B?NnQxUGJxbjRpWEZTSzQ3eDRWM3VhUWw0WldpcENiRjZVU1F1NERmS0k4NlBh?=
 =?utf-8?B?alRCSVVVeVJPcXJlVUNIaktyanlVZ0l0aXFLZ2NTN0FPWXZvNkd3dFNqRnZE?=
 =?utf-8?B?dnpXUVc4a1Nhb0U2b2pQZzRCOHhMaXo1dkJCYUF6N3o2K2Rad2gyNFg2RldP?=
 =?utf-8?B?TlJtN1lRaldKd09MaytsOG92ZDVLQWRGbEdIKzJWN0t5S1FQVGtvc1l0dlU0?=
 =?utf-8?B?cE82VHRBenJPZW1aSnN0MVBIRWJVbE45NFVUTkpZMFMrVUZZeHNQZUxndEx1?=
 =?utf-8?B?b1E4eG5KY0xnb01pMW15R3NaOGRsOElLVWtkMzR0MEx2TEF3NUNQS0RsSVVK?=
 =?utf-8?B?ZDg5TmNiQzBSc0xMbFhibHp0R1BFUTk2bzZXbGIyVE1PdHJUdEhxWXJ2Kys5?=
 =?utf-8?B?WmIzVDdwQW8yWE9xYTJvZ0p0WlpGdHdvZnFZalFOalRYYytUWDJlVWY0T1VV?=
 =?utf-8?B?emdjVGtQTHJ2dVRpS3ZGTzZMamNabUl2N0RFKzJsdU9aVlNqWjQ2SDFWN0ZL?=
 =?utf-8?B?eE1CeHpaWHFhQjZLZ09tN0ZCekVLUDI1TjFTYmJ6dWpvWW55SG5FWDNGcGRu?=
 =?utf-8?B?QVJUdFFVOURXYWk0TFd5c0VjNGI0aFFENmx5L05XVk02UmJSblNlK3F4OXpX?=
 =?utf-8?B?NHdKbUdZdnZtKzdZWEhFUWR5dzlNUm51OVV6WkJLd2tjQ00xVGljZHRadDZ4?=
 =?utf-8?B?WXdtenRzRHBDbmVzUlUraTNXRHdKU1kyY1BMMjVYS3BwM0pZOWVzQmJGSU1X?=
 =?utf-8?B?QlZHU2Y3cDQwYVBXa1VnSDNlemo0OWJXRWZiS2NKd3FzdEoxWHpNRGZkNW9J?=
 =?utf-8?B?YWVOanUrQ3hnaTVNRnZINlU1K3BqUDBocW96bHhlR1Nsbk50ejNoSzl6T2tT?=
 =?utf-8?B?STh6NkVCbTdYMGw5N3ZlZnRVZjVqWGtCSG5oNk1xSmcrQUZTdmowVDhVNGZX?=
 =?utf-8?B?ZVlqRzRGNTJicjB6cm9tb2IxMVdFRERTeWlUQXc2bFJmWVFJUzNPL1pLb3Ft?=
 =?utf-8?B?d2F3Z0JFNmJ3aDAwclkxVm9ETkF0OHhCZmtRUjRwOVNiSTRDVHI4ckpwc0ZS?=
 =?utf-8?B?Y0JiUnd1ZzNSSkZINGw5bEVrN0JOUFhKYlJZYmI5blRsOEkrQ0IyMWtVMnFZ?=
 =?utf-8?B?UTBzYXlGVXIrMTN6Nlg4VmVJUzlPbjNiemhUVkRhclVKR2xwc09PTkhOREFT?=
 =?utf-8?B?VkNGMW4vcGNIOTg1MmQwajczc0E2dmhmRzVkY1BhRXpROHhSRVZTQVhvWXpE?=
 =?utf-8?B?WGlYSnFmZzNsWG1PSFlPSGpBQnVoMTVvTzhadHlJR3J0Z3pZRGJKRk56UmFm?=
 =?utf-8?B?ZGN5eXd5cHhhQ0pHS1Jvd09SWDRpbytYbGZBMndVSFJHZ2FxREF2SE5mdCtK?=
 =?utf-8?B?K0FrV3BZZ21zTE95Wkl6VVRuQVU0L1BDakVUb2Nkb1kzUXRGNmxCZG8zTTFy?=
 =?utf-8?Q?N3Bo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f1c845e-a2ef-4f8e-233b-08dbc99a8378
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2023 14:09:27.0545
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CG5HDm8pyoGaT+Ca3Ide9NCfc1kx9G+reWdngg3hZIhmU74f1YKt7lz7A41qzEC4Gunb5Pj3cjK5zoD0I1fPoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5628
Subject: RE: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

DQo+IEZyb206IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+DQo+IFNlbnQ6IFR1
ZXNkYXksIE9jdG9iZXIgMTAsIDIwMjMgNzozMCBQTQ0KDQo+ID4gVGhlIGh5cGVydmlzb3IgZHJp
dmVyIGNvbXBvc2VzIHRoZSB2UENJIGRldmljZS4gU28gdGhlcmUgaXNu4oCZdCBhIG5lZWQgdG8N
Cj4gbWlncmF0ZSB0aGUgcGNpIHN0YXRlLg0KPiA+IE9ubHkgZXhjZXB0aW9uIGlzIFZJUlRJT19Q
Q0lfQ0FQX1BDSV9DRkcsIHdoaWNoIGlzIGNvdmVyZWQgaW4gdGhpcyB2MS4NCj4gPg0KPiANCj4g
eWVzIGJ1dCB3aGF0IHNlZW1zIGltcGxpY2l0IGlzIHRoYXQgZGV2aWNlIGlzIGluIHNvbWUgcmVh
c29uYWJsZSBzdGF0ZSB3aGVuDQo+IHRoaW5nIHRoaW5nIGhhcHBlbnMuIGUuZy4gYXJlIHRoZXJl
IG5vIGxpbWl0YXRpb25zIGF0IGFsbCBlLmcuIGluIHdoaWNoIG9yZGVyDQo+IHRoaW5ncyBoYXBw
ZW4/IGNhbiB5b3UgcmVhbGx5IGZpcnN0IGNvbmZpZ3VyZSB2aXJ0aW8gdGhlbiBwY2kgY29uZmln
PyBmb3Igc3VyZT8NCj4gDQpGaXJzdCBwY2kgY29uZmlnIGlzIHNldHVwLCBsaWtlIGJ1cyBtYXN0
ZXIgZW5hYmxlIGV0Yy4NCkFmdGVyIHRoYXQgcG9pbnQsIHRoZSBkZXZpY2UgaXMgaGFuZGVkIHRv
IHZpcnRpbyB0aGluZ3MuDQoNCkZyb20gZGV2aWNlIGNvbnRleHQgd3JpdGUgcGVyc3BlY3RpdmUs
IEkgZG91YnQgdGhlIG9yZGVyIG1hdHRlcnMuDQpGb3IgZXhhbXBsZSwgaWYgcGNpIGJ1cyBtYXN0
ZXIgYW5kIG1zaXggYXJlIGVuYWJsZWQgYWZ0ZXIgZGV2aWNlIGNvbnRleHQgcmVzdG9yZSBvciBi
ZWZvcmUgd291bGQgbm90IG1hdHRlciBtdWNoLg0KQXMgbG9uZyBhcyB0aGV5IGFyZSBkb25lIGJl
Zm9yZSBtYWtpbmcgdGhlIGRldmljZSBtb2RlIHRvIGFjdGl2ZS4NCg0KPiA+ID4gPiA+ID4NCj4g
PiA+ID4gPiA+ID4gPmFuZCBkZXZpY2UgY29uZmlndXJhdGlvbiBzcGFjZSBtYXkgY2hhbmdlLiBc
XA0KPiA+ID4gPiA+ID4gPiA+ICtcaGxpbmUNCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4g
SSBzdGlsbCBkb24ndCBnZXQgd2h5IHdlIG5lZWQgYSAic3RvcCIgc3RhdGUgaW4gdGhlIG1pZGRs
ZS4NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IEFsbCBwY2kgZGV2aWNlcyB3aGljaCBiZWxv
bmcgdG8gYSBzaW5nbGUgZ3Vlc3QgVk0gYXJlIG5vdA0KPiA+ID4gPiA+ID4gc3RvcHBlZA0KPiA+
ID4gYXRvbWljYWxseS4NCj4gPiA+ID4gPiA+IEhlbmNlLCBvbmUgZGV2aWNlIHdoaWNoIGlzIGlu
IGZyZWV6ZSBtb2RlLCBtYXkgc3RpbGwgcmVjZWl2ZQ0KPiA+ID4gPiA+ID4gZHJpdmVyIG5vdGlm
aWNhdGlvbnMgZnJvbSBvdGhlciBwY2kgZGV2aWNlLA0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gRGV2
aWNlIG1heSBjaG9vc2UgdG8gaWdub3JlIHRob3NlIG5vdGlmaWNhdGlvbnMsIG5vPw0KPiA+ID4g
PiA+DQo+ID4gPiA+ID4gPiBvciBpdCBtYXkgZXhwZXJpZW5jZSBhIHJlYWQgZnJvbSB0aGUgc2hh
cmVkIG1lbW9yeSBhbmQgZ2V0DQo+ID4gPiA+ID4gPiBnYXJiYWdlDQo+ID4gPiBkYXRhLg0KPiA+
ID4gPiA+DQo+ID4gPiA+ID4gQ291bGQgeW91IGdpdmUgbWUgYW4gZXhhbXBsZSBmb3IgdGhpcz8N
Cj4gPiA+ID4gPg0KPiA+ID4gPiBTZWN0aW9uIDIuMTAgU2hhcmVkIE1lbW9yeSBSZWdpb25zLg0K
PiA+ID4gPg0KPiA+ID4gPiA+ID4gQW5kIHRoaW5ncyBjYW4gYnJlYWsuDQo+ID4gPiA+ID4gPiBI
ZW5jZSB0aGUgc3RvcCBtb2RlLCBlbnN1cmVzIHRoYXQgYWxsIHRoZSBkZXZpY2VzIGdldCBlbm91
Z2gNCj4gPiA+ID4gPiA+IGNoYW5jZSB0byBzdG9wDQo+ID4gPiA+ID4gdGhlbXNlbHZlcywgYW5k
IGxhdGVyIHdoZW4gZnJlZXplZCwgdG8gbm90IGNoYW5nZSBhbnl0aGluZyBpbnRlcm5hbGx5Lg0K
PiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiArMHgyICAgJiBGcmVlemUgJg0KPiA+ID4gPiA+
ID4gPiA+ICsgSW4gdGhpcyBtb2RlLCB0aGUgbWVtYmVyIGRldmljZSBkb2VzIG5vdCBhY2NlcHQg
YW55DQo+ID4gPiA+ID4gPiA+ID4gK2RyaXZlciBub3RpZmljYXRpb25zLA0KPiA+ID4gPiA+ID4g
Pg0KPiA+ID4gPiA+ID4gPiBUaGlzIGlzIHRvbyB2YWd1ZS4gSXMgdGhlIGRldmljZSBhbGxvd2Vk
IHRvIGJlIGZyZWV6ZWQgaW4NCj4gPiA+ID4gPiA+ID4gdGhlIG1pZGRsZSBvZiBhbnkgdmlydGlv
IG9yIFBDSSBvcGVyYXRpb25zPw0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBGb3IgZXhh
bXBsZSwgaW4gdGhlIG1pZGRsZSBvZiBmZWF0dXJlIG5lZ290aWF0aW9uIGV0Yy4gSXQNCj4gPiA+
ID4gPiA+ID4gbWF5IGNhdXNlIGltcGxlbWVudGF0aW9uIHNwZWNpZmljIHN1Yi1zdGF0ZXMgd2hp
Y2ggY2FuJ3QgYmUNCj4gbWlncmF0ZWQgZWFzaWx5Lg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+
ID4gWWVzLiBpdCBpcyBhbGxvd2VkIGluIG1pZGRsZSBvZiBmZWF0dXJlIG5lZ290aWF0aW9uLCBm
b3Igc3VyZS4NCj4gPiA+ID4gPiA+IEl0IGlzIHBhc3N0aHJvdWdoIGRldmljZSwgaGVuY2UgaHlw
ZXJ2aXNvciBsYXllciBkbyBub3QgZ2V0IHRvDQo+ID4gPiA+ID4gPiBzZWUgc3ViLQ0KPiA+ID4g
c3RhdGUuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gTm90IHN1cmUgd2h5IHlvdSBjb21tZW50
LCB3aHkgaXQgY2Fubm90IGJlIG1pZ3JhdGVkIGVhc2lseS4NCj4gPiA+ID4gPiA+IFRoZSBkZXZp
Y2UgY29udGV4dCBhbHJlYWR5IGNvdmVycyB0aGlzIHN1Yi1zdGF0ZS4NCj4gPiA+ID4gPg0KPiA+
ID4gPiA+IDEpIGRyaXZlciB3cml0ZXMgZHJpdmVyX2ZlYXR1cmVzDQo+ID4gPiA+ID4gMikgZHJp
dmVyIHNldHMgRkVBVVRSRVNfT0sNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IDMpIGRldmljZSByZWNl
aXZlIGRyaXZlcl9mZWF0dXJlcw0KPiA+ID4gPiA+IDQpIGRldmljZSB2YWxpZGF0aW5nIGRyaXZl
cl9mZWF0dXJlcw0KPiA+ID4gPiA+IDUpIGRldmljZSBjbGVhcnMgRkVBVFVSRVNfT0sNCj4gPiA+
ID4gPg0KPiA+ID4gPiA+IDYpIGRyaXZlciByZWFkIHN0YXRzIGFuZCByZWFsaXplIEZFQVRVUkVT
X09LIGlzIGJlaW5nIGNsZWFyZWQNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IElzIGl0IHZhbGlkIHRv
IGJlIGZyb3plbiBvZiB0aGUgYWJvdmU/DQo+ID4gPiA+IE5vLiBkZXZpY2UgbW9kZSBpcyBmcm96
ZW4gd2hlbiBoeXBlcnZpc29yIGlzIHN1cmUgdGhhdCBubyBtb3JlDQo+ID4gPiA+IGFjY2VzcyBi
eSB0aGUNCj4gPiA+IGd1ZXN0IHdpbGwgYmUgZG9uZS4NCj4gPiA+ID4gV2hhdCBjYW4gaGFwcGVu
IGJldHdlZW4gIzIgYW5kICMzLCBpcyBkZXZpY2UgbW9kZSBtYXkgY2hhbmdlIHRvIHN0b3AuDQo+
ID4gPiA+IEFuZCBpbiBzdG9wIG1vZGUsIGRldmljZSBjb250ZXh0IHdvdWxkIGNhcHR1cmUgIzUg
b3IgIzQsIGRlcGVuZGluZw0KPiA+ID4gPiB3aGVyZSBpcw0KPiA+ID4gZGV2aWNlIGF0IHRoYXQg
cG9pbnQuDQo+ID4gPiA+DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBBbmQgd2hhdCdzIG1v
cmUsIHRoZSBhYm92ZSBzdGF0ZSBtYWNoaW5lIHNlZW1zIHRvIGJlIHZpcnRpbw0KPiA+ID4gPiA+
ID4gPiBzcGVjaWZpYywgYnV0IHlvdSBkb24ndCBleHBsYWluIHRoZSBpbnRlcmFjdGlvbiB3aXRo
IHRoZQ0KPiA+ID4gPiA+ID4gPiBkZXZpY2Ugc3RhdHVzIHN0YXRlDQo+ID4gPiA+ID4gbWFjaGlu
ZS4NCj4gPiA+ID4gPiA+IEZpcnN0LCBhYm92ZSBpcyBub3QgYSBzdGF0ZSBtYWNoaW5lLg0KPiA+
ID4gPiA+DQo+ID4gPiA+ID4gU28gaG93IGRvIHJlYWRlcnMga25vdyBpZiBhIHN0YXRlIGNhbiBn
byB0byBhbm90aGVyIHN0YXRlIGFuZCB3aGVuPw0KPiA+ID4gPiA+DQo+ID4gPiA+IE5vdCBzdXJl
IHdoYXQgeW91IG1lYW4gYnkgcmVhZGVyLiBDYW4geW91IHBsZWFzZSBleHBsYWluLg0KPiA+ID4g
Pg0KPiA+ID4gPiA+ID4gU2Vjb25kLCBpdCBpcyBub3QgdmlydGlvIHNwZWNpZmljLg0KPiA+ID4g
PiA+DQo+ID4gPiA+ID4gSXQncyBzb21laG93IGZvciBzdXJlLCBmb3IgZXhhbXBsZSB5b3Ugc2Fp
ZCBkZXZpY2UgY29udGV4dCBuZWVkDQo+ID4gPiA+ID4gdG8gYmUgcHJlc2VydmVkLiBBbmQgYXMg
ZmFyIGFzIEkgc2VlIHRoZSBkZXZpY2UgY29udGV4dCBpcyBhbGwNCj4gPiA+ID4gPiB2aXJ0aW8g
c3BlY2lmaWMgaW4NCj4gPiA+IHBhdGNoIDMuDQo+ID4gPiA+ID4NCj4gPiA+ID4gU3VyZSwgZGV2
aWNlIGNvbnRleHQgaXMgdmlydGlvIHNwZWNpZmljLiA6KSBEZXZpY2UgY29udGV4dCB3aWxsDQo+
ID4gPiA+IHJlZmxlY3QgaWYgdGhpbmdzIGNoYW5nZWQgaW4gdGhlIHN0b3AgbW9kZS4NCj4gPiA+
ID4NCj4gPiA+ID4gPiA+IEl0IGlzIHByZXNlbnQgaW4gbGVhZGluZyBPUyB0aGF0IGhhcyBmdW5k
YW1lbnRhbCByZXF1aXJlbWVudA0KPiA+ID4gPiA+ID4gdG8gc3VwcG9ydCBQMlANCj4gPiA+ID4g
PiBkZXZpY2VzLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gSWYgaXQncyBQQ0kgc3BlY2lmaWMsIGlu
c3RlYWQgb2YgdHJ5aW5nIHRvIGRvIGEgd29ya2Fyb3VuZCBpbg0KPiA+ID4gPiA+IHZpcnRpbywg
d2h5IG5vdCBpbnZlbnQgYSBtZWNoYW5pc20gdGhlcmU/DQo+ID4gPiA+ID4NCj4gPiA+ID4gSXQg
aXMgbm90IGEgd29ya2Fyb3VuZCBpbiB2aXJ0aW8uDQo+ID4gPiA+IEl0IGlzIHRoZSB3YXkgcGNp
IHAycCBkZXZpY2VzIHdvcmsgZm9yIHdoaWNoIG9uZSBuZWVkcyB0byBiZQ0KPiA+ID4gPiByZWNl
cHRpdmUgdG8NCj4gPiA+IGhhbmRsZSB0aGUgaW50ZXJhY3Rpb24uDQo+ID4gPiA+DQo+ID4gPiA+
DQo+ID4gPiA+ID4gPiBUaGlyZCwgaXQgaXMgbm90LCBpbnRlcmFjaW5nIHdpdGggdGhlIF9hY3R1
YV8gZGV2aWNlIHN0YXR1cy4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBJbiAiU1VTUEVORCIg
cGF0Y2gtNSwgeW91IGFscmVhZHkgYXNrZWQgdGhpcyBxdWVzdGlvbi4gSQ0KPiA+ID4gPiA+ID4g
YXNzdW1lIHlvdSBhc2tlZA0KPiA+ID4gPiA+IGFnYWluIHNvIHRoYXQgdGhpcyBzZXJpZXMgaXMg
Y29tcGxldGUuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBGb3IgZXhhbXBsZSwNCj4gPiA+
ID4gPiA+ID4gd2hhdCBoYXBwZW5zIGlmIHRoZSBkcml2ZXIgd2FudHMgdG8gcmVzZXQgYnV0IHRo
ZSBkZXZpY2UgaXMNCj4gPiA+ID4gPiA+ID4gaW4gc3RvcCBtb2RlPyBZb3UgdG9sZCBtZSBpdCBp
cyBhZGRyZXNzZWQgaW4geW91ciBzZXJpZXMgYnV0DQo+ID4gPiA+ID4gPiA+IGxvb2tzIG5vdC4g
T25jZSB5b3UgdHJ5IHRvIGRlc2NyaWJlIHRoYXQsIHlvdSdyZSBhY3R1YWxseQ0KPiA+ID4gPiA+
ID4gPiB0cnkgdG8gY29ubmVjdCBzdGF0ZXMgYmV0d2VlbiB0aGUNCj4gPiA+ID4gPiB0d28gc3Rh
dGUgbWFjaGluZXMuDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBBcyBsaXN0ZWQgaW4gdGhl
IGRlZmluaXRpb24gb2YgdGhlIHN0b3AgbW9kZSwgdGhlIGRldmljZSBkbw0KPiA+ID4gPiA+ID4g
bm90IGFjdCBvbiB0aGUNCj4gPiA+ID4gPiBpbmNvbWluZyB3cml0ZXMsIGl0IG9ubHkga2VlcCB0
cmFja3Mgb2YgaXRzIGludGVybmFsIGRldmljZQ0KPiA+ID4gPiA+IGNvbnRleHQgY2hhbmdlIGFz
IHBhcnQgb2YgdGhpcy4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFNvIG9ubHkgdGhlIGRyaXZlciBu
b3RpZmljYXRpb24gaXMgYWxsb3dlZCBieSBub3QgY29uZmlnIHdyaXRlPw0KPiA+ID4gPiA+IFdo
YXQncyB0aGUgY29uc2lkZXJhdGlvbiBmb3IgYWxsb3dpbmcgZHJpdmVyIG5vdGlmaWNhdGlvbj8N
Cj4gPiA+ID4gPg0KPiA+ID4gPiBCZWNhdXNlIGZvciBtb3N0IHByYWN0aWNhbCBwdXJwb3Nlcywg
cGVlciBkZXZpY2Ugd2FudHMgdG8gcXVldWUNCj4gPiA+ID4gYmxrLCBuZXQNCj4gPiA+IG90aGVy
IHJlcXVlc3RzIGFuZCBub3QgZG8gZGV2aWNlIGNvbmZpZ3VyYXRpb24uDQo+ID4gPiA+DQo+ID4g
PiA+IERvIHlvdSBrbm93IGFueSBkZXZpY2UgY29uZmlndXJhdGlvbiBzcGFjZSB3aGljaCBpcyBS
Vz8NCj4gPiA+ID4gRm9yIG5ldCBhbmQgYmxrIEkgcmVjYWxsIGl0IGFzIFJPPw0KPiA+ID4NCj4g
PiA+IE5vIGl0IGlzbid0LiBQbHMgbG9vayBhdCB0aGUgc3BlYyBpZiB5b3UgbmVlZCB0byBjaGVj
ayB0aGF0IDspDQo+ID4gPg0KPiA+IE9rLiB3aWxsIGNoZWNrLiBCdXQgcmVnYXJkbGVzcywgaXQg
aXMgZmluZSwgYmVjYXVzZSB3aGVuIFNUT1AgaXMgZG9uZSwgY29uZmlnDQo+IHdyaXRlcyBzaG91
bGQgbm90IG9jY3VyIGFueXdheS4NCj4gDQo+IA0KPiBpIGRvbid0IHNlZSBhIHN0YXRlbWVudCBs
aWtlIHRoaXMgYnV0IG1heWJlIGkgbWlzc2VkIGl0Lg0KPg0KSSBhbSBtaXNzaW5nIGl0LCB3aWxs
IGFkZC4NCg==

