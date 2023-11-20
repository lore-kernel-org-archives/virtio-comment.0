Return-Path: <virtio-comment-return-8481-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0150C197A0
	for <virtio-comment@archiver.kernel.org>; Mon, 20 Nov 2023 06:47:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0B9D442D6F
	for <virtio-comment@archiver.kernel.org>; Mon, 20 Nov 2023 06:47:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CF22D98684B
	for <virtio-comment@archiver.kernel.org>; Mon, 20 Nov 2023 06:47:39 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id AC4EF986839; Mon, 20 Nov 2023 06:47:39 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 97D4D98683A
	for <virtio-comment@lists.oasis-open.org>; Mon, 20 Nov 2023 06:47:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oT/FvI5V8EQvebE0dknahe5rxTILNXGLZqwQY87kJ3O9cfoIHWVlUpn4UlAAkuuaddI8+NXxIKliq0SOVLpxMdBA93xBF/Em/dfqCMbGXb3irw44XDRNH4rY6OLv+M5lGeUZDK79qC6Ys2XJbnGxvqUJYzXnmaVA9/OQWuHBO46lJa3+jqNa8xYOjI03VxIeCa1y+EBOvBhrYjm4kf64mzFQPiz+4pCwTjZ3+mu+f9xhrKf5ahLout9sPF2I268VO3zLohkD/SqycMR7P5B3Qzbl2C/wrcKMxpvui9NQolkCLqEbiYz/s/YzV8o+Yh/KRI10L/xqqbFb/uzUGQkHOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QK9VC9s3L0p6X670zDQupEKwXfs23vXbexZul8sgNo4=;
 b=Ka06a3eWP6IsTML1t5H4hdZDBOEPpFXwo2C58qkw1luzD1Mel8MZSbxN/B9VsMlLPB1O/kmyrAWOnzgsWFsecXo6YvlPz9H2YA3EC6QK8BrecdxgFuTAUt2GmOlNF0GMx9E79CEv/VE3jctB14EzRdQbiurG1YaeBfgzJ0Uo+5NP1oRw+QJUyBX9FgpGmr3xhlciFEaZrlS8rKzjMJW/C1Ei9lrgvaJAIN0Gwrf+3AovnFI7gnMO7KlY+l68bD2FpsE8/+JRo2g/UrItoTMv8oDZzMmESdBM+JHFkvd3m1ztljiLeRI2aRgTW7sCf8h19UnLKDdWSUAwd7GNJtwd0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>
CC: "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, "si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>
Thread-Topic: [PATCH v6 0/5] virtio-net: Support flow filter for receive
 packets
Thread-Index: AQHaE9LvQ+6uKAfIN0Kopom3Mm7xhLCC0snA
Date: Mon, 20 Nov 2023 06:47:33 +0000
Message-ID:
 <PH0PR12MB54817956B291856378B4B013DCB4A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231110123853.2093309-1-parav@nvidia.com>
