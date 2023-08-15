Return-Path: <virtio-comment-return-7121-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20661C001B0
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 06:13:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7680142C25
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 06:13:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6393B98638A
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 06:13:24 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 53AAE984035; Tue, 15 Aug 2023 06:13:24 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 437D998633F;
	Tue, 15 Aug 2023 06:13:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TgwDBCRkNHRCxVSTNS1P9QOzG2rC1V0W8FvXpFHAbSRo/rikv89KiE/7IkM1UN4LWnCHq9TYXJSg9n/c0380rS68kUc5NpQ3R4PWL9LAuP3LRIXvsIcbvEocJV/iKlUXRfc7CshEI0U5uYd2VYF5r66il6OhjtnUenfsl6D8jQTwqvtRtbrUd4zqBO5Q9F1RzD4GlkxCOcy/h+mmJ4/iSCk2KiKVoa5QojEknjU+th+wq++JE9bzcJcztQt5OwgmVBBs7Gt5d8bKJSMFYpp/7TKtSywxTDT1DP1oI6SYzJTlsQw8I3mIsOU5Kf04baqwWzx9n/UkW/gn9/dv3aZkcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tqFKikGTSkjIn9IrXk+LPE2wQVUIxLmFnYaa6UC7Uqg=;
 b=PwkDkeRwDGYH5I/tau+L3jek4LKBpSXN0BZZnve3whOpU9ZsaCdIRyF8d6zGkckEVWgYSpq+u8qCoWKhxxsVvldcLio5tF2vgERPqEuQ0D02QNVy1GCx/ZfZa9pglZgCq1Bw5Rr5UQaxG258ToJLbsz9zsFt1sUoyD1zRBgmIyyU/B6SRGg8zOQkUj4Y9hQVDQs13yfp324+rNTWOd68m/5GVtkjbfdRgvKbBwzrHR0YiQAHkUGfiJcergw+kAtd4yI8avCaocswLPrmq7ZQ7/aG7qAIWWmmnkj/FUlKm6lk0KlD0lyIywGwKbQ2cGTiyMhqHGMSaQW3/qDfAQKCAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>
CC: Shahaf Shuler <shahafs@nvidia.com>, "hengqi@linux.alibaba.com"
	<hengqi@linux.alibaba.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, Willem de Bruijn
	<willemdebruijn.kernel@gmail.com>
Thread-Topic: [virtio-comment] Re: [virtio] [PATCH requirements 6/7]
 net-features: Add packet timestamp requirements
Thread-Index: AQHZvd/P0UZ+85qNOEywdrF+BteiUK/hvTGAgAF2gACAB88bIA==
Date: Tue, 15 Aug 2023 06:13:19 +0000
Message-ID:
 <PH0PR12MB548164D14BCE0794ABD7C83ADC14A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230724033421.249893-1-parav@nvidia.com>
 <20230724033421.249893-7-parav@nvidia.com>
 <1691570137.0487022-1-xuanzhuo@linux.alibaba.com>
 <CACGkMEs-d-zPLByDNuDNda7UPDsm6hgZKw-3A1aNA4npUsWy7g@mail.gmail.com>
In-Reply-To:
 <CACGkMEs-d-zPLByDNuDNda7UPDsm6hgZKw-3A1aNA4npUsWy7g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA0PR12MB7697:EE_
