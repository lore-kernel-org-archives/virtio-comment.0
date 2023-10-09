Return-Path: <virtio-comment-return-7632-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 086F4E95A8E
	for <virtio-comment@archiver.kernel.org>; Mon,  9 Oct 2023 12:02:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4CD3F77E8A
	for <virtio-comment@archiver.kernel.org>; Mon,  9 Oct 2023 12:02:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3998B986511
	for <virtio-comment@archiver.kernel.org>; Mon,  9 Oct 2023 12:02:57 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 270EA9864CE; Mon,  9 Oct 2023 12:02:57 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 16EC29864D3
	for <virtio-comment@lists.oasis-open.org>; Mon,  9 Oct 2023 12:02:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LsDjDwOaFh6zHVFuYs7DHVQPXFHkh54+vSblSnelc3wsMW0g5+bayY9InTune2m1KuZVJ0QvSM3TrdrRLZheOPcOmo/q5ydIAYhP4gEHUEZAx8uKxI/86lmQhPRD1WD0JLvdI+H/GFP3DOwsB/JqNurP4o7Q7c87HRrc73AmghrWfdmq7ILZcKhoCDmcJcluxN5aI8e5jn31GVvt8uIvdv+98ROjKkVRvUl5T7Hf57NLrPDUzxzoskEHKM8WMRTIIZszmW04B2iTyfiDERMmct0x+aDCxQJb5XhUrRfxY1bQOfaNxrzFAHog1mlQixHpXa8CiOHXjdwE+l+fP9YcHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FEDdNAYUTXLyvZO+3H6Zf5whrqICN/PPuFadWv1Mo5Q=;
 b=dI/N/7mHxKRixA79s8VaiXdIsEIkib7w1BthCUiXdCt+MqeqKgo6toDR+V+KmlbO9MVsqmLf30rCti8p0qMyLXusIOWkWEEKK3Bu0BdmL7I4+WTELrcDJ9fZwbyRlwYejSeaxIEp/pncOB8cBHfQ4e2sZU8r31zNcCWMvY7t86zA6gIs2m2kz0ZninDBNIuhlzAOKhJoHx7FvNOifvr3wuZUkMtDR9sFtlHS8AdGm4vKFPunznx53aR00fEmLok8PGzTRadT9UXeMSTrkD5g357WZL4P1tSa+d9fS9voMCjsgJ6F2gfudxjvJBNGoOV5qwFcdJ+uv45p7wnOvICxIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Jason Wang <jasowang@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com"
	<sburla@marvell.com>, Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb
	<maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>, Zhu Lingshan
	<lingshan.zhu@intel.com>
Thread-Topic: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration
Thread-Index: AQHZ+dpD+jj/KUeLHUaMn2y+w39Cb7BBJzcAgAA1HlA=
Date: Mon, 9 Oct 2023 12:02:54 +0000
Message-ID:
 <DM8PR12MB54801E873241AA02CC32CDCBDCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
References: <20231008112555.473895-1-parav@nvidia.com>
 <20231008112555.473895-2-parav@nvidia.com>
 <CACGkMEt0PNFUoVEYDtgziE5scYqauADX6PF-_f0NSCcWB_FrCA@mail.gmail.com>
In-Reply-To:
 <CACGkMEt0PNFUoVEYDtgziE5scYqauADX6PF-_f0NSCcWB_FrCA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5480:EE_|BN9PR12MB5227:EE_
