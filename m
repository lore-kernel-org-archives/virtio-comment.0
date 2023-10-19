Return-Path: <virtio-comment-return-7868-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4250C41513
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 12:02:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E30AC71C83
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 12:02:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D60F69868E3
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 12:02:29 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C4B0B9868E1; Thu, 19 Oct 2023 12:02:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B23279868E2
	for <virtio-comment@lists.oasis-open.org>; Thu, 19 Oct 2023 12:02:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CAnWC+iRD4DDxdI2Z4o5V+7tROb1/e5X2H6d4QV3mMvxSWBrUm9iaO/FvkjmWqUlOic3FmBHG3m7E8yBDy0YI6yHpQKu/fXkVrPLuydc47rdImplz7XQmpPA5qumX9Z6RsaHM8Y6ZeVyP2wwv2+GFIR5Uk3COYWxqF5PnLqxiewIsjmidpE6ytfY53xqEPvpo8Z29DLeYwmaiDP/kim5VqRiwVxZr6k29b1EsAhC46685Lf2BKZC7LZuWgiuHwZbjaxacOqwMsQeDAaepFXkDEB7ZFXC4Qu50fngVl5o3MucG/LCpqd/YZYH8Lev7BfRJa0wNGn61oFiyQ1T2VS6sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UvIXbs83KXw0G6PLewYNeL04CYibRapxnxDVyxGYa+Y=;
 b=WQUuSKWjGRkPKAYthtJKigC7mUoKT8iZvxEzYW+mXsFW+Qtqs0eQckFO1FxsKe/cOwE/QgGw4QFopjI8eIaLBR1emWouSrdO+7CHXwcwJHJDjhsH2ix49OOZSfHdE4Nsz2VQULzSjSNxt34YBSJmHtpZCdNMAo0Z0YvsCjwR8AoT31PGsrq6tL6RQoPfNqaJkY4KRNKjOuSKmuIhv6n0aIYG1tWc13GMcv33Zd1yrsRpiwzcqTCfWcJRhHoUl08UvFke3tWwBek0jEqeXLFIwDvGqD1RCIzf20YMe/A4ezA+tDr+l1n5krzA5HXUeLivhaGLCjBAJ0Gjfw6YVVhgew==
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
Thread-Topic: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration
Thread-Index:
 AQHZ+dpHSUrTyyDEA0quapQP8C0hdbA/xRkAgAF/hoCAACxh4IABSWcAgAANqrCAAZnYAIAACyKAgAGFBICAAACFkIAAEwWAgAAD8yCAAXZ1gIAAIYLAgASWeYCAAtRh8IAAGoeAgAAAUKCAAARLAIAAB5cQgAAXYICAAABqYIABiiSAgAAMdcCAAALCgIAAADWggAABTwCAAAD9AIAAAmrwgAAfaICAAAqWkA==
Date: Thu, 19 Oct 2023 12:02:27 +0000
Message-ID:
 <PH0PR12MB548150A3AB3EA78F8C90DFD0DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <PH0PR12MB5481546E859578DE97D9E152DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <860e52ef-8cfc-408a-b3cc-2551ef6118d1@intel.com>
 <PH0PR12MB5481F6F9BC5158481EC36AE9DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <cd9431cc-a5ed-4b11-a341-dc129e8ea630@intel.com>
 <PH0PR12MB54819087A0B542F587A4BEC2DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <7bc82c01-19ad-4180-914b-9304e10ef7c3@intel.com>
 <PH0PR12MB5481E858791CA8FD97C7F35EDCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019051406-mutt-send-email-mst@kernel.org>
 <daea1f54-1c85-4a4a-ac3a-c5ae97180e03@intel.com>
 <PH0PR12MB5481BE51210D429FA12EAB45DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019070411-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231019070411-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SA1PR12MB6848:EE_
