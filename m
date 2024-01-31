Return-Path: <virtio-comment-return-9054-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21EF7C47258
	for <virtio-comment@archiver.kernel.org>; Wed, 31 Jan 2024 07:21:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5E9DBC6111
	for <virtio-comment@archiver.kernel.org>; Wed, 31 Jan 2024 07:21:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3A4C2986886
	for <virtio-comment@archiver.kernel.org>; Wed, 31 Jan 2024 07:21:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 20D6D986879; Wed, 31 Jan 2024 07:21:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1162D98687B
	for <virtio-comment@lists.oasis-open.org>; Wed, 31 Jan 2024 07:21:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jb8ikLHfZvado2+iEllmyJ7jePNpGjSyGSmKsY9CUzkNpFIsdMY7CNaNBgbwN9YNI/4aEwlhIzDhmmtG8q9n04af2YFs8nxmbHXb0pxVYnkW7q91M9Bcutzz03kLySZc5EEJZAwBLczIVEmLaUZ9l/N85SNqORr5NgrpdNYxaj0Y3cqbLnlhp2YnZx8pF5GsQsT06Nljo+VAJZMYtw5oiEuJUQlBhV10b+tVACBs6FJaTDUUs0uTP/Kj1MeYAvaXwDAtvkErEzwKKLNKlJ/XDn8PBukvEQE3WXZB1t1x6mlNW989BOgaRLgM9zStJ++UHh37SagAAKolUCVHEOUHPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nh71N+Vgu29qfmGK/LGe2u55IwVJ8AgQvmiiDesW93E=;
 b=OQXGw9m6Hvz3TzW6VkewaJx+10XsIVS3l/f/KvnWNSiZv7wXEm74aMRb9+0vJZ5ZsSA10EOJYA3xw8tTu851Ve9zpicsaDUICknBIQ9mjKYrDBjxBnk+PrHaJJL760i3mKdvKJuLbsV1bErRBdMnE+5nWL4E8qk95ShF+xqMZcHWwmP18ag2GtWNgSU7HB7JlimLGNPl3vHspwUiRtxEmHWT5g3CA+p+oXWs5l9kGnAqOAexgBwUA02qrZvArl0IzO/ayAJfMzMeGE51Pu3ATZuGHAXQapZW9TLgikf5x/SP7cATWqdekre4Hp/JBxXDoR5mCnGduZxjSDsxiHS48Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=jaguarmicro.com; dmarc=pass action=none
 header.from=jaguarmicro.com; dkim=pass header.d=jaguarmicro.com; arc=none
