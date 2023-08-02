Return-Path: <virtio-comment-return-6963-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 472A3C001E0
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 11:29:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9B03EC6225
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 11:29:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 858E4986654
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 11:29:56 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7482C98660F; Wed,  2 Aug 2023 11:29:56 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 61BBC98662A;
	Wed,  2 Aug 2023 11:29:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HZp1ygROeUB0exS8JbQ8m51/5wGSSG3DyUv+sMMq0Q95AQp5/GPS3cK7koNyuQhLcgzb70yNHsU0p6Ef6I/qDGxojqrUNtL/jM3sLyrsr25uUa8Vbxb0KZ/UBncrlqfezyah0O4//UzkihhNBVwf93dyco6p8wREqsiW/bwePu99lttqSeeSemEQXohYnxUG3aTqeAYGN4vxC0OEe5xqimaPPs1BVFyTNAMDFYkIEfmdmI9VH3/pktuMcqQemGkGB7ZdnC6GGR6XrWtGnS+1Yauaqk71+QFhwzH0ETwzD99Pr9iia7LnCeFbSU/Dhk4TAzFMdl8wmFNcdPmjbPohlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IP9O19MsDgOsvAVe+YtvNdC+GgrdvPVxRGYcuhbVaWI=;
 b=LQpPLFCNz+JuMMVNMCtvi1pbhwpSExoVyqIwyi7+cTIiJYixmup5NZB6C5MAR2HG6KlrKRCZUNtxuJi+PPcZ2Qvfmlfjhjcy95Z3dTIfxEp6O8T2mmK9a2c679B/IqxXkZliICHsLJme0m/RQJN1QTAHeqMnT2gOfUvefZ+a5t4qMq60OWVsMgu4O1ylQzd9DfnD34jPrMyOty+alI6f3THRqk23CETd1pK1kDIt3oQSF2HSRuHi/poC1PHPym5kzVkYcUzIGu4ePtEvKCy5rR2GFQJb+l2TAaJIRuDuQBZ3uqXooIaaJN3n5ercy7blfT0psNrDCOyES34O/89Odg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, "hengqi@linux.alibaba.com"
	<hengqi@linux.alibaba.com>
Thread-Topic: [virtio] RE: [virtio-comment] proposal: use admin command (and
 aq) of the device to query config space
Thread-Index:
 AdnERrUyzvIBkM4LRwukraLndwiuSgA2AnqAAABG9JAAARbHAAAALBowAAPNDQAAAAhQYA==
Date: Wed, 2 Aug 2023 11:29:53 +0000
Message-ID:
 <DM8PR12MB548071770075800FD9020D27DC0BA@DM8PR12MB5480.namprd12.prod.outlook.com>
References:
 <PH0PR12MB54818D33A150A01DACF3BF74DC0AA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsDo8dKSwD=Uovo=ekussqQmA8kf90jzuRoDBZs2B-GTw@mail.gmail.com>
 <PH0PR12MB548134EA03AE48ACD6F422CADC0BA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvHjAkbQ1D_PNhObpZ00g3P=E7Bzj3RvBPpst6cCFTWcQ@mail.gmail.com>
 <PH0PR12MB5481ABF25620784987149809DC0BA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230802071603-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230802071603-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5480:EE_|SA3PR12MB7806:EE_
