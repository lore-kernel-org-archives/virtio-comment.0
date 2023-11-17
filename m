Return-Path: <virtio-comment-return-8414-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19FF8C197A0
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 03:02:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 32AEC60D2C
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 03:02:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F0D9E986E1B
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 03:02:23 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id CF101986E0F; Fri, 17 Nov 2023 03:02:23 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B86A3986E11
	for <virtio-comment@lists.oasis-open.org>; Fri, 17 Nov 2023 03:02:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E82GdalPpT8w146wnEl0QpFiG858vEUa8uAeOvOOBoVZnWDEnh+NIrI0nMbhilqB3j5jOm2fkKgERG6xh3hNGXvLk3Hn0MscPSewv3hwjIR9SDBiqKE6wxaapvBQLYw4bpgN7zPckeESw9tfV+1U/vV7codSUJl0rzbrasTWm79QLCWs3YaJ4vntqTO7uoq7C0lpTapwYgOSArwo8zpkDXJiKSX0rXgqQtmfLGGmiqFZ8yDSvEu7qsRcmhNSTwkUktGFSWqikhWgP3dOIeW5psgzRQI03OXIbb5kzNwOv+hWHhzKlrG3a4Q3fPssKi6XipXPU76rYK24s4adTqC0Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RUwGb+ZJm+Ups0MY+v/ejLITmCeWAE7ll/odLVJ5THo=;
 b=S1BDG33c7NTgainp97lq1qezxCCZ4dqrRF8m+mds6vHvCXflzXh/abB98SnU6KnKomBe/yD/5zZHVJUnu+PNAqKygdexdNhUboolckZ2d6vQwvgRpAJz0p8kc5kZ3c5b7wxchLePaIyD/arQUvIlJrjNSDZsF59f5sCD3AIXVyhtd0vqeWR8/ue9PgqkByvo8cNVoUqgr20HjO3u7L7oX2DShE6WiO+/Z3F03GD7QIbJR9UJCyBhQdUQzfcaLXTG/5NBUdsV8wfnRKz4+ThottQ2yAdqMsz5TQI5VjV6QZ161yy3qMgsWesnHymsMWT5tj7ej29WiImVV/cI5wEncw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>, "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Thread-Topic: [PATCH v3 6/8] admin: Add theory of operation for write
 recording commands
Thread-Index:
 AQHaCzPonHREgkZknEiTjfT1JtA3fLBjIMmAgAAcy4CAAWD+gIAAKSfAgAGqygCAABTkAIAGWMEAgAADI2CAAWVPgIACFpEAgAdP4YCAA//WQIAAxB+AgAAJgRCAAA8CgIAAHSmAgAAA6/CAAEWagIAATXNQgAAQ3wCAAAB/YIAADsiAgACQwGA=
Date: Fri, 17 Nov 2023 03:02:20 +0000
Message-ID:
 <PH0PR12MB54818DBAE43A566C807E1AE9DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <PH0PR12MB54810AFC15EAC51755CFC045DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtP+W4mdfn5PszoSHW3tNS+KPAMKXvJhpWKa_NchxVpZA@mail.gmail.com>
 <PH0PR12MB54815F616E0CF024927984C2DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116004037-mutt-send-email-mst@kernel.org>
 <20231116023443-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548118E76BAFD5FA470B92A1DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116064611-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54814EC9577B1197E2A13BDBDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116121958-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481F4D1B07F2809AA7D7C9BDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116131303-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231116131303-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH2PR12MB4892:EE_