From: Lege Wang <lege.wang@jaguarmicro.com>
To: Parav Pandit <parav@nvidia.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
Thread-Topic: [virtio-comment] [RFC PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE:
 add new used buffer notification suppression mechanism
Thread-Index: AQHaTzZn/4IbS5Ps60eRQZJfNPdC27Dx83kAgAFW6HCAADk8AIAABhAw
Date: Wed, 31 Jan 2024 07:21:26 +0000
Message-ID:
 <SI2PR06MB53851A046986508D5C99374DFF7C2@SI2PR06MB5385.apcprd06.prod.outlook.com>
References: <20240125023001.1467-1-lege.wang@jaguarmicro.com>
 <PH0PR12MB5481C4AE095D48C6241C6366DC7D2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <SI2PR06MB53850CBD8F76EDC65DF2DD38FF7C2@SI2PR06MB5385.apcprd06.prod.outlook.com>
 <PH0PR12MB548186A6AE8A993AF50FA91CDC7C2@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To:
 <PH0PR12MB548186A6AE8A993AF50FA91CDC7C2@PH0PR12MB5481.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=jaguarmicro.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR06MB5385:EE_|TYZPR06MB5808:EE_
x-ms-office365-filtering-correlation-id: 4385b030-8fe5-4f15-1d1c-08dc222d3cad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 FcSfFjONtJswwODZFRxD33+Y4/FnepghWEVzPX+lBFTYtYswey36rOD4pNtUigwBM6HqTr1VOg6BNCS4/hd2/sGF5ABEF70EnxWXnGTv3wLStq57jUsv7ynbBHOMJUwbfNvdQMfsX8fwT8FHwOZJUeAaW739WnE+ajXGpdYSUZ1qeWNBAWzUY50kYg9bNPnEp+H2SqQtBOcYPL9fp+4nYtDX5BcDDaaCkMW3eUCqVPlxxpi2FqHKorv2JZwUt3ZxS4Ytgo22jUDhrTL1c1QYvRPgma+qR3ObHnkR7hYCDRv5yavRBdKcpLm5/RTnP7vEur7ldtud+j7JClkf2DzcFsHHDhwFmPzMC3o3Td9RVHfYhEGUJaIiUr9zDswc9Cg3a36tMls9RTgHbBK5+znpPomqC/EBXAYJcGoTrY99lxdDzXxXCxRpkwrH4qqRRb3audBLbytPAs3s+M5dQi32tAOvr2ub/RFwY5ueGv4/1+HX/4jZcsMZMq1Edjg8HJZl3oGGG2qwHWAUm2K85Z2PotMZ7IDN60uFayH1ovHqBLRuMCa6y0QiHMBvvfmVzKG1iKTNmf8nSdTmRUwddMsyiQerubBYR+8naK4KMfqU+LzBnRJBZ7wgxh6BZUN2NYFt
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5385.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(376002)(346002)(39830400003)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(15650500001)(7696005)(6506007)(9686003)(38070700009)(26005)(122000001)(86362001)(41300700001)(83380400001)(33656002)(71200400001)(38100700002)(5660300002)(2906002)(64756008)(52536014)(8676002)(55016003)(8936002)(66946007)(66446008)(66476007)(44832011)(76116006)(66556008)(478600001)(110136005)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?YvgCZILpxlOKAuL3ILil4tK71DXKQpFSn9QLStc2LrJ+V8V6wVFkx0L/?=
 =?Windows-1252?Q?w3xFA30wk8i6cdpWEh6NuTcmY0vfvXWRnb5jiMyEoWbbA49wOxIZhxhC?=
 =?Windows-1252?Q?HHuXDMIBXu8sUXyf4MQ0JoA1EBSR0qdGW1jkJf5zHfZfZz4CD0l+OcPM?=
 =?Windows-1252?Q?u9I7hy8voCvAW30if3RXNv8D4gQBIZwDRaAL+3YJE2r5CPL5RQJGEPGR?=
 =?Windows-1252?Q?VRSIWu6b2+DA2n+qwuumYFkO1rAtYVoD56KuvXdepyjUoGga6n9eNsXW?=
 =?Windows-1252?Q?SF78IPZi3U6GHXMyPyXskn+onG4jxay+mfadUKqe+Sz6AH00mqhT5EVQ?=
 =?Windows-1252?Q?eRL/m7z4Dr7jySRtBAkeactNayio/kjCQPxOJQN71KE3148J6CjwxXNl?=
 =?Windows-1252?Q?XXJRj+uspch1FXQzJb3yTd+VkAGEIVvjDWDJPBU5hyYVdedsyuCDLUt6?=
 =?Windows-1252?Q?Iz3Cx1Xjquii8zrVN0r4L9DXrxI2zWCcB7OpLQPb3p+fn9bp2OXTaeoR?=
 =?Windows-1252?Q?67NpzQkFRfyvBhifgCBS33nj1D2HhjcV+4Ift7cvxJM0Spvvs62qSyya?=
 =?Windows-1252?Q?CRgKpS0UoyEu/EyOoI7FxESoe1P9ZqMy+Edp7jr9gkchAumUBI8xcOHW?=
 =?Windows-1252?Q?KEjwV6EHN04tfz2tI/W+KRXQ0Tn4OD/ua8CwiYRMy6t7dul9npz8d1TH?=
 =?Windows-1252?Q?rBG0tdnZrwyizBJr6TPqOPwh0N6hPHbvFF7XHcW5ltdq9nF8KGwQlElb?=
 =?Windows-1252?Q?qFLOXDG+W/e/TbnJ/zBnXpCq2+p0CJM/vWAaKMQ3HFm16y4icw0yN0k2?=
 =?Windows-1252?Q?DUFtcCKrl5Eefj8ejRbx9Ggd/EyY3JYjRk55fBbk57A/9jSjO+upMnej?=
 =?Windows-1252?Q?JWsnMDmCNKOVC8WIVzCQ3q/E5tx21Z0Q1UOJFulZ3U9seOc3T4+++STn?=
 =?Windows-1252?Q?0PPQ7COPyFekY6k4VFK4wj3Blz3NSiU2rr/7M9Uj5LfQA688QwT8MLaH?=
 =?Windows-1252?Q?isgd0eglak/kI89g/85/xoSOfUtjnEvQvj1o+LCmuK7mf/0b9Yg26re4?=
 =?Windows-1252?Q?MOOIHxD7ykuvWSeHoG9RILzMVNNJVTogFrJWz4KUYz7LnC2Cxn6I9nWX?=
 =?Windows-1252?Q?rytH3r5hivu0VwNjS15Llpnr7iyMfmDnBpYkyfn2kZOU+WKWljqhnKFu?=
 =?Windows-1252?Q?AGjctEVEZf5C3pVTf9mr2NxNw1Uh3IJrb3ku5MudSQxvnpPUrVyIi4kF?=
 =?Windows-1252?Q?FNbjtINXvZoVPQYHmSh/nK0VThW5wtQbSwMG0tpKJMrpOSWe66iL44NR?=
 =?Windows-1252?Q?GB/rVQzWOJiQjykpqepJg085bghfI+0gLSxLuoS53I0Re8dvGxS9RkFk?=
 =?Windows-1252?Q?7DyVeoMrt/UrWndOpSNJVKjp3MfEmYW4HWMKLF6FsNj9xCiWT7+r+RUC?=
 =?Windows-1252?Q?NjejsulyuJTjiLZdPbts1M7px8FmtNDBHGpHewm9wwpqAAqvAaAr1FIS?=
 =?Windows-1252?Q?I0JluMaRkp+/0be+4XZxefU6pJyiQ9tYQw1WwEbeC0VD6awdAaCE7p3B?=
 =?Windows-1252?Q?xorym5Kwua9UACntmLJffNr+ZniAUciMGqguoldQlRBVhZKRx1cMTljX?=
 =?Windows-1252?Q?eqiYgrcm6TGH7huBcTbq52hKn9sG9LjPk1fBycqlzVyJhEIZf4dRR6Nt?=
 =?Windows-1252?Q?d6PrU/QRueIQBFls4xZiQtQ4/7YoQvmw?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: jaguarmicro.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5385.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4385b030-8fe5-4f15-1d1c-08dc222d3cad
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2024 07:21:26.6206
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1e45a5c2-d3e1-46b3-a0e6-c5ebf6d8ba7b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lckXjmBqBOfKh1BZnyxFX1re70xtlsJcGX0h1k6rcAxVXPB2aI56UcPbg2i3Lz4qxTQpyZ8APc+UsBzBowNRCP5QKTOUn4Gz3zI4rUJaMwI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5808
Subject: RE: [virtio-comment] [RFC PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE:
 add new used buffer notification suppression mechanism

hi,


> >
> > > And for that may be current notification can be made 64-bits or as
> > > suggested in your patch to have new location.
> > After some thoughts, I decide to just make current notification extende=
d to
> > 64-bits for simplicity.
> I think having 2 32-bit notification registers is better.
> Existing one for avail desc posting.
> New 32-bit one for used buffer consumption and re-enablement of
> notification.
> This way we get good backward compatibility and also the optional behavio=
r.
> 3rd advantage of keeping them as two is when used buffer notification
> enablement is done, it does not need to touch the device for avail postin=
g.
Yes, indeed this is what I have in mind, I did not clarify it clearly.
These two 32-bits registers are adjacent, and both are 4-byte aligned.

>=20
> In some systems, a 64-bit single PCIe TLP write may not be possible, thro=
ugh
> rare, it may be there.
> So having it as separate 32-bit used buffer notification is good.
OK, I see.

>=20
> > Yes, I understand your concerns. Initially I intended to add new PCI ca=
pability
> > to describe this new notification area, but found that this new capabil=
ity
> > would be similar to virtio_pci_notify_cap, and will introduce many dupl=
icate
> > descriptions in virtio spec doc. If we choose to extent current notific=
ation
> area,
> > there're no needs to touch current pci capability, the corresponding qu=
eue
> > notify address to enable used buffer notification within a BAR for a vi=
rtqueue
> > would look like below:
> >   cap.offset + queue_notify_off * notify_off_multiplier + 4
> >
> Just to double check,
>=20
> If avail buffer notification is at offset =3D X
> Used buffer notification is at offset X + 4.
> Right?
Yes.

>=20
> > > If this multiplier is not useful, maybe it should be added only if ne=
eded.
> > > Did you add it because to match the current flexibility of the spec,
> > > or your hw actually needs this multiplier?
> > Yes, just to match the current spec ??
> >
> Ok. that explains.
> Yes lets keep things simple as X, and X+4 offsets?
Yes, I think so.

Regards.
lege.wang
>=20
> > Regards,
> > lege.wang

This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