x-ms-office365-filtering-correlation-id: 1fb8b451-b304-4ff9-455c-08dbc8bfab63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ERroJ1CDgO6udLXA09o2gESodTm7OXU31YOYp0RRW8khHdbBxu3/r96hvmvJNpdQLzrDtRNo0bs3aRzywHu0pPZmQ/Rw2ppCP6ERQq54WPtC727LZMvBVf6hDjqOk70il36YpAhbasUXVNz2ZUXSpDP92mOZYbhkm5nhb9wf/tpJh3/+PYyVelgEaNGRcKa2esU7LcAwaSC/h3YLEyWWsHYY0i7bR9LnaEznPWVXHB9u7VDuhVsngTm7OEe/IXCE+crE8vU8ZNsGPjalryhb1vbH9GNheERab2RAwYp1Ui3HRX/sFLhyQ9f3teqT3/kn17mLtyixv5jyBg9kyuEnrbmicm2/WB8Tfd9uhI8il/AZMzKT/W62cacWnzVDJxwEtv+Gtt0v3dwGuiHfVeex/XNZgDF0XIY2fl/BCGj11RKtLqPzOWDu6fp4iZtZci/QA0mFsZ5VRn0jwoXogk5vRFMoiHFegmqHel3JUm51zNpMTbLULTwyqbCbnEHwhMD/VKPA3j90JjSgty4fpFtrF1NlVXZD5c/Teq0rn4gSyVjz1KF/AKBZbifTBMMcGMcr/6DPGtnKyuHtUbUngXkGesNBM98LwP1TwXb0zsPbtokcSKisX4U5D+gTicnRrctS
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(376002)(366004)(346002)(396003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(55016003)(53546011)(7696005)(9686003)(6506007)(478600001)(71200400001)(41300700001)(26005)(4744005)(2906002)(5660300002)(66446008)(66476007)(66556008)(76116006)(54906003)(66946007)(64756008)(6916009)(4326008)(8676002)(52536014)(316002)(8936002)(38100700002)(33656002)(38070700005)(86362001)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TmtPU2htR3hCNmpQTWRIVGRJaFd2bGlHb2RWVmo3NUhWRmwwOHZXemliZDJF?=
 =?utf-8?B?Z1RGSzNBYnhXcWh1ck9qekh6YXNLVE10SXcvVTVVbzgzcWRNb3hUYXRxL2RC?=
 =?utf-8?B?WnA0NjIzYXd3bEl4b3BDN2Q2OEtiUnVNMDBnTTdoZmZ6dTZDc0Frd1ovbEU1?=
 =?utf-8?B?SEptSjFVYTBvRm40ZW8xSlIzYWxvcTRWdXZqVmhlZlR1RUs1d1V3ekNublhY?=
 =?utf-8?B?NTlLTHpKejlXcHZqQUtYbW92V0hEOTlqMWM3SlVlZTA2MURmTVZ4cnZhVHdT?=
 =?utf-8?B?UllQcVQ1MEhxcDlrc3RhVlMrVDJ1UjVUNHVWVEpsTFdVbGFFMjU4MDYvOW4x?=
 =?utf-8?B?NUd2UXczRjFtZDhNWjZBY2N4RHdkanhSMUU1SmJhOWFTSW1ha0RCUmpQazVw?=
 =?utf-8?B?bUp0RWRkNjMweWw5S3lkMmxBYmZMdlc2b21DeW5SbmNSYjVaeTluWFA2Nmh2?=
 =?utf-8?B?aExMTTY1ZDI3OXVGM3dNWDBiWlB6RVRTaU9Lb2hmd0tITlFiVGp1OFNDVmRI?=
 =?utf-8?B?b0tsRHVhUWNjTFNobFAvbk1wNG5oQXJQUGhidk5mQnI1emNJRDNoZVZnbHJx?=
 =?utf-8?B?cDJtNUpId010REdseGh1bVVJMTlJc0Y1RlV3L3ZPRjlZVGRwUW1raktpT25m?=
 =?utf-8?B?L2RNRjcvT0FjblY4L0p4Yi9Ya3c5bnNGejJhM0tTUmtNeG5DYmJ0dmp0ZUdu?=
 =?utf-8?B?QkxNSnhYeVZaakcySDBtYkhQb1N0RTg1KzdyS0hlblpyakkySGw5ZjVnVFJJ?=
 =?utf-8?B?MFhiTnpmald1ZTgrazlscFJSMWIza1ZkZE9CYTAwaHkwOTdadTczREMrSWlk?=
 =?utf-8?B?RlFkR1VZaUl1L3l0Z2MwSkxtdEtwcjVBM1d2Vkw1Y2p0Vk9LSWc0RGUvZkx0?=
 =?utf-8?B?MENtVldhaU55VjhBSGZTandCK3hoTzdGS0lvWlQxKzRDNktGck5aeFdZZCtG?=
 =?utf-8?B?S0h0WTcvcmN5Q1FGQ0UxYWtJUW9NemJLb3RmQkRJTzVSTXZYQ3lNZXpPUzNt?=
 =?utf-8?B?aHZ4dVh4SngrS3BSTTNFMlltcE5qNkJyY1hXQVlhcXBvY2F0d1EwakZOSGND?=
 =?utf-8?B?RXhkQ2s3SWxlWEpjY2pUUHp5U29YNE5tN1ZvYjAyZ21iYTZHRWtPNTNVd1Zm?=
 =?utf-8?B?R0Q3QzFWaHpybk9YaDF5Wk5JdDdiRkpIdUswaFBmVnNad2JkWnBqM0RtRHpj?=
 =?utf-8?B?VVVINE0yVVZIQVNuRmgvcU4xemphWVFHd1h0Q0UxRlduVkdqMGZ0Ykx4eWNQ?=
 =?utf-8?B?SjE0QUV0czNoUVZNYVcxZ0Q2Y3gzN1JXTHZwcjRzRXpQZHFOMzdOLzNzOHlH?=
 =?utf-8?B?cXpybHJ5MnR6NW81cWNta1IxTEh2SHJ0TmhwVHhnU1dqK1g2RG1mTjNKa3F0?=
 =?utf-8?B?NkJJWnVSNnY1ZnF6cW9Rb0U5L25UWUprMnk4bTU1Qk9TaXRIWWJqeHRlaUVO?=
 =?utf-8?B?emEvMXdvL1UzTCt1bFp6WVF5SitWUjBYWDZNTSsra0psdTdZNlVJTk9sRnNO?=
 =?utf-8?B?UU1KR2hFV1Vkd2VodE9reWpFYXNtRk5UalBRL3FoYUJPcVVJL1JOZDNySlB5?=
 =?utf-8?B?ZlQrcDdKK2Fnam9IVHhTV0VRNVdxMC9DYzBtb1ZZOWdHcGoyaE9iYzhuT296?=
 =?utf-8?B?cjZYVk1yY3lGdStWZGZXdEFxbjV2NEQ2MkNLL29kcEdxY3NSTU11b1o3RjZj?=
 =?utf-8?B?eUU4WE5qTWtMOTFlOHZhdkExR0NadVF2eUMwWXAzcDhEenY0QklTZy9JSjB4?=
 =?utf-8?B?bHp3WDlSVERWTU82MC9lallwbGJkdjRsRGViZmVqd2l5dFN0SXZqSFZueWtP?=
 =?utf-8?B?K0NjbmZ3U21DbTNDUlFRVStQdlhVOWJ6cTArUmVwdkJ0bXNvWFh1VjQyYTNt?=
 =?utf-8?B?ODVVbW5WSVFHaW1SeEM3UGYvZ1RCR3hrS1BKdC9lN1JnNnRIaXdQamU2K1o3?=
 =?utf-8?B?VHcyWU5jVzJxTkVza0k0VUlLVHByWkxGMkNwRkp5K0xiZFdHT2RKVWMxbzRR?=
 =?utf-8?B?V3ltOVdyWDU2NHBSa2RBQ0JiMFpaZUdFbWpSK3liZmVIQ2JIVFlzYU1kenpv?=
 =?utf-8?B?bjBPa2JpalBCeXJyZk1qUTkwaTErSkcvMENOQXJkaWNKaU5TZ2VzMkRFT3Zh?=
 =?utf-8?Q?K3uI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5480.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fb8b451-b304-4ff9-455c-08dbc8bfab63
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2023 12:02:54.2655
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nUrbCkL4zXOeupf+HF6FHonlJrVwhM0fXu7WhvEx/lh0+KAVTn1lt4nZ6fw/oqRTA8ZrQ/zvbiRdvamr4PTFIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5227
Subject: RE: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

SGkgSmFzb24sDQoNCj4gRnJvbTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4NCj4g
U2VudDogTW9uZGF5LCBPY3RvYmVyIDksIDIwMjMgMjoxOSBQTQ0KPiANCj4gQWRkaW5nIExpbmdT
aGFuLg0KPiANCj4gUGFyYXYsIGlmIHlvdSB3YW50IGFueSBzcGVjaWZpYyBwZW9wbGUgdG8gY29t
bWVudCwgcGxlYXNlIGRvIGNjIHRoZW0uDQo+IA0KPiBPbiBTdW4sIE9jdCA4LCAyMDIzIGF0IDc6
MjbigK9QTSBQYXJhdiBQYW5kaXQgPHBhcmF2QG52aWRpYS5jb20+IHdyb3RlOg0KPiA+DQo+ID4g
T25lIG9yIG1vcmUgcGFzc3Rocm91Z2ggUENJIFZGIGRldmljZXMgYXJlIHViaXF1aXRvdXMgZm9y
IHZpcnR1YWwNCj4gPiBtYWNoaW5lcyB1c2FnZSB1c2luZyBnZW5lcmljIGtlcm5lbCBmcmFtZXdv
cmsgc3VjaCBhcyB2ZmlvIFsxXS4NCj4gDQo+IE1lbnRpb25pbmcgYSBzcGVjaWZpYyBzdWJzeXN0
ZW0gaW4gYSBzcGVjaWZpYyBPUyBtYXkgbWlzbGVhZCB0aGUgdXNlciB0byB0aGluaw0KPiBpdCBj
YW4gb25seSB3b3JrIGluIHRoYXQgc2V0dXAuIExldCdzIG5vdCBkbyB0aGF0LCB2aXJ0aW8gaXMg
bm90IG9ubHkgdXNlZCBmb3IgTGludXgNCj4gYW5kIFZGSU8uDQpUaGlzIGlzIGp1c3Qgb25lIGV4
YW1wbGUgb24gaG93IHRoZXNlIGNvbW1hbmRzIGFyZSB1c2VmdWwuDQpJdCBjYW4gYmUgdXNlZnVs
IGluIG1vcmUgd2F5cyB0b28gaW4gbW9yZSBPU2VzIHRvby4NCkkgd2lsbCBkcm9wIGZyb20gdGhl
IHBhdGNoIGNvbW1pdCBsb2cgYW5kIGtlZXAgYXMgaW5mb3JtYXRpb24gcHVycG9zZSBpbiBjb3Zl
ciBsZXR0ZXIuDQpXb3VsZCB0aGF0IHdvcmsgZm9yIHlvdT8NCg0KSSBkb27igJl0IGhhdmUgYW55
IHN0cm9uZyBvcGluaW9uIHRvIGtlZXAgaXQgb3IgcmVtb3ZlIGl0IGFzIG1vc3Qgc3Rha2Vob2xk
ZXJzIGhhcyB0aGUgY2xlYXIgdmlldyBvZiByZXF1aXJlbWVudHMgbm93Lg0KTGV0IG1lIGtub3cu
DQo=