x-ms-office365-filtering-correlation-id: 9f27d132-c301-4040-5ef4-08db934bcab3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 fi7+WZsZdvXQROZo+NUjndbtcrorboi7+GoOBcyN2e41vwAflX4CltqHssJkOM9uMOXkqoXPMYy7ALSUOajZ6Nqxx7gfiEfHabaJPyD6aZuMMbjSPtGfoDp8dc+4OCUK6q3n7bdJDeGPtGhT0BzTE7noxHyqvlrkQQq0LmyHJWrOdCr5a/HlyY37sLxrS7WXfIHdMW0cpQAiUT+G0zJYlinbnTE61yTKMKsBmlcDITn+ULysFzLNdURDk+FX77E657Bm+24Kz+a53Vv5mcLuKBVg3qrQtyXGtDR4LNmXSzMvG46NFPGt6uV+POhJoYXc9xtrWJ1n/1ROQiPT18NHXpdft9PhWpxqsB15+s1/k1do+CTTwifxccdlDABIVl+jmyTjA3zt1iFwpkTFDllrZMRnfLdZqJX2/EegWn1lppXPV7690vUD0YIjDsAkS53xBl89eH2ZCcnxTMjAnNFPDHh7G3F+26kqv504K/qMC/u9t8Ga2NSXdcZdPaSNABS5FbwefBdE0umazr6OmficzotnIiX1Pcq3v6n9wz0Z9sFDDm0VBLNHq6f0sH2IG7UPr7LDun3feI0iPnlO28OolieXYgMzOCPY9sur1eo4cvjozZIKgNELF2mhi7LqmcJ7
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(366004)(376002)(39860400002)(451199021)(8936002)(8676002)(38070700005)(41300700001)(5660300002)(2906002)(83380400001)(52536014)(55016003)(186003)(86362001)(122000001)(478600001)(54906003)(316002)(6506007)(33656002)(71200400001)(64756008)(7696005)(38100700002)(66946007)(76116006)(66446008)(66476007)(66556008)(6916009)(4326008)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eFg3MUloU3FUZmExT0dqcnc1RHpHL1dFdHdsWlUrU0ZJYTBkVFdXcklqL0Ju?=
 =?utf-8?B?MTBFZFR0UTByRWduNXF0aE1RcWhGVXAzTUkzQnNQckROdCtZbGQ3ODdGRTJq?=
 =?utf-8?B?SjREaG43QTNubFFCdjdMRHdyN2NpTG05TDFkNnZ1ZmxQb0V2QlVuUjZNckdL?=
 =?utf-8?B?d1JDenc1QlloYUFoOThiZjFURmtqVmxTM2ZrZVY3UlNyTmtSSEE3L29zWGtr?=
 =?utf-8?B?RjA4YmpFdS8ySGJpenVDcnlGTzdnOGxPbURoaEpEQk9MbHlONXhnV1l1ZEZV?=
 =?utf-8?B?Tmt4RVc0VGRnTXNxVlhCTVZGbkNVUEs4aElLWWpaZG9FUmRyWmcyclFQQWZL?=
 =?utf-8?B?eVZBRXdSWXRGdFdFRStIY1h1OUphcFoveXNSNGNwcThxdllDRjRPZjlwZUV1?=
 =?utf-8?B?YmdVREdWcVdvV2ZpYmxvcDhkSmpnTDk5RnBoRm83TnZkR0k2QU9SZkNnV3oz?=
 =?utf-8?B?L0JSa3A2MSttVXMvMVFERGpXV1M2NGtuMzBPZ1E2V1pVY1J6VU5IVkdSR0dt?=
 =?utf-8?B?NXB0c3ZwNGoyZ0tiU2hibkEvOC9NallDUU1kUzdqQTRUNTdnWG9UWHhJYUhV?=
 =?utf-8?B?dFBGeVlSSXArd1EzWWZyN2gwNkUrb0RoR0tHb0xGcUpMSk5ObDR6ZUFKcWRu?=
 =?utf-8?B?cTBDbmFPWXQ2TVdXWlRQV3lFMEhxVVNEdHBvU0xlTVpyUUhGenpwdjBzdWVt?=
 =?utf-8?B?NmVpQ3hON0dNUmoybmY5bFF2MHo5Tm4wUDNvN2lJZ0NuZjh0OGtMNjFZYkFh?=
 =?utf-8?B?ZktXMGxEYklMbTBIWmtEdlA4cXZZQXpWQ0pPSWZId2Mwc0JhdmNEL2lHSHBq?=
 =?utf-8?B?UStwVmRyd1V6SUFQSm9NdGE1OS9MNEgwR2VWRkFkRDkwNFVzUUtyQnIzd3M4?=
 =?utf-8?B?emVMWFlMQnAvbk5xcG9pRDI3RHRQT2NpQUhpeFJRaDJCK1dVdWFnN3dhQXRR?=
 =?utf-8?B?cUtlek16RDF3bVpVTU9YNGFYZm01ZTNqYmVPZnROb1VqSkJBSVJYWmh0QXpR?=
 =?utf-8?B?eXpCMS9mUVNSeDJKbjdFY1l2OGwraVJaZVcrOWJwRmxIR2hQY3dGdUVmb2Nw?=
 =?utf-8?B?enl0ZmttREZZcEFSUnBWbnlCN2tzK0doV2ZmQ1FiTUR6TUpiN1BXbmxsdk1j?=
 =?utf-8?B?S3QwOGpVTWF5VVg4a3dsUENVY2txYzljU2lhcGNRRGUwZ21EbkZpOHBZRFNU?=
 =?utf-8?B?VVhtUXVtUWhLZ1NkVVBQc2UzWjh3NzhmVFROaWswa0NISS93Yk5yZ1M1azlC?=
 =?utf-8?B?OWVHNS9wYkhLbGN3a3ErTHJUNmlTL3huM3FWc1BYenBDNkpPRFB4TmZzTGtJ?=
 =?utf-8?B?ZnAxT3ArdUtic3FkTkoyRlJGMCtiVFhBRlludCtLNWVFa25YbDk5OUx0SHFx?=
 =?utf-8?B?b3lQc0t0bHFpR1Q5c1N1LytsbmZnVFloOEloczNHNUVMOW9MbWJjZXpnc29i?=
 =?utf-8?B?QlYyZUN2cjRLL3JTUUM0ZzlBM2UzNS9VTnU5ZGtQVURyY3hUUWcvVVdvNnBz?=
 =?utf-8?B?UThQMTdITThUWkJ6UWgvN3YxUjlEWHRNMDkwQXM0cU0xQVNXN1lRNkhTR3Bx?=
 =?utf-8?B?WndVSEZIek5WdGkrY01IckFTTWR4VEc0a0RFbE1SZDFwTFB1eFU0dWRVWEE2?=
 =?utf-8?B?KzhSYWhwZnVsQlczR1ZkSjZRbjFlRnVsTlkrc3M1d05oSlB3T3BMeU9wMGli?=
 =?utf-8?B?eHdLbk1OS3h5RU9SNG9RQ3QwZVBaNUt1d0RoRzNZZnRXS0FQUnZZS1FUQ0xF?=
 =?utf-8?B?anRuejN0VHBJQzMrWXVHOVpzVEgramFRTmhzMklnVzhXVGNUTzUxeGhSckhO?=
 =?utf-8?B?QytETmxiZU4xU1ZocmdOc0lpWmlXUkZaNVhQbk43ZmNidWhDVm1CMVhyMFVZ?=
 =?utf-8?B?Vmh0MlBVR1BFRUxtZm1tNDRzdjg2dmN0dVdXMkMrTXNYT0M1S2hIeVUzY2pD?=
 =?utf-8?B?S0U3ZmVBSTFKZEkzWG05ZGZtWElEanEyU0dGd1dJVDlrQ0E5S0J1SEVNR0pm?=
 =?utf-8?B?U3RZS2VTZlNUWGdFOHFyYkNSUFpjZVJoK1V4RjlMVWxDQWhtTGdhZ3djODl3?=
 =?utf-8?B?dGhoUlVlcWdkby9SL2xvbTh5TmZqZmRWUnhzdGg4Q3V6d05TaExxVUI2dk1z?=
 =?utf-8?B?bWhoYnp6dG9DQkdVckdNVTZUSHRQa3puT1Q3aUgvSHY0ckVEa1JLcC9YclJI?=
 =?utf-8?Q?tvxcvuE05jIIm8vg6JklM0eFO8+y9bpY1jHp96P3JZHo?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5480.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f27d132-c301-4040-5ef4-08db934bcab3
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2023 11:29:53.5543
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mju0YRAeQnb19KP8Ncv9ybz2kxDXhDQc36iQszjHoP/YWd5D/Md/9vkSVVDWJKVYK80IYX3HmyKtO2jozpmr6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7806
Subject: [virtio-comment] RE: [virtio] RE: [virtio-comment] proposal: use admin command (and
 aq) of the device to query config space

