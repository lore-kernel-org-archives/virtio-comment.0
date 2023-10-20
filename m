Return-Path: <virtio-comment-return-7883-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977A7C0032E
	for <virtio-comment@archiver.kernel.org>; Fri, 20 Oct 2023 12:35:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 055471A6730
	for <virtio-comment@archiver.kernel.org>; Fri, 20 Oct 2023 12:35:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7DA0D986963
	for <virtio-comment@archiver.kernel.org>; Fri, 20 Oct 2023 12:35:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7232998693C; Fri, 20 Oct 2023 12:35:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BA641986932
	for <virtio-comment@lists.oasis-open.org>; Fri, 20 Oct 2023 12:34:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TZbbMwk7drg+CELIsvmRpOFq2KiDI3EZ01cI5+nn0pqLGWZsJJ/279SrV9pcEpBGnBnlZ6MZ3ekEO4EX6xQfOZ48QyTNVk5Il8nqrzPvxbXhdodMtdBSWdF18nQLh3A/0JtNylmw9eh5wWxGjIB6YPuMddUbYKcOy5Hez90KcSK5Bo3Sg2G3HyazDvbQWiDefn2OdwgrvCKUIk6szqUcIwDL3xj90szwLi/fda9N5R+87jHMWq4nGjTamoeu7+gTquLGz3NUU6HGOQefXB6ZYDQOF4h3pQ9dcee8hZXLyS+YAE0ZdWHsKIlM76yEQfAYcPk0jTqNMwS5oldOvxNpIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Pe3zAhxHwRFhMMhEVtEFHk6dQYPb17pBZsJz8lABqY=;
 b=NfK9Mjd1Xqkrvjw6Pp+Bzc7tym7Ir0ase0mIhnC/BufGlaNmZAracKOZnkC9Y8Js2aM7olECvBbnbcO23rerxVnNTwG7K3VQ6L8AJBJGU6IZtmc3gVMmrkVhBq/poJb20k2BEm+SMwLtZ1iBuKuES4ByyV4oC4ukVkjpFef8GPRyWym9ykJ/pIB2TgKhmM7sMmccpywe822mOd+ZWoEDkKvdAM5PNPF3DKFNcVhFoyaHjqa8gOn6rGVSvPdrXaWoezF9owSwDYpJBBTUi8cOfCoRdYgeWB5jVFk33BHg8L0Do+q19b8LntlO0Wp/57AIEPZ8I4JiR3qlZeKv3GvKeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Satananda Burla <sburla@marvell.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>
CC: Shahaf Shuler <shahafs@nvidia.com>, "si-wei.liu@oracle.com"
	<si-wei.liu@oracle.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, Heng Qi <hengqi@linux.alibaba.com>
Thread-Topic: [EXT] [PATCH v1 2/7] virtio-net: Add flow filter capabilities
 read commands
Thread-Index: AQHZ+N1EYjifVY5LmEKrNq2IBc4sN7BLkCqAgAEbAVCAAE3aAIAFuHpQ
Date: Fri, 20 Oct 2023 12:34:31 +0000
Message-ID:
 <PH0PR12MB5481D9892425BB91A179B475DCDBA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231007051443.460148-1-parav@nvidia.com>
 <20231007051443.460148-3-parav@nvidia.com>
 <SJ0PR18MB447755CDD327B238B8013B11C3D0A@SJ0PR18MB4477.namprd18.prod.outlook.com>
 <PH0PR12MB54812CAA944A5F3EA750A590DCD7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <SJ0PR18MB44777BF592E56DFF13D42E9BC3D7A@SJ0PR18MB4477.namprd18.prod.outlook.com>
In-Reply-To:
 <SJ0PR18MB44777BF592E56DFF13D42E9BC3D7A@SJ0PR18MB4477.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA0PR12MB8303:EE_