In-Reply-To: <20231110123853.2093309-1-parav@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CYYPR12MB8924:EE_
x-ms-office365-filtering-correlation-id: 983ad95e-8ec8-4dfc-0c21-08dbe99492f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 gHADl0I9ctcJEdINYZojRXQylUVrbjjnhQdktihI9IY6Zer6VSvecbfeQQFmbzfDqBQPPJZRge03gjCSEjViBOuY1H0hyrWS0MaKafzVf7z8+zqUelMaumgk2z8WfPOZjRxQDPsDelp4Rl5SfHCEZlhalrmTbIjjlwTMLMie/gJaIUtijngcvUYTBXl2ETVg3PT1FcOnP1pQPhEr5BSX2JBgvyTQQkhEsXBoosRpQJZJzW4+6AC6/HnFtM2zMDfBT6NQstjYeMxLazv+vGITCTExU2t+gp5+VvC1SfsG1oiJwf0Y8hdVG2IRXs9pQJk1ScK2txMZeH7gMpV2AkT+WYNb5KKfSr8QnhYBMApl/eOQUn6LBk6Nfb1JqaAMHYVywVKUciyuUz9Xu5XT2kTk1pqOIk4IVFcWTNAgYq6AvUT/8qbYtkxafpViUKggWwP+QkMajz9LCXkb2d6/YRO6p6bPJSF8xQM1qaNcrL282DD4OxYZfINxLJJiG6CuxE0bmfb37T8IdC4LPuCveJeEnHmkVADOV4KKnsEtVHb4APuZYiMDNbG0qIv1fpppiJ52A+/5nxc4UokcTXGgp8bjGYb5f4ffzfibWUZu5zqgYEeY/+XXGT4j0hJebY39vFKlGes8rwW639PPMUN2oGZq0e4wqs/rvtTQmXcZOUjjeo/Zdy1sJwRhpWoFMG888hQWi4X6C8/xNuPLP/Pp0oQ++g==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39860400002)(136003)(346002)(376002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(2906002)(55016003)(8936002)(52536014)(41300700001)(4326008)(8676002)(5660300002)(316002)(54906003)(64756008)(66556008)(66946007)(66476007)(66446008)(76116006)(110136005)(86362001)(478600001)(966005)(26005)(38070700009)(71200400001)(9686003)(53546011)(7696005)(6506007)(122000001)(83380400001)(33656002)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?OoSckrpQEcw6l4t7Rw5lkx6YgPxAaFRa5sFBkAUtIZmbfvTu6+xQhG38NGIt?=
 =?us-ascii?Q?MjzMpC9WfQLByTTVANgV8mud/n+6zZX3gsebiaLSZccNrWNNdDouWCaIjF8T?=
 =?us-ascii?Q?nuxyFVhbTrmZ27RV8m9DNmsuwtcwuPY5Hdir8hHxN1BnTlQJ9RGLw38D2qUA?=
 =?us-ascii?Q?hKszah4IBHmbV9HQ5rSq4QWUEJHiDXp/Au6WxaCe3DuQSGPgpUuGeuZ1vi3C?=
 =?us-ascii?Q?WcTTz6+uTNTiMbCnwXrMcncpqco+R3JI5v4tAHQGj96Icly+KsgwmaRmT1lk?=
 =?us-ascii?Q?WZ3vB0v/sMRKZ5NMTXE8OAZOBhApxWEfx4ey8qsYTmT2aoqB0CGNlIpi74gU?=
 =?us-ascii?Q?gUYOSI82h9IHeIKjIAcJTab29szeQDNOran/rOm5TfD2JSj9y0AozU9PcQbW?=
 =?us-ascii?Q?EFb4KlrsE0WIwoPl26TU9EgSVgJ53ysF417Hj7T3htKKQ+P3bbV1aGk0iU5q?=
 =?us-ascii?Q?PP884jJ7CxANuYFhUN/JqNjhUmaqT/uIm5llLJKaDJBj1f/4i9ZZRxoCQGG4?=
 =?us-ascii?Q?+6qR6Jz4/1PKBMMSzrqlg5NkaduKee5i2J+Fvrgy1raILTGDGWeFwW56XDZH?=
 =?us-ascii?Q?9U3xtuu9TElKSMMu1O2/eT9/IXU0v17B7lgAH1/D43eTsCInpp2T6s+0NeIj?=
 =?us-ascii?Q?da2+fiQ4fpYoop3v8qhlIMO5Yo/ot3Pzdxve9MYrSn6jhzpmJ4vutTyUeMdu?=
 =?us-ascii?Q?cezxYpzGvp4jGJq0Ae2hIKBC4vTVws7HFPBv9GFaq/1U1esrn9ZE/Vdrypl5?=
 =?us-ascii?Q?/q7hKs7OYgn+J6wXdSfL4/WaW2kr5xCGto1kaJ/KR1DHbEWANtEGxpMPBNfO?=
 =?us-ascii?Q?/2V4WGaEn2tGKc7wp1C45ssCO1OW7HcCky8MexX+O2kopE09Of4fxkOobq29?=
 =?us-ascii?Q?u1BBsQIxyMIHtM8SQAKmdu112M8doF+q/ncjZ0qgRiYqztlXpjpbQn+H+iwg?=
 =?us-ascii?Q?8v9NpFix7/id+NAyyt3MiDMSsumcCoCyZHwXmQOOHxCxUwdEZSY6utbcWe0f?=
 =?us-ascii?Q?ZMNdMBEAUp3ZTCH5GdCJ2LInFr2uIIfcvvzMbqpbE8hA799k+onw1MnNVNLH?=
 =?us-ascii?Q?+45JOoWOoN1t3NA8+ImTP39SYZN8iuFy0gt5NeySI52JOvJGaw25xcuRUCK/?=
 =?us-ascii?Q?4e13TOqgh3zHsDLnnzvljm3k1dxiQ1YtHvrWGT9WTowpTGiQFp2sLxHV1q8U?=
 =?us-ascii?Q?PirPMsp6ruQTR2LllGAsJTj1ww3d41SwXTXXUt3UaISDO1yWzO5oqOWdHDtr?=
 =?us-ascii?Q?AxEzVdkni9msZJj2byyjK9jnN4yNXWnihtEh2MAHuz4oz86CpkglK5pbFltv?=
 =?us-ascii?Q?ZXF+5pkXmfH1a4SY5GYq7Bi8cHuq4zypPD7onPy5zLse2s44DnrZ6dQB9A1f?=
 =?us-ascii?Q?KLxMlxaOBBOjAgMFbyn2SCDzngPj0pc5TulupIDoS9chTTNxESEgyP222G7r?=
 =?us-ascii?Q?pne02bWq7SmRjVsIbRa8fWdz3HYkUnQlHdyc/4DnRobiz5HE7kdCcRQV3tA+?=
 =?us-ascii?Q?6pnRjCj6xUqhsfn6FEzNBifDwRvPB/2slchRcyDbLYTY8Azod41nmmitbzbZ?=
 =?us-ascii?Q?7XK2PEr01ip7jxg/PL4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 983ad95e-8ec8-4dfc-0c21-08dbe99492f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2023 06:47:33.2935
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9SPOpf/YTkeCPeGlULJ6qBnfHXO4BU904qrMI/6jOBmWBov6MFqN/mecp08gMNwI1mzLpB8NnRmdpiOSFWe4Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8924
Subject: [virtio-comment] RE: [PATCH v6 0/5] virtio-net: Support flow filter for receive
 packets

Hi Cornelia, Michael,


> -----Original Message-----
> From: Parav Pandit <parav@nvidia.com>
> Sent: Friday, November 10, 2023 6:09 PM
> To: virtio-comment@lists.oasis-open.org; mst@redhat.com;
> cohuck@redhat.com
> Cc: sburla@marvell.com; Shahaf Shuler <shahafs@nvidia.com>; si-
> wei.liu@oracle.com; xuanzhuo@linux.alibaba.com; Parav Pandit
> <parav@nvidia.com>
> Subject: [PATCH v6 0/5] virtio-net: Support flow filter for receive packe=
ts
>=20
> Summary:
> =3D=3D=3D=3D=3D=3D=3D=3D
> This series improves virtio net receive packet steering to forward/steer =
packets
> to specific RQ.
>=20
> This basic functionality will enable Linux ethtool steering, Accelerated =
receive
> flow steering (ARFS) as starting point, and more use cases in future.
>=20
> Problem statement:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Currently packet allow/drop interface has few limitations.
>=20
> 1. Driver cannot add or delete an individual entry for mac and vlan.
> 2. Driver cannot select mac+vlan combination for which
>     to allow/drop packet.
> 3. Driver cannot not set other commonly used packet match fields
>     such as IP header fields, TCP, UDP, SCP header fields.
> 4. Driver cannot steer specific packets based on the match
>    fields to specific receiveq.
> 5. Driver do not have multiple or dedicated virtqueues to
>     perform flow filter requests in accelerated manner in
>     the device.
>=20
> Solution:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> Flow filter as a generic framework to overcome above limitations.
>=20
> Overview:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> A flow filter defines the flow based on one or more match fields of the p=
acket,
> defines an action like drop/forward to RQ.
>=20
> The flow filters are organized in flow filter groups so that their proces=
sing can be
> ordered when multiple applications wants to use it.
>=20
> Flow filters requests can be transported via control vq or dedicated flow=
 filter
> virtqueue so that it does not get intermixed with other slow operations o=
f cvq.
>=20
> Flow filter requirements addressed by this series is worked by virtio com=
munity
> at [1].
>=20
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
>=20

Now that this has been mature phase and on list for several weeks,
I updated the github to point to v6.

Can you please start the voting process?


> It uses updated control vq command format from [2].
>=20
> [1] https://lists.oasis-open.org/archives/virtio-
> comment/202308/msg00263.html
> [2] https://lists.oasis-open.org/archives/virtio-
> comment/202310/msg00047.html
>=20
> Patch summary:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> patch-1 adds theory of operation description for flow filter
> patch-2 adds device capabilities cvq commands
> patch-3 adds group add/delete commands
> patch-4 adds flow filter match key, action and requests to transport via =
vq
> patch-5 adds device and driver requirements
>=20
> Please review.
>=20
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> v5->v6:
> - pick next unique bit 65 as to avoid conflict with rss context feature
> - fixed missing conformance links
> - removed white spaces at end of line
> v3->v5:
> - removed left over dependencies of flow filter virtqueues
> - removed partial sentence
> v2->v3:
> - removed dependency on dynamic queue infrastucture which is
>   not yet ready
> v1->v2:
> - addressed comments from Satananda
> - squashed with match fields definition patch of v1
> - added length to the flexible array definition struct to benefit
>   from future runtime length bound checkers listed in
>   https://people.kernel.org/kees/bounded-flexible-arrays-in-c
> - renamed value to key
> - addressed comments from Satananda
> - merged destination and action to one struct
> - added vlan type match field
> - kept space for types between l2, l3, l4 header match types
> - renamed mask to mask_supported with shorter width
> - made more fields reserved for future
> - addressed comments from Heng
> - grammar correction
> - added field to indicate supported number of actions per flow
>   filter match entry
> - added missing documentation for max_flow_priorities_per_group
> - fixed comments from Heng
> - grammar corrections
> - spelling corrections
> - fixed spelling from initializaton to initialization
> - added more requirements for multiple actions
>=20
> v0->v1:
> - addressed comments from Satananda
> - added device requirement to return non zero value in fields_bmap
> - added device requirement to not repeat filter type in response
> - added driver requirement to order filter match field as it
>   appears in the packet
> - added device requirement to fail group delete command on existing
>   flow entries
> - added mask field in the type to indicate supported mask by device
>   and also in later patch to use it to indicate mask on adding
>   flow filter. As a result removed the mask_supported capability
>   field
>=20
> Parav Pandit (5):
>   virtio-net: Add theory of operation for flow filter
>   virtio-net: Add flow filter capabilities read commands
>   virtio-net: Add flow filter group life cycle commands
>   virtio-net: Add flow filter match entry, action and requests
>   virtio-net: Add flow filter device and driver requirements
>=20
>  device-types/net/description.tex        | 630 ++++++++++++++++++++++++
>  device-types/net/device-conformance.tex |   1 +
>  device-types/net/driver-conformance.tex |   1 +
>  3 files changed, 632 insertions(+)
>=20
> --
> 2.34.1


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