DQoNCj4gRnJvbTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4NCj4gU2VudDog
V2VkbmVzZGF5LCBBdWd1c3QgMiwgMjAyMyA0OjU2IFBNDQo+IA0KPiBPbiBXZWQsIEF1ZyAwMiwg
MjAyMyBhdCAwOTo1Nzo0N0FNICswMDAwLCBQYXJhdiBQYW5kaXQgd3JvdGU6DQo+ID4gPiBJZiB5
b3UgY2FyZSBhYm91dCBhZG1pbg0KPiA+ID4gdmlydHF1ZXVlIHRoZW4gZGV2aWNlIGNvbmZpZ3Vy
YXRpb24gc3BhY2UgaXMgbm90IHRoZSBvbmx5IHRoaW5nIHRoYXQNCj4gPiA+IGNhbiBiZSAiZXZl
ciBncm93aW5nIiwgY29tbW9uX2NmZyBpcyBhbm90aGVyIG9uZS4NCj4gPiBUaGUgaWRlYSBpcyB0
byBkbyBtaW5pbWFsIGJvb3RzdHJhcCB3b3JrIGZyb20gdGhlIGNvbW1vbiBjb25maWcgc3BhY2Ug
YW5kDQo+IHN3aXRjaCB0byB0aGUgcXVldWUuDQo+ID4gU28gY29tbW9uIGNvbmZpZyBzaG91bGRu
4oCZdCBiZSBncm93aW5nIGVpdGhlciBvdGhlciB0aGFuIG1pbmltYWwgYm9vdHN0cmFwDQo+IGZ1
bmN0aW9uYWxpdHkuDQo+ID4gSGVuY2UsIGNvbW1vbiBjb25maWcgYWxzbyB0byBiZSBhdmFpbGFi
bGUgdmlhIGRtYSBjb21tYW5kLg0KPiANCj4gVGhhdCBpcyBtb3JlIGxpa2UgYSBuZXcgdHJhbnNw
b3J0LiBJIHRob3VnaHQgdGhpcyBwcm9wb3NhbCBpcyBmb2N1c2luZyBvbiBkZXZpY2UNCj4gc3Bl
Y2lmaWMgY29uZmlnIC0gbGV0J3MgZ2V0IGEgaGFuZGxlIG9uIHRoYXQgZmlyc3Q/DQo+ICJjb21t
b24gY29uZmlnIiBpcyBhIHBjaSB0cmFuc3BvcnQgc3BlY2lmaWMgdGhpbmcuDQoNClN1cmUsIGRl
dmljZSBjb25maWcgaXMgdGhlIHJlYWwgcGFpbiBwb2ludCB3ZSBhcmUgdHJ5aW5nIHRvIHNvbHZl
IGZpcnN0Lg0KDQpVc2luZyBjdnEgZm9yIHRob3NlIGRldmljZXMgd2hvIGhhcyBpdCBzZWVtcyB0
aGUgbW9zdCBvcHRpbWFsIGFwcHJvYWNoLg0KSWYgd2UgbGliZXJhdGUgb3Vyc2VsdmVzIGZyb20g
c2luZ2xlIG1vbm9saXRoaWMgY29uZmlnIHNwYWNlIHN0cnVjdHVyZSBhbmQgbW92ZSB0byBxdWVy
eSBkZXZpY2UgY2FwYWJpbGl0aWVzLCByZXNvdXJjZXMsIGNvbmZpZ3VyYXRpb24sIGF0IGZ1bmN0
aW9uYWxpdHkgbGV2ZWwsIGxpZmUgaXMgbG90IGVhc2llci4NCldoYXQgYXJlIHlvdXIgdGhvdWdo
dHM/DQo=