x-ms-office365-filtering-correlation-id: d95c3ebe-3cf6-493f-0211-08dbd168e8c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 dF4U1wlb5PzG11+MWVipx1GFVcloajDoc2TfxIXVb9by0IUuwZ/OZ4WhJi41LahWQSZFeR3PVhugPPKJU4bMQJgdDOt66WfdWxb9pDuc0hku3X+KlurXEPP/7mJaWt8iye53zXPMe0n1gCa55qiyS3orsSMy34mHb44dCkLHkuj2osPcNqJRy3mazG92L9+aXkU1M3YDjplxz/hHPoX3AuOe7mo+PLTAz++bvhIIYlAXceXW3sWzCsT3WsDYd9Cld4GyFIgrSPRM5Z5R/dvMhW0gbq88Xv3SZfVHZ7+ySv/yBP1cPF0rcp5yap+gspOJkd38yR8D+5374+fFhnFHnWx65RIl9AETwWRdy6w/uRKInVRRnnNYxvvId1I3T+7RzGQP9eYwn1ujaE0InxvDBUN34rpwV7r/MCt22vUJvI/14xpD2xbdUBBtZVvC/vvn0MrjMnz8c1hW8hNFiLpIqxPG7MxF+a3FfXAzQgwaEeE0psf1kRoUdWcVk8IzhE2nW/mj5oQMF7sAYxBtqlhTuYgY/Njwok7a8brcaygTVjQfb3qao14zL8a1aeinXdRN7BzfaYmO4hf6WBWgKK0lVxA9ClXOUQHHbmYjZY6+xtRM+EkB2Cim3hqCpa6lVADA
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(396003)(136003)(346002)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(55016003)(9686003)(26005)(7696005)(6506007)(41300700001)(71200400001)(478600001)(83380400001)(4744005)(2906002)(5660300002)(110136005)(54906003)(66446008)(64756008)(66476007)(66556008)(76116006)(66946007)(52536014)(8676002)(8936002)(4326008)(316002)(122000001)(38100700002)(86362001)(33656002)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?YjDmreiin+3DgK0YjPcSkl4PWOyLRPsrU+7lsgsbg/7Jk4mQZwWzjVeH4ezb?=
 =?us-ascii?Q?ez7/7qIbVSTXDAM0c6G/1ggdwIXORlYJhqAnNxzTT0w9IPKVLMNgfLDl6ME9?=
 =?us-ascii?Q?rLItFeUCUZlaQuiXnHW7Smb1CnBzoq1MkLIAIGzcJE9I5kpHC5fB0YO3qyYQ?=
 =?us-ascii?Q?qIAPmb3MfP7lur22u09vNNjDCNaWqGiwimCA7pqonRzPOUPaMDKqE0bNRFFz?=
 =?us-ascii?Q?MGnjPgYXSi/gYIOcVMeowiWPuLyxPybJD/m83bfC2MjZLLep4FSPvD5fxwdh?=
 =?us-ascii?Q?+xShgSgSENZx0UIIVIu2bq9yiBjR8YiXxAfjBIDeMU0f8j/ivj1/vFzWB3zg?=
 =?us-ascii?Q?W7YrPVWHCDBEmiEdRDGyp3Y0BlR9FbfKixKbHrzPeEofBws/nM1PrDlMFAwl?=
 =?us-ascii?Q?6dFISqN76I71LZFx0ZbrnYh+zb8wDpgMveeS7H0t7a0mcqUgvHovt7HxvBph?=
 =?us-ascii?Q?lBlsdwxUAwWBEjmBQzLY/vw49yHAuThXedhmyp4bJMjZALOdhaitcJq7uzI6?=
 =?us-ascii?Q?Q3s+q6vWBAQcnQ5D7UeJCrtIKX49bLuUW0H0OqHmyL2sGMiAvkS9Kskh2zvE?=
 =?us-ascii?Q?OhJ/hTnvMx7j5uAZCF/DvfC3z/i5PvCvuob+banzB8DOY0HOhPF1S04Ef40J?=
 =?us-ascii?Q?riH23ZZkbFbumYtqTgZHC3hOinXHR/01tjEXcDHDk3l6aBX+4piKmY/GtF5c?=
 =?us-ascii?Q?6ybTzLdU5ZCPg9y8a7dHhxpO9o4+imoP8VojgaUMTbGQK/0FN5wanMOwYNPb?=
 =?us-ascii?Q?HTNZ2IXJ1zU42fKITHiUlcVjMWATKltXJGM3CUfQ+VrIfrLB1HR6kniabHeI?=
 =?us-ascii?Q?Cjq8+/lKu+ukCBo4rXNPWoE3oT+skfHo5ftNZk8tjeBmDD4iFdSFVEhtB/JX?=
 =?us-ascii?Q?m5cuyZeAn+CdeC8xRd+o6gQpPsub3Ad2+SnN5wtjwHb/B1NJuLdnqiUO252m?=
 =?us-ascii?Q?MOx0oT26DRsXHNC09W3phI/f0bRVE2etISw/F9moLKxJdq0E/PwR/7n2CtTC?=
 =?us-ascii?Q?oVjQ/BKeGtEZE7dNU6/lkY7XNuRnE1Rpgs4J/b5DRQaPadm+uedVUFndqVhn?=
 =?us-ascii?Q?eIiw5bvZvSZqNzUXgBJNkq0jfUCUOnzIH11J8HH2At4RhtxuW0eIV4IK9DQf?=
 =?us-ascii?Q?PEMyAhR+XG40MOm/1wtQ/dpWLv1nMhXCmEY/I/f1LuydrCb2GDQjMdvIuuB9?=
 =?us-ascii?Q?/SPtIw4ck6UgQBNVBwFD9KOfYD9fQQ1NvyPhw65BX8HONX94pCUpQhvR2DcH?=
 =?us-ascii?Q?9tj8WbYYM3cRWCbaesPuViJyQHo5RUpy4RgCsV6loUADhPuV9mb/stQTSIFm?=
 =?us-ascii?Q?kseVb8nTb8Foqj47LAo3xx0DoqJMsltC/xmSgYJMvKmKE+krKU8ZtficZ09j?=
 =?us-ascii?Q?yLkMIajsxKoWAC93cAf3qlSkJ8OJtLkaBrKYmi90RRmtLobOEWIxSd9SOQCM?=
 =?us-ascii?Q?G/QSXJeR9cB9LeY4aS5+25/mQicXrAl/6oFt3NKVnDEhGD9ZGa1vja+JvwJf?=
 =?us-ascii?Q?xkguQ79/V4hi1SrzFsqwB2ie8J842q8ZsYkDg8WyaX3Q20MSY9YJLcdxeShm?=
 =?us-ascii?Q?uv42x4ji6pWySFBXpjI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d95c3ebe-3cf6-493f-0211-08dbd168e8c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2023 12:34:31.4991
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OQiUnR5kVQeQwmemXezOUjB4cJrNfidEEB7SU25qWIWVGRvoiOK/PLIH8nm2bKW0QIsar1tAxAT5BoVMrmFrbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8303
Subject: [virtio-comment] RE: [EXT] [PATCH v1 2/7] virtio-net: Add flow filter capabilities
 read commands

Hi Satananda,

> From: Satananda Burla <sburla@marvell.com>
> Sent: Tuesday, October 17, 2023 2:42 AM


> > I am sorry, I noticed now that I missed this comment in v0.
> > For VLAN, we need to add a new filter as FF_ETH_VLAN, that has
> > implicit type of 0x8100, and match field, mask to have the value.
> > Shall we can do incrementally as new type?
> Yes but it is better to at least add the enum for the type now or leave e=
nough
> spacing between L2 and L3 types so that we don't have to add those types =
later
> out of order. For instance, in encoding the type field, we could leave fi=
rst 4
> bits(16 values) for L2 FF types and start start L3 FF types from 0x10 and=
 so on. I
> can foresee similar issues with
> L2 MPLS label matching, IPV4 extension headers, IPV6 extension headers et=
c.


Sorry for the delayed reply.

Yes, I took care of it now in v2. Instead of 16, I kept more room as there =
are far more ether types to take care than 16.
Just posted v2.

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