x-ms-office365-filtering-correlation-id: b69155d5-ed55-4473-7927-08db9d56b901
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ay943/N8gPAqHU0djfeBKJ/b5kpJvB+qOtgOSGKObP5kcdMPdk3hQ+KZKgQgOGZ3OtkBaRzFUyLa9S1T/3zZoe9PI0uFfqwXP862xN6T7llyfwr4a0pmwvfNU5bfge+oWIP3v3krT2mAkvljidQKzqLklnH2EV/gCGzIDGMOI5ch+67MzDFblTjPpwGtSj5SrFVUUgJ6kfEDBf3wKRENrqrbSBiu3th3RpRlcCLJo2EbOwnmRPTEgy+xQGUuUuaBlGbNYq9v4Tm4WlfGa1gPvOtaQKIt24V3k/vQkUxKWb7fqSAwggd42euCqZ1O39QhYF8QraOcGP4prFxQAHkcx/zkR/5AkvCxzYq2WU4px91acLsSy/q3VOvyunbaJRpUSH0PubwmLdrsqSHFQUVI28mVzH+q/rPu41Fpbm2YfUzcOi94NZGWXLHwXJjk1aPweA3+TxJruXb99G5l/eoM+PS39I37aAUQ0iiGHHsSsGdOClGwvu4ea/22yFaDchjlW8geqDtL6PTU1nuCSleJ59daOpQ00Vv7xJXGhWF3Do5OTttl7XcEKGsD874qBK6/jLZwgHyGJ7XyYWgnj0xnzgjx3mkOufpCUPrZtpDJ1IxI0hF3er1LKKhB29UCWeyhUxGpezXXFkPV0B84rP+lxzMTZJRSDNXKJbyRuWx2iKc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(376002)(366004)(136003)(396003)(186006)(1800799006)(451199021)(33656002)(86362001)(55016003)(41300700001)(478600001)(38070700005)(66946007)(66476007)(54906003)(76116006)(64756008)(66556008)(122000001)(9686003)(316002)(8676002)(66446008)(52536014)(966005)(110136005)(5660300002)(4326008)(8936002)(38100700002)(7696005)(2906002)(6506007)(4744005)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YnBnZGZMeXZBdU5mbGRSK2t6ckg4VXN5UjBjMDU4d2ZaN3p5S1RJaW1ES1d5?=
 =?utf-8?B?V1R0MWsyNGdjdUpWNlA4bVBBZGtQdUVJWlFxZ0RQNXNNaDJnb1REaGRLYkVG?=
 =?utf-8?B?SlNxbVJiVzVLQnRGWWJXK1crR3V2YUU2WXBZSWpsNVhORkhhWkM0NkxDOEps?=
 =?utf-8?B?MWl4YnljOGFRSW9jaDRvbEEwc0FDdFg5V3lhbk5uazNlSFdkQjZTUFkrR3lk?=
 =?utf-8?B?bC9zdWtybXJyL0hCMW8yL2cyc0RuNXhYQmhFU3lGenFDWU44aVYwKzlRM2VF?=
 =?utf-8?B?OGZ5cm4rUWZrZWVFRGx5Wjd0UzZMcWpXQ0dYbklMNmVscjdQSkhYVkM5bTV2?=
 =?utf-8?B?QVZRQ0c3UDJBdFFpK1VSQ2F6WUU5cmFVbXZxVDhEK0hBS2F0aytiTGZRMTN4?=
 =?utf-8?B?U1pzUzVueUk3YWo5NnNCdHhvaFNoamQ3UVRqWnFOTHcyT1VCd0NrSTBCRm1P?=
 =?utf-8?B?a0lnRGYrbld1anZqYW01OXJjWGRUT3VBclRqZEZEUzRxTDh1ZmFEbWVZQzhz?=
 =?utf-8?B?aEt4MitTeFdhUTNaK2dFQWluQXpYNFFmdzhpYWdXQUxhQklJSG9xbjJCdk50?=
 =?utf-8?B?V05MZ1pPWFFkSGViVkp3c0lzN0Y0aG1vRFFxWlFKS0dCUk1KY3lNR3VBNEJG?=
 =?utf-8?B?bXY1MVNMTVE3aEtycHVKNVZGNDVHd2lTRERjSnNNY2ZJODl2VUxvcVgvVG1n?=
 =?utf-8?B?QmNDdHFRMStTMkRWUk1OOFNFb3BXMVU5cm0vc0N4V2QrU2hwdFJHWmJZK2Vm?=
 =?utf-8?B?MmxzY1BNNmFNZjNRdEFhQ05KTmdvMFZZa1NlRFpDSTh3QW0xN1g4TDBZTG9n?=
 =?utf-8?B?V3dQTlZ1Vk9tc1lGb3JxUUhSZEVXUGgwYWZ6RHdLeFIybEwvNm9KZHlLRjRD?=
 =?utf-8?B?cVlNT2pXNVhBdk9NdVNERk56M29ScitTM2IzWG1GYS80dHUvT253NkhGdlRt?=
 =?utf-8?B?MHpnNjRJTmJvVnQ0TWFONm43T0JlZk16NkphV3RoWDJjVFQxaC9nd1ZQbEN5?=
 =?utf-8?B?M2Q4RlhDdDBHRVdoQXlHZmo3aEphNGJaN1JpeEl5ZHJqV1pFcm1kTHdFOStt?=
 =?utf-8?B?UThhaWpxemlGZFdIRUVQVjBTajFyK3ozckpYU1dsdjJwL1lnbDJYTW1tZU1E?=
 =?utf-8?B?TlVRMi9TT3d3TVRBZDZ3Skd6M0xHQ2pnQWovRHV5UlZEdmtiaHdzQUhVbXY2?=
 =?utf-8?B?a3RWaXljbkorbTlHS3Z1WjhuenJPNW9POG9pOTN0N0krOXNpOUlGUExxZXhS?=
 =?utf-8?B?Q0FjRXRwbG5tVDhGSVRiNjNTR2h0ZnV2bjBLbjJUWUtqRUlWK3FMclRXbEFn?=
 =?utf-8?B?Tm9UWnI2N1N2eExFR3hqWHBjREN4THlYMldpL0VxL2gxTGxRWjhaQTFzSzRp?=
 =?utf-8?B?VFpWRi85YTVXbmdTOVh0c0lkaEpmT3JIWWJya05RVzJ6d05WUlVmMVZSRWNa?=
 =?utf-8?B?VGJZSDJsQjh0dDRBZHF2VWVzWFU3ZUVpeU5Jb1k4a3o4V2I1SE5zVDRUN3dm?=
 =?utf-8?B?bDZPYVp0WDJLQTlqbzUzNDNFQ3NwUVlzbjZ4dE9pMWhCckh0NjdycXNlT1Zp?=
 =?utf-8?B?ai90K0psVzdwYmEzVnovSVA4OGEzVzY0S201SHRaUFI3QmVwSERYemtqTUda?=
 =?utf-8?B?dTdaU2J0alhNUWxHNitER2pJMFEzN3dPWXhzaFYyVWQ5SDZZaE9HQXBMS0o3?=
 =?utf-8?B?TWpheU5UVUM0NnhxVWN0SG4zMWxpNGkyTDV3VDBHZFRaZ3FNM0N5eGU4NGhO?=
 =?utf-8?B?UDBLNzY3aGRKaVN3aWFmUkIyaml5SnJTS0p6a3hIZ0VIWFVaTHd4d09YSDMw?=
 =?utf-8?B?U0t6Wm5kK0diUG1qUFBIcCtwejBoMXJwUXQ1d2VKT3NwWnE3RmIzbjNuMkJn?=
 =?utf-8?B?M244RU1XTkpteUhZTDEzUWFrL0Z5M2R0ZVFLekVRYWxVaVZJZi83YWpZR05U?=
 =?utf-8?B?MkZMUDgxVXBLUGkwOE1jV2hrU0JYTUFEVmQ1UTFuN2VvaDRManpYdHFVSytu?=
 =?utf-8?B?TjlzVnZUSUxvVlVpL3ppVGJMSGxnQmpIU1NRaUZ2RldzOGhiSEhyZ0lTa2VU?=
 =?utf-8?B?NDJnMTJJaEtPU05RMnNGMUdtQWpFMkhWeWQ3Q0RVK1pkeXA0U2NWa2dmY1lH?=
 =?utf-8?B?dUQyM3BLT1FiTG13ek4ya1ZvUmxWSHFOOFY4aXJ5M0pHbGtFT2lJVUxQZGZw?=
 =?utf-8?Q?k1x8eaz+QDyG67kCOPEis2M=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b69155d5-ed55-4473-7927-08db9d56b901
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2023 06:13:19.9381
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YMg7MdcVwfeX2Kn92fqEHo8UhJ+O32Gl5liKfBKBKzIP9uDd73xBnMJp8pbi5rnwkcmpncVL2Gi5qbOsvvtWCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7697
Subject: RE: [virtio-comment] Re: [virtio] [PATCH requirements 6/7]
 net-features: Add packet timestamp requirements