x-ms-office365-filtering-correlation-id: 29278471-6450-43c3-a86e-08dbe7199d6c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 d1VZeXOZtqXYWnzaxjozfTwyFDTWibAY0mAZuLkzVdxlh/zV9nN/cse1fMOWSmsoM2i5CpNlY3WTGgtgSIDJGZ6iyMn8PVH9S0U/dEA+TnAqZup+urUYEfGAmOCqTg5XCyeQf5YX9+kFs0MiRgb4ByWhDbH7HOUmPDq0BWoqWTtWMY6Qh2dF+g4FZOd9J/79zk2WEAgi9Fd5r+gbFPoh5BFGlIVjqQ/WlD851KeQybaTbNfjaB1k0nVpeTgJDpQduqotcwGagz6GGi7vntDDrpE64I7/fPeoB8g5UjISMXqIHONgoPqjRn1GGJGQVSgwiIaqka2oLf92TsCw66NKDoYdbdWxfuATzAXthsTMMLL5hZ4F54H9R7GxMKcz5uya/r6FqqxbfKK3TgWpCZF92YZiugrxTO2FDNySeeeiXIeLZ/g85ILqiNDiJAeRbB/+LpPYfBlUGyfZQzjqWDVLFRjSXvyaUlreYYI0+3TQ9/EU6pC4H+YHiZBLle3m78CoRZy51sC4xaw184YZdENUlyqgNUBo3HZh5F6MDzEf6DIExFEUlCEQTTCMMKVXWPmk13QU9AA6e+lXGN2JFu3ylhUSKgPNdYt+E5+M8hklnNuncSspHfhmaKUmZju+cbdF
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(346002)(366004)(136003)(39860400002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(55016003)(52536014)(38070700009)(71200400001)(6506007)(7696005)(478600001)(9686003)(38100700002)(33656002)(8936002)(5660300002)(8676002)(4326008)(2906002)(83380400001)(76116006)(26005)(86362001)(66556008)(41300700001)(66476007)(66446008)(64756008)(66946007)(54906003)(6916009)(316002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?QVyt9TLpTMlb96GbOqgENr50QziAcw4fIy3fEfGL/ocjARHkfqd9u+1dOFto?=
 =?us-ascii?Q?kUiF75HNRI9bymC1CiLDSt4BUPaAOS5J9UYYVnJtevsL4EjmpP0MBwmiLHSb?=
 =?us-ascii?Q?Ti+BZv3FKC1+ONEUebPoe6qcTIfra7A7rHr/eeCqTDEl9NqKr7YK47wf5rTL?=
 =?us-ascii?Q?WzgcWk967/TQ8+wH9txSCFtPan4fl+5G0kH1yJwvCSyKrdbg+VjOXTxiqxZN?=
 =?us-ascii?Q?YynmNltjWqjrC56JIcS52VPLZ4UwqALprEjNI6+Pl+2P2bciSldhAYYHatmO?=
 =?us-ascii?Q?Ko4sQfhS/JDGcc+xW/PmahpAigVD07y2UsNGHZI3SpZGgQY2KwM8xAx7o/di?=
 =?us-ascii?Q?SHvfQXJSc61noB1NcSxu0t+TEsbnqzLXiee0DMDhPf3X0sJYt+acO+rYyzJO?=
 =?us-ascii?Q?QbRdGOBaT2kehDj6AXanoxlhmmLapPFuUBuWZukA6au2Y2z950jgnPafz+I3?=
 =?us-ascii?Q?T110PIPAFLSg1X0j9AAPSCcVtHeKSoBWcNFBG7lVK4yY7Xy8fDp2m7qS+gq2?=
 =?us-ascii?Q?BrO1gCsDpKU7wIqWQjQRNFAgIEGC6UPJjqq7qTjxwXFRoX9kuW155zeF0j+5?=
 =?us-ascii?Q?1dFHA4pZgl22VexnHykqUVVdzjJd59y5Ms79u7jaYpqpfAbHkhQ0evxS+ztP?=
 =?us-ascii?Q?f2Glm95jXUoobTSJdTKJ+YYk8pvBolV5l6gRhtZEx9gM97LUNUbBTwgFvVng?=
 =?us-ascii?Q?litBK1EnJ7ZJruWAT7Zr54SrwFiH9A2L5oCg5zPyLj0zjCO3P1E5yQ1zFS6t?=
 =?us-ascii?Q?J13qplxACi/y3Ybr6XvJWJtuKMFslDvmfIX8BXrwvwcTUlSkUwdvgd8LPaWZ?=
 =?us-ascii?Q?1iCmcGtjxVgekCGkNGEaUBQaC5NtOeiJMuKjPlrHXUB7tvt1NnKRPpul3ec6?=
 =?us-ascii?Q?NJICIyrPixUPwvOt7X2YTN5PgId59n+eyyJlDneDrh5V6S+U3vbuR1wh+1YB?=
 =?us-ascii?Q?pY1IuoRqDFbjXZB+NUBI4rI1+V0oH2FbMh9tiKZD4vDQshgJ1XkOTbmx6zjG?=
 =?us-ascii?Q?owBwEw57DjaNYN1x8pp1OkRiRFvic0e7ZhI7W24iD087KOj+TiNNCKuEKxzX?=
 =?us-ascii?Q?ROZhCrlmEpMc9gCsC1kXP0ZNvHMoD8sre8luS1XtAaffpmLf5851yh8ZMeM8?=
 =?us-ascii?Q?wIjsXSl5LwphlA7ydr+vautT2s856sBMhmsR+l+ZN5qBKorT0amkfQJK/vUd?=
 =?us-ascii?Q?+x1aKO88AMkzgNwpnPhEjG/QNQwbmmflg5pWwnoBOviauuJqspS6wyJtLT0d?=
 =?us-ascii?Q?1Le7t6xdXi7f7hBQAKaimnHSaXfA09IxE88FHlhEU9VU8dgquI0Lwv7WTV5P?=
 =?us-ascii?Q?vf4QBxY6aodlrMh1kUzkLj28o5TwbtoQsm1/FOjxvc0jzYZir4xsa3syJeMt?=
 =?us-ascii?Q?PEsKfKAF+bti6G21/TuMQDx5JNvrPwRnRHvZZuMLK1inre6rMcqsTiZNF82x?=
 =?us-ascii?Q?rxnxxjnJVclkpzb01m7G8mFEr5pjpcizwg4GdcbRTHXzwplNwmAlzJbuT0dA?=
 =?us-ascii?Q?F+n9oLjbfrw2CRpzLxvrjl11RQqRXAMqwRJYdrsdvYCNNbVXooAEHs4/CweP?=
 =?us-ascii?Q?Y/2maWjFsLHABsDxqV4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29278471-6450-43c3-a86e-08dbe7199d6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2023 03:02:20.3991
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jRIDV0WwPVjZEXB0JKkk5bDC7LU2lT7w1YhaQwQQW6j63uKbZmIwoJQiZjBCHvztsk81YlfGbcdYp6M+fW7Q+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4892
Subject: [virtio-comment] RE: [PATCH v3 6/8] admin: Add theory of operation for write recording
 commands



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Thursday, November 16, 2023 11:51 PM
>=20
> On Thu, Nov 16, 2023 at 05:29:49PM +0000, Parav Pandit wrote:
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Thursday, November 16, 2023 10:56 PM
> > >
> > > On Thu, Nov 16, 2023 at 04:26:53PM +0000, Parav Pandit wrote:
> > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > Sent: Thursday, November 16, 2023 5:18 PM
> > > > >
> > > > > On Thu, Nov 16, 2023 at 07:40:57AM +0000, Parav Pandit wrote:
> > > > > >
> > > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > Sent: Thursday, November 16, 2023 1:06 PM
> > > > > > >
> > > > > > > On Thu, Nov 16, 2023 at 12:51:40AM -0500, Michael S. Tsirkin =
wrote:
> > > > > > > > On Thu, Nov 16, 2023 at 05:29:54AM +0000, Parav Pandit wrot=
e:
> > > > > > > > > We should expose a limit of the device in the proposed
> > > > > > > WRITE_RECORD_CAP_QUERY command, that how much range it can
> > > track.
> > > > > > > > > So that future provisioning framework can use it.
> > > > > > > > >
> > > > > > > > > I will cover this in v5 early next week.
> > > > > > > >
> > > > > > > > I do worry about how this can even work though. If you
> > > > > > > > want a generic device you do not get to dictate how much me=
mory
> VM has.
> > > > > > > >
> > > > > > > > Aren't we talking bit per page? With 1TByte of memory to
> > > > > > > > track
> > > > > > > > -> 256Gbit -> 32Gbit -> 8Gbyte per VF?
> > > > > > >
> > > > > > > Ugh. Actually of course:
> > > > > > > With 1TByte of memory to track -> 256Mbit -> 32Mbit ->
> > > > > > > 8Mbyte per VF
> > > > > > >
> > > > > > > 8Gbyte per *PF* with 1K VFs.
> > > > > > >
> > > > > > Device may not maintain as a bitmap.
> > > > >
> > > > > However you maintain it, there's 256Mega bit of information.
> > > > There may be other data structures that device may deploy as for
> > > > example
> > > hash or tree or something else.
> > >
> > > Point being?
> > The device may have some hashing accelerator or other improvements that
> may perform better than bitmap as many queues in parallel attempt to upda=
te
> the shared database.
>=20
> Maybe, I didn't give this thought.
>=20
> My point was that to be able to keep all combinations of dirty/non dirty =
page
> for each 4k page in a 1TByte guest device needs 8MBytes of on-device memo=
ry
> per VF. As designed the query also has to report it for each VF accuratel=
y even if
> multiple VFs are accessing same guest.
Yes.

>=20
> > >
> > > > And this is runtime memory only during the short live migration
> > > > period of
> > > 400msec or less.
> > > > It is not some _always_ resident memory.
> > >
> > > No - write tracking is used in the live phase of migration. It can
> > > be enabled as long as you wish - it's a question of policy.  There
> > > actually exist solutions that utilize this phase for redundancy, perm=
anently
> running in this mode.
> >
> > If such use case exists, one may further improve the device implementat=
ion.
>=20
> Yes such use cases exist, there is no limit on how long migration takes.
> So go ahead and further improve it please. Do not give us "we did not get
> requests for this feature" please.

Please describe the use case more precisely.
If there is any application or OS API etc exists, please point to it where =
would you like to fit this dirty page tracking beyond device migration.
We may have to draw a line to have reasonable point and not keep discussing=
 infinitely.

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