x-ms-office365-filtering-correlation-id: 7bd3b115-d9df-4936-2b3b-08dbd09b4378
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 6evc7jHoyl90KP6bBBmh2edlnPf56GJ+gU2P1fy2KqyDd1p8r03hwoj0xGJ11MK3co/pTiAnuTsa4Jdf7DLeBL+DzWaLi4LxPzcobyZ2i2FmYYMOTBBDiNMMZkYFE1dgglbY9/UwtArl7QHce954cgKD37R4ZZmuMrrwLDfuDkfKDsYCXdTNbf8CS3GhiRCqocAD8E80gqUwCaVP5az5qcE6FZPcwtv7YqPcNjYjqJCRBkQkhrIII27Pnstrk1s9A2qNmXtsejG9wgFaCRXa6MdFi3Vi12Q1vAJSQt4+ozJugy3XoUWJUEO/4K0zl+8jbQqVg/c1zxPW8+++Mus9reKBHBMmdJgOpkUuO2RvvOH5h3yA0VA/wq+YHygJZ2H5knm/hj4vSRtQDHcy0DuG5YNfLg0k3LGeSDobR9bwuY3emiGq3ixWZ7LEu9pBJiudqdsy+Q6LZufUzSB/MPMtV5NbhBG6G5FcnH2q062hrfiGIvrNlclbgclPHAA390xpIU9c7g+Red79bS/cPrbsDclMO13TA+tscQS5tJohRXUR0kCEpCRACQbNuaKTVoZhf/1t0K8JJQkpaH4ZY9SGeLyr2nAmlQGu/bhhBaKSl8KS5bspT7tmwyyzv+sqPLy9D3SwuHI+I+Nn/N0JNGDTZtNUCh/IivkJ+3Ug9QupMpM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(366004)(396003)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(55016003)(316002)(54906003)(64756008)(966005)(66946007)(6916009)(478600001)(66556008)(66446008)(66476007)(76116006)(71200400001)(55236004)(7696005)(83380400001)(5660300002)(38100700002)(9686003)(107886003)(6506007)(26005)(86362001)(122000001)(33656002)(38070700005)(8936002)(2906002)(4326008)(41300700001)(8676002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dWxsdWV1K0lLMXNzQU5YMkhSU1ZESXVkb1JlUmtPM0VkV0ZSVjVhUnRlVGda?=
 =?utf-8?B?YnpiWmFKR3pXTDhSZUFnaUYrZmJnZCtjV1ZkR2EyV0l3N3hJc2d6MmpCbmFE?=
 =?utf-8?B?a1F2MXRoMHpTVHhnRlFIaTBYeitLd29aUmZwQlZlMUc3THcxQVM3Q1ovNkUv?=
 =?utf-8?B?QW52V3lTd2lpY1lkbDhDS3lqa3Y1SFE0T05TamtZY1NFd1V4S3E2ditNckhk?=
 =?utf-8?B?Q3RWWmpYMmw1V2FwVzlMM0d4bFBLc0wrMUlabEdSU3Y2M0JQZVBHKzBJbytn?=
 =?utf-8?B?bUhCeHBEdmJ4NDJtcDRwd2JuWW1FSE42Mm41SG5ZREZESkkwTmZ0MUxHT0tX?=
 =?utf-8?B?K2EyNVg2ZGZDQmFFSTdpQjc2Rll3NHg0STAxRm5Qa2FjTDUxY01jeklaSk9u?=
 =?utf-8?B?THp4SUZVeVZBdU1vaVE5SnphQW5CKzcrVzY4a0xrQzVYU3VKa0VMQ01CaWx0?=
 =?utf-8?B?UE56cTkxcmNwbDA0YnVmUVJhTnNWNXJOby80TzFVNkhxOHAwYTlleXRsd1lI?=
 =?utf-8?B?NmJFelIrajBsOGRBbVFBclo4b1R5UWJWTDlwS2tJaDlRMWFxa2xJRnp1ZXNq?=
 =?utf-8?B?dVIrNnJSOE1aWkFMejJPWjd6WE9PVkpZY25Pd09FakpXRVFEU0NNbVU3a09H?=
 =?utf-8?B?cGtCbDBZZmZsQXNIZXNSQ0tEcG80aUNuWFlIVGdBY1dudklnWGtubmgxTFhK?=
 =?utf-8?B?ZEpzN3MyWEF4WWp4M0l6SWsvTVF1Q0JwSENIMWFhaEpWUmp2ckdGNzRWL216?=
 =?utf-8?B?RXRJbk1OaDREN2hqNzJ0em0ralIrU1FTUmQ3M05hTnFTVE5uenRQeWxTWlFG?=
 =?utf-8?B?cGhDQVVJOW1Nb05Tb2YxNm5sellVL2pvTnNEQWZETWlsZzhEVFc3VnlxT0l5?=
 =?utf-8?B?SzlCNFpZcWJ3K1NuZG5GQjV0b2gwSVM2ZFNJZHdzellEZlZZdldwRGhuWTVI?=
 =?utf-8?B?cU90NzRZOUhwUUdPeFEwL0hDL2xNNWcrSllRSXhjaTY4QUFEOGtuNzRtSzlP?=
 =?utf-8?B?K0ZHWjFnbFhoQnhJSHF0S2RVbWpxQXl0S0hUZktTbWdTYitUOGt6djNSZTZQ?=
 =?utf-8?B?blZJTnNnY1MrQ05QMUtURHNqMHpXVVhSZWtzSVBPenQrSVZmZlBKTEV0d0xL?=
 =?utf-8?B?aGRkdXBGbDh4SXgvT0V4clYyU05WMmJ0UUxrMnZKVVZNNThwR3N2aFR4aWlj?=
 =?utf-8?B?a3MzNHFUMk1vbTNSdkRzQ1JDK0EvMVJVcjJRMlR3cDBjU2hoNFUyUVBMVk4y?=
 =?utf-8?B?b3JOTlA0d3Vnbi9CQlFWWTJ4Q3MzT1NQbFNselBHNXF0QXo5K2IrdFVMYTdm?=
 =?utf-8?B?Unc1eVIwV09Cb3BoekZBY2xobmYzTFBrNFNvU3ZZNzlSbzZpdTIzR1AzdHlT?=
 =?utf-8?B?WVNmZzRVTGMyQVdtc0MwS1U0Z1NaOHV6SFhvOXhQbHJpdjhyTzhWb2RuOFNC?=
 =?utf-8?B?a21SQzkwVmVrRlE3b1RVUlF4SVREYTJjeURpb1Q0RU56NHZlTzFsemFqRWo0?=
 =?utf-8?B?c3JzUTkzeld3WDRsT0R4RElKQ04rOTRabTlqTGMwSGFvbEF0eWs3WXBRNjI3?=
 =?utf-8?B?MUtsS09xT3Bqb2tpL2UwOHJwMGFvRDBURkgydWRHekRkeitCVkZPZlYwT2lM?=
 =?utf-8?B?NXc3bmR4QW54a0VVb25ZVUtydVhDYUV2b25VSm9Vbk05SXpiOUI0NGgzSlpV?=
 =?utf-8?B?aUZOQjhTN0J5dFloaThNUTVPVzhVOXFibUt1RFJTOVoraTIvengzcTh0bTVh?=
 =?utf-8?B?azFNekFzVmYySTZ1RG1JQkFyaG9nOUJseTJwblpJdzNDWVBlYVdDQ2dZVnJG?=
 =?utf-8?B?S1FYRnJhMklYcW5CQnErdWZjT0YxRys1RFNid1UrVFBCaWRjN3RNaSsxQmFz?=
 =?utf-8?B?UVVIQ1JxUzE1eTMxYk9VOVdTaGpJZnBpZXNObzh6d1ArditHdWZuU0MvU3hW?=
 =?utf-8?B?M2dhbWhDSVlYQWsrYjd0Tmg2TW40NTZicElNdHV3eDNGdyt3QktObTVrODlE?=
 =?utf-8?B?NW9mMU5jNTZqYU9EQVFiREw1dWQ4MHN5YjNDSkxKSU8zakZiVk1uaTEvc3NP?=
 =?utf-8?B?MFFrTHNKOUxkamo3eHpNZERWZzJLamNRUkZ5WFh0bVNpcCtpMVdEekdCUks3?=
 =?utf-8?Q?Kfqo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bd3b115-d9df-4936-2b3b-08dbd09b4378
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2023 12:02:27.3182
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bIM50qkcZcsu/hUHc6JMKV8x4GYj3iyqZ71olOeqyWXZe34nsMS7oMUCivAkwy2uj+PcVXpueGBE2O9A5XLDkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6848
Subject: RE: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

PiBGcm9tOiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPg0KPiBTZW50OiBUaHVy
c2RheSwgT2N0b2JlciAxOSwgMjAyMyA0OjUwIFBNDQoNCj4gPiBOb3csIHdpdGggdGhhdCwgaWYg
dGhpcyBjYW4gYmUgdXNlZnVsIG9ubHkgZm9yIG5vbl9wYXNzdGhyb3VnaCwgSSBtYWRlIGh1bWJs
ZQ0KPiByZXF1ZXN0IHRvIHRyYW5zcG9ydCB0aGVtIHVzaW5nIEFRLCB0aGlzIHdheSwgeW91IGdl
dCBhbGwgYmVuZWZpdHMgb2YgQVEuDQo+ID4gQW5kIHRyeWluZyB0byB1bmRlcnN0YW5kLCB3aHkg
QVEgY2Fubm90IHBvc3NpYmxlIG9yIGluZmVyaW9yPw0KPiANCj4gSSB0aGluayB0aGUgcmVhbCBs
aW1pdGF0aW9uIGlzIHdpdGggdGhlIFNSSU9WIGdyb3VwIHR5cGUuIElmIHVzaW5nIFBBU0lEIGlu
c3RlYWQgb2YNCj4gc291cmNlIGlkIGZvciBpc29sYXRpb24gdGhlbiB3ZSdkIG5lZWQgYSBuZXcg
Z3JvdXAgdHlwZS4NClJJRCtQQVNJRCBpcyB0aGUgaXNvbGF0aW9uIG9iamVjdC4NCkhhdmVu4oCZ
dCBzZWVuIGp1c3QgUEFTSUQuDQoNCj4gQW5kIG1heWJlIGEgc2ltcGxlciBpbnRlcmZhY2UgdGhh
biB2aXJ0cXVldWUgc2luY2UgaXQncyBhbGwgc2xvdyBwYXRoIGFueXdheS4NCj4gDQpQb3N0IGZ1
bmN0aW9uYWxseSB3b3JraW5nLCBvbmUgd2lsbCBuZWVkIGFsbCBmZWF0dXJlcyBvZiB2cSBpbmNs
dWRpbmcgaW50ZXJydXB0IG5vdGlmaWNhdGlvbi4NCg0KPiANCj4gPiBJZiB5b3UgaGF2ZSBjb21t
YW5kcyBsaWtlIHN1c3BlbmQvcmVzdW1lIGRldmljZSwgcmVnaXN0ZXIgb3IgcXVldWUNCj4gdHJh
bnNwb3J0IHNpbXBseSBkb27igJl0IHdvcmssIGJlY2F1c2UgaXQncyB3cm9uZyB0byBiaWZ1cmNh
dGUgdGhlIGRldmljZSB3aXRoDQo+IHN1Y2ggd2VpcmQgQVBJLg0KPiA+IElmIHlvdSB3YW50IHRv
IGJpZmVyYWNhdGUgZm9yIG1lZGlhdGlvbiBzb2Z0d2FyZSwgaXQgcHJvYmFibHkgbWFrZXMgc2Vu
c2UgdG8NCj4gb3BlcmF0ZSBhdCBlYWNoIFZRIGxldmVsLCBjb25maWcgc3BhY2UgbGV2ZWwuIFN1
Y2ggYXJlIHZlcnkgZGlmZmVyZW50IGNvbW1hbmRzDQo+IHRoYW4gcGFzc3Rocm91Z2guDQo+ID4g
SSB0aGluayB2ZHBhIGhhcyBkZW1vbnN0cmF0ZWQgdGhhdCB2ZXJ5IHdlbGwgb24gaG93IHRvIGRv
IHNwZWNpZmljIHdvcmsgZm9yDQo+IHNwZWNpZmljIGRldmljZSB0eXBlLiBTbyBzb21lIG9mIHRo
b3NlIHdvcmsgY2FuIGJlIGRvbmUgdXNpbmcgQVEuDQo+ID4NCj4gPiBbMV0NCj4gPiBodHRwczov
L2xvcmUua2VybmVsLm9yZy92aXJ0aW8tY29tbWVudC84NzBhY2UwMi1mOTljLTQ1ODItOTMyZi1i
ZDEwMzM2DQo+ID4gMmRhZTlAaW50ZWwuY29tL1QvI20zNzc0M2FhOTI0NTM2ZDAyNTZkNmIzYjhl
ODNhMTFjNzUwZjI4Nzk0DQoNCg==