DQo+IEZyb206IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+DQo+IFNlbnQ6IFRodXJz
ZGF5LCBBdWd1c3QgMTAsIDIwMjMgMTI6MjYgUE0NCg0KDQo+IEkgdGhpbmsgdGhpcyBjb3VsZCBi
ZSBvbmUgd2F5IGFuZCBhbm90aGVyIHByb3Bvc2FsIGZyb20gV2lsbGVtIGlzOg0KPiANCj4gaHR0
cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL3BpcGVybWFpbC92aXJ0dWFsaXphdGlvbi8y
MDIxLQ0KPiBGZWJydWFyeS8wNTI0MjIuaHRtbA0KDQpJIHJldmlld2VkIHRoaXMgYSB3aGlsZSBh
Z28gYWxyZWFkeS4NCkl0IGRvZXMgbm90IGZ1bGwgZmlsbCBvbmUgb2YgdGhlIHJlcXVpcmVtZW50
Lg0KTWFpbmx5IGl0IGluY3VycyB5ZXQgYWRkaXRpb25hbCBETUEgZm9yIHRpbWVzdGFtcCB0aGF0
IG11c3QgYmUgYXZvaWRlZC4NCg0KWHVhbidzIGlkZWEgb2YgY29tYmluaW5nIGluIHRoZSB1c2Vk
IGVsZW1lbnQgaXMgYmV0dGVyIHRoYW4gYWJvdmUsIGhvd2V2ZXIgaXQgaXMgbm90IGVub3VnaC4N
ClNvIGxldHMgcHJvZ3Jlc3Mgb24gdGhlIG5ldyBkZXNjcmlwdG9yIGFuZCBjb21wbGV0aW9uIGZv
cm1hdCB0aGF0IGFkZHJlc3NlcyBtdWx0aXBsZSBvZiB0aGVtLg0KDQpUaGlzIGlzIHRoZSBtYWlu
IHJlYXNvbiB0byBzZWUgYWxsIHJlcXVpcmVtZW50cyBpbiBjb21wb3NpdGUgd2F5IGFuZCBub3Qg
dGhlIHBpZWNlIG1lYWwgd29yayBvZiBzaW5nbGUgZmVhdHVyZS4NCg==

