Return-Path: <virtio-comment-return-9113-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C32C48BC4
	for <virtio-comment@archiver.kernel.org>; Thu, 15 Feb 2024 03:07:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CECF62AFFA
	for <virtio-comment@archiver.kernel.org>; Thu, 15 Feb 2024 03:07:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9D7A59865BD
	for <virtio-comment@archiver.kernel.org>; Thu, 15 Feb 2024 03:07:28 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7C2089842E1; Thu, 15 Feb 2024 03:07:28 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 62BBF98640B
	for <virtio-comment@lists.oasis-open.org>; Thu, 15 Feb 2024 03:07:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FJtjEmjQjdXzZp6wvIc2DtyKtlX0JWABC24Wvw/6kySlS+u6YG9LgoZnvvi0OY1cCMrrW2HlDRy7OIFEcnjF8NQ8gmyVghuvCDRO34mrbeRNp7ZxBA4v392mX+xydMNSLubTvPy1WsAZUaajR0oQ1/asmo+lmobYcJVPmD8hh1Agh+BWWGOCpeU5yC53/Jzvebt3XhqkvFtYJe5OYoBKOEHyGwopeWOZdYE2Ou02iyM73aOmqQVnGYR33pTR9xD8fP2/hECljNK3TVNEnftubZuvXGZVBaR2vtxeOyGi5J5VZ+ZKsVqB7WyWkwLwupZ/uk+8Uv6WPOmvH21kvAfogw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+PAe7woN+T5y0TxiI3vr0AjcrClRw8hMLbjukcraC2I=;
 b=RToo7eQBVIl6rS5Snj6A292Bvk1RW6e1xwWUL1Xse/+RP4J5lWlUMfYzSb0sECyGzTXKIA8Tq1vOgzERRE86VZJiSPEbQhuyKxqaSvA9xN/gb1/1hixXVWhJTWre+XeYyULE6tZLw59LOkb7IKJQNMAhK+s9uTtlzKd1K68C0WA8LFscDN1uszTu3zfoYHG8foh1YqUAYmwr9GOtdcfHMumMGCt4BoPvhFl5q+GSY7iSHWfWuyLZpBijaRiXm2AluZtginwoM/h1apREpsixOgdzSl6N+0HUTXWhxHggCISUundX+1U2fpLeslQnBAPYVamPfZT7qFGeuxSgt6SwFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Satananda Burla <sburla@marvell.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>
CC: "hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>, Shahaf Shuler
	<shahafs@nvidia.com>, "si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"peter.hilber@opensynergy.com" <peter.hilber@opensynergy.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>
Thread-Topic: [EXT] [PATCH v9 04/13] admin-cmds-capabilities: Add capabilities
 admin commands
Thread-Index:
 AQHaWZapbbmPdmmqcEOihgSCoyK+ALEFi7iAgACKR1CAAP+LAIAAnmlwgAKxe4CAAFxaQA==
Date: Thu, 15 Feb 2024 03:07:23 +0000
Message-ID:
 <DM8PR12MB5480803A0C8F79ED98BCDD28DC4D2@DM8PR12MB5480.namprd12.prod.outlook.com>
References: <20240207072336.477606-1-parav@nvidia.com>
 <20240207072336.477606-5-parav@nvidia.com>
 <SJ0PR18MB4477BB042E38CE59C9F652E8C3492@SJ0PR18MB4477.namprd18.prod.outlook.com>
 <PH0PR12MB5481732266FD14BA4D0FA520DC482@PH0PR12MB5481.namprd12.prod.outlook.com>
 <SJ0PR18MB447717547BB03ECA26C99A24C3482@SJ0PR18MB4477.namprd18.prod.outlook.com>
 <PH0PR12MB548126E200F535B4284A5612DC4F2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <SJ0PR18MB447799E4D1D9200690534CBDC34E2@SJ0PR18MB4477.namprd18.prod.outlook.com>
In-Reply-To:
 <SJ0PR18MB447799E4D1D9200690534CBDC34E2@SJ0PR18MB4477.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5480:EE_|SN7PR12MB6790:EE_
x-ms-office365-filtering-correlation-id: 8b7ee39e-7e5b-445e-728d-08dc2dd33b0a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Mj9WezSTBSucCTdw+iOTbTb5bJTzz4mkvxHTw9h+aM9Y3BRpxG7/YEHl77MvLrgm8dxM9AarLFXEI6pCVkGLzTt/lIIuALpluWiRS+JHRoP+2aGvr6fFF1a/jpG33s5GDOf2yCBjNtSoB5SNL9/FKJh4H1F+SVPu57M6Hdh0r+iXicPaVUuQ0dx23tjHwJA/hasHSrm2HN6S4s8JR/+MPEyF3N/gA6rB/0Qo/FvyBPC4ned/IY/whZeLI7z22AFJoZs4A7gMQItlReUo07waz9lVLgq2nnA/kCfxIm31rZDJs+Nm45kEgLGTr1OJF8/SSyS2Ough3QEg5VyXPKfQq+uCqNEKDPMnEdNLPNiFJQoT1Vn+XIXPs2asgPHDBENdvpy9olwsMsolGHHER+S+rM4u/WOn9Xb9AbZK4BguV4RqJO/CsRFIgu5B+R9OC/RlC0MIhwLV60fZKhyXiFhc6BjegptRFQrX3bvFNNMAMX0n7DMV235/6nekdHEbogspvtob1S7mk7XQ9piuXhEtVn0tj35fzb7hZmRvctz8oI6k+LxIKQ6VddvDJyw7xqvhvnA26asX+pHPLnQTqJCe8X5FzVDzrhXe4Dy0dYdQTw1c1ucDw3Y9VpcJ9wmf42dtx5HB+ahQdDI1f6mGZPw29rywM4m3YRcMeTTSncDITfw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(376002)(346002)(39860400002)(230922051799003)(230273577357003)(64100799003)(1800799012)(186009)(451199024)(9686003)(53546011)(966005)(6506007)(478600001)(55016003)(7696005)(41300700001)(5660300002)(52536014)(64756008)(66476007)(4326008)(8936002)(8676002)(2906002)(71200400001)(66446008)(76116006)(66946007)(66556008)(110136005)(316002)(19627235002)(38070700009)(26005)(86362001)(33656002)(83380400001)(54906003)(122000001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?gVhUiCJN85DQIM5KjHMPi5PvwXmoT3U4P0ec9UtaDMwwowCrmVvZe1PRGTAp?=
 =?us-ascii?Q?2rSvRUA8haPcwBNXNMwqSPoynziIFEOK022rOWukYmCvREebwvfiMi7CEitJ?=
 =?us-ascii?Q?0/KNDw9a+RY7u8iil5smU/Q3sU+VAZcUibou/vmRlN5yDcfAUggCD6LaQf06?=
 =?us-ascii?Q?z3INfEgu74SQwVhTqsXZr4YpH/WvfiVxB9ICZsxJqYHPCdV6lBIogachrZOJ?=
 =?us-ascii?Q?IH3a5Kqa/zSj75YqqFNWJzxzzIqnCbZkSNYEMw0vd1zLJ215gsghvTTD0nXB?=
 =?us-ascii?Q?yvp182Nf31gQVVGlMjD/NKy4/wEfLOorkZhN88WMD+nD1KKSfkxeam8aDL7C?=
 =?us-ascii?Q?LQvU7eBAZwu2wvXG9nx6p4mddXApkvUYYGLA2KEDBrWmCzZL3z1orVpMWTCS?=
 =?us-ascii?Q?X50gQezlTGqo8nT3GYZ2ukKEbSUugRrU5pEMEA1mylYMrv0vk0mcpL4uCQKA?=
 =?us-ascii?Q?5DKMwvNVJlte7bEtL4qGF9/Vnowal8ixN/SWMNLoX5uAlJIHSPRfsktauxJk?=
 =?us-ascii?Q?E2YsLPxaYjv5OD5bN0opmGvOe067ng5W3Wv3HLsXDAJWKShMnG8SgqdNWwuL?=
 =?us-ascii?Q?t3SyEX3GDoAO98UNyyvSvxMnCjVX2nqkKIU4Tf3gr6SxdJs4lcekyAbz/hpQ?=
 =?us-ascii?Q?3K4KCIDblFCP1gDnRZFV9afudtX4LH4Ax5q3fRGsMSGcizBPO55qrSdJezbI?=
 =?us-ascii?Q?LNKwiZ6uRIvw/CtCs02x2CD2BVmstntMeAy5ozE2ysNiDG/exzJ2jTa6/4Ty?=
 =?us-ascii?Q?Tcz8nazlY5zGKQ96k6csMaDYugvdMuuDBYze8rJ2bgOOSp/jNBazvFwCorsJ?=
 =?us-ascii?Q?i0oJKTCrAE7DGvalhUkCYDCpZlvjDKjn8jnwe0alZaaB+K9u5O13gQrTA7/V?=
 =?us-ascii?Q?aWjW48ruqyYF/82X2tjOB9RVmWlofSsEc4S5g4ZsLy2f5yKPCxFTXK1d/O1o?=
 =?us-ascii?Q?rCtwvaRFVZs74gvc0BEe96S612nQE7CXRSLLayuBNKU0j7rhmghFFSe36v4y?=
 =?us-ascii?Q?MHJihD/ypElMg8qx9MU0YEK8DdChMAb+CUcVnn42Ux7fDXpPQ5k3YSnVwUFB?=
 =?us-ascii?Q?Jc30rV5zVZvBq9gkj15mYgXvzs9N40CiV729gWnQlc9amNuW37IwzYsQ7k1o?=
 =?us-ascii?Q?1ClG8id2BFmKlZJZ3DmHxmLYhojzzgOZQsZbiXe6bdEhfPFboYF6hMac8CEH?=
 =?us-ascii?Q?9W1+ZWVCHsQ/P1Vo7n+ixY5JWnfnZYpfqk6c8UC12q2ZUv2uZJStet5PD7iw?=
 =?us-ascii?Q?pf+QCn8l8xVKdjO4V9vwcX6yKuRgrvpAUNFrVTDlmYt7sIzR0tDEvfM2dpkB?=
 =?us-ascii?Q?7QxKxTRG1VC4/l9Nhrs11FI6IM5VHKQgjHnKbX7g/RhotEz/LVVvUzvjjir6?=
 =?us-ascii?Q?xnXulYU43ycvAHc3dSLyjz0HoTsqq6XITf3sQzONrfUXuez4CcWWTBUt7HUX?=
 =?us-ascii?Q?SCYcMSCwpZ2fpOw9YJ8PRW968tJ22JaWg2Z8prgvkZ+yt9SjJjADMyVpjGQV?=
 =?us-ascii?Q?XRZn3e/eFucGiqLAfEpK5QB6pSypjxd85jA40IDn+pwikFqY4OHIxltLOLuv?=
 =?us-ascii?Q?TNPvFdjH2z+DJg27rt8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5480.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b7ee39e-7e5b-445e-728d-08dc2dd33b0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2024 03:07:23.1356
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4cuFw9hu4HXMICyHHSM73cm/0gnvYfTqMQJTRwUf6YhBgfdYFMuiMsus+rTiH30YDG9X1e5Q1lCyuDAvc5/mDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6790
Subject: [virtio-comment] RE: [EXT] [PATCH v9 04/13] admin-cmds-capabilities: Add capabilities
 admin commands



> From: Satananda Burla <sburla@marvell.com>
> Sent: Thursday, February 15, 2024 2:55 AM
>=20
> > -----Original Message-----
> > From: Parav Pandit <parav@nvidia.com>
> > Sent: Monday, February 12, 2024 8:23 PM
> > To: Satananda Burla <sburla@marvell.com>; virtio-comment@lists.oasis-
> > open.org; mst@redhat.com; cohuck@redhat.com
> > Cc: hengqi@linux.alibaba.com; Shahaf Shuler <shahafs@nvidia.com>; si-
> > wei.liu@oracle.com; peter.hilber@opensynergy.com;
> jasowang@redhat.com;
> > xuanzhuo@linux.alibaba.com
> > Subject: RE: [EXT] [PATCH v9 04/13] admin-cmds-capabilities: Add
> > capabilities admin commands
> >
> >
> >
> > > From: Satananda Burla <sburla@marvell.com>
> > > Sent: Tuesday, February 13, 2024 12:21 AM
> > >
> > > Hi Parav
> > >
> > > > -----Original Message-----
> > > > From: Parav Pandit <parav@nvidia.com>
> > > > Sent: Sunday, February 11, 2024 7:42 PM
> > > > To: Satananda Burla <sburla@marvell.com>; virtio-
> > comment@lists.oasis-
> > > > open.org; mst@redhat.com; cohuck@redhat.com
> > > > Cc: hengqi@linux.alibaba.com; Shahaf Shuler <shahafs@nvidia.com>;
> > si-
> > > > wei.liu@oracle.com; peter.hilber@opensynergy.com;
> > > jasowang@redhat.com;
> > > > xuanzhuo@linux.alibaba.com
> > > > Subject: RE: [EXT] [PATCH v9 04/13] admin-cmds-capabilities: Add
> > > > capabilities admin commands
> > > >
> > > > Hi Satananda,
> > > >
> > > > > From: Satananda Burla <sburla@marvell.com>
> > > > > Sent: Monday, February 12, 2024 12:51 AM
> > > > >
> > > > > Hi Parav
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Parav Pandit <parav@nvidia.com>
> > > > > > Sent: Tuesday, February 6, 2024 11:23 PM
> > > > > > To: virtio-comment@lists.oasis-open.org; mst@redhat.com;
> > > > > > cohuck@redhat.com
> > > > > > Cc: hengqi@linux.alibaba.com; Satananda Burla
> > > > > > <sburla@marvell.com>; shahafs@nvidia.com;
> > > > > > si-wei.liu@oracle.com; peter.hilber@opensynergy.com;
> > > > > > jasowang@redhat.com; xuanzhuo@linux.alibaba.com; Parav Pandit
> > > > > > <parav@nvidia.com>
> > > > > > Subject: [EXT] [PATCH v9 04/13] admin-cmds-capabilities: Add
> > > > > > capabilities admin commands
> > > > > >
> > > > > > External Email
> > > > > >
> > > > > > --------------------------------------------------------------
> > > > > > --
> > --
> > > > > > --
> > > > --
> > > > > > Add three capabilities related commands.
> > > > > > First to read the device and driver capabilities.
> > > > > > Second to write the driver capabilities.
> > > > > > Third for driver to discover which capabilities can be accessed=
.
> > > > > >
> > > > > > Write capabilities by the owner driver is not currently
> > supported.
> > > > > > It will be supported in future by the owner driver to write
> > > > > > for the member device.
> > > > > >
> > > > > > Fixes: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-
> > > > > > 3A__github.com_oasis-2Dtcs_virtio-
> > > > > >
> > > > >
> > >
> 2Dspec_issues_179&d=3DDwIDAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DNHDPsfcAY
> > > > > lN2z-
> > > > > > NXHHG4WB09qqS0voo_nf6_kGS625A&m=3DKI-
> > > > > >
> > > > >
> > >
> QceHuScbIZDc_Kxteq_nU775BHpY5uMRJiwQuxhrgFOpnAx0SON8L2UXPJqty&
> > > > > s=3DjnFn-
> > > > > > DDDK_3FuIG5OPXgWud35KVh8KaeUDAro8N3jqU&e=3D
> > > > > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > > > > > ---
> > > > > >  admin-cmds-capabilities.tex | 161
> > > > > ++++++++++++++++++++++++++++++++++++
> > > > > >  admin.tex                   |   9 +-
> > > > > >  capabilities.tex            |   3 +
> > > > > >  conformance.tex             |   2 +
> > > > > >  4 files changed, 174 insertions(+), 1 deletion(-)  create
> > > > > > mode
> > > > 100644
> > > > > > admin-cmds-capabilities.tex
> > > > > >
> > > > > > diff --git a/admin-cmds-capabilities.tex b/admin-cmds-
> > > > capabilities.tex
> > > > > > new file mode 100644 index 0000000..47394c7
> > > > > > --- /dev/null
> > > > > > +++ b/admin-cmds-capabilities.tex
> > > > > > @@ -0,0 +1,161 @@
> > > > > > +\subsubsection{Device and Driver
> > > > > > +Capabilities}\label{sec:Basic
> > > > > > Facilities of a Virtio Device / Device groups / Group
> > > > > > administration commands / Device and Driver Capabilities}
> > > > > > +
> > > > > > +The device and driver capabilities commands are currently
> > defined
> > > > for
> > > > > > self group type and for
> > > > > > +SR-IOV group type.
> > > > > > +
> > > > > > +\begin{enumerate}
> > > > > > +\item Device Capabilities Support Query Command \item
> > > > > > +Capabilities Read Command \item Capabilities Write Command
> > > > > > +\end{enumerate}
> > > > > > +
> > > > > > +\paragraph{Device Capabilities Support Query
> > > > Command}\label{par:Basic
> > > > > > Facilities of a Virtio Device / Device groups / Group
> > > > > > administration commands / Device and Driver Capabilities /
> > Device
> > > > > > Capabilities Support Query Command}
> > > > > > +
> > > > > > +For the command VIRTIO_ADMIN_CMD_CAP_SUPPORT_QUERY,
> > > > > \field{opcode} is
> > > > > > set to 0x7.
> > > > > > +
> > > > > > +This command queries the supported device capabilities
> > > > > > +identifiers
> > > > > > bitmap in
> > > > > > +\field{supported_caps}. Each bit in \field{supported_caps}
> > > > > > +corresponds
> > > > > > to the
> > > > > > +capability identifier. Thus, supported_caps[0] refers to the
> > > > > > +first
> > > > > > +64-
> > > > > > bit value
> > > > > > +in this array corresponding to identifiers 0 to 63,
> > > > supported_caps[1]
> > > > > > +is the second 64-bit value corresponding to identifiers 64 to
> > > > > > +127,
> > > > etc.
> > > > > > +For example, with \field{num_caps =3D 2}, the array of size 2
> > > > including
> > > > > > the values
> > > > > > +0x3 in supported_caps[0], and 0x1 in supported_caps[1]
> > indicates
> > > > that
> > > > > > only
> > > > > > +identifiers 0, 1 and 64 are supported.
> > > > > > +
> > > > > > +The length of the array \field{supported_caps} depends on the
> > > > > > +supported identifiers - it is large enough to include bits
> > > > > > +set for all supported identifiers, that is the length is set
> > > > > > +by calculating by starting with
> > > > > > the
> > > > > > +largest supported opcode adding one, dividing by 64 and
> > rounding
> > > > up.
> > > > > > +
> > > > > > +The array \field{supported_caps} is also allowed to be larger
> > and
> > > > to
> > > > > > +additionally include an arbitrary number of all-zero entries.
> > > > > > +
> > > > > > +For each identifier, the driver can read the device
> > capabilities
> > > > and
> > > > > > write
> > > > > > +the driver capabilities. The driver can also read the written
> > > > > > capabilities.
> > > > > > +
> > > > > > +This command has no command specific data.
> > > > > > +
> > > > > > +\begin{lstlisting}
> > > > > > +struct virtio_admin_cmd_query_supported_cap_result {
> > > > > > +        le16 num_caps;
> > > > > > +        u8 reserved[6];
> > > > > > +        le64 supported_caps[]; }; \end{lstlisting}
> > > > > Since this is not fixed size, what happens if the allocated
> > > > > write
> > > > buffer for the
> > > > > command cannot fit the result ?
> > > > The device returns only the capabilities worth of supplied buffer.
> > > >
> > > > > Does the device return error with specific  error code?
> > > > No. it truncates to the supplied length.
> > > > This command relies on the existing admin cmd spec.
> > > > Please see the snippet from the spec.
> > > >
> > > > "Drivers are allowed to submit buffers that are shorter than what
> > the
> > > > device expects (that is, shorter than the length of status through
> > > > command_specific_result). This allows the device to maintain a
> > single
> > > > format structure even if some structure fields are unused by the
> > > > driver.
> > > > The device compares the length of each part (device-readable and
> > > > device-
> > > > writeable) of the buffer as submitted by driver to what it expects
> > > > and then silently truncates the structures to either the length
> > > > submitted by the driver, or the
> > length
> > > > described in this specification, whichever is shorter."
> > > But how would driver know if it has read in all the capabilities or
> > not ?
> >
> > Lets take example:
> > The driver interested in capability identifier=3DA, the driver's view o=
f
> > capability struct =3D X bytes.
> > The device view of the capability =3D Y bytes.
> >
> > Example_1:
> > Typically, old driver, new device.
> > X < Y.
> > Result: Device copies X bytes. So driver will see only capabilities
> > field worth of X bytes.
> >
> > Example_2:
> > Typically, new driver, old device.
> > X > Y.
> > Result: Device copies Y bytes because device only understands Y bytes .
> > So driver will see only capabilities field worth of only Y bytes from
> > the X bytes it allocated.
> >
> So this means that the driver needs to allocate for just enough device
> writable buffer that can cover for the largest capability id that the dri=
ver
> cares about.
Uhmm, no.
Each capability is read individually. A capability consists of multiple fie=
lds.
Please refer to flow filter two capabilities added at [1].

[1] https://lists.oasis-open.org/archives/virtio-comment/202402/msg00027.ht=
ml

So the driver which is interested in flow filter cap, will read these two, =
and not with the largest id.
The buffer should be just worth of the individual capability id for example=
 of [2],
Driver will reach each capability individually for id FF_RESOURCE_CAP and i=
d, FF_MATCH_CAP.

Capabilities struct is not suggested to expand in size. It is recommended i=
n [2].
But in case if we want to relax this also in future, it should be fine as a=
dmin commands can have the notion of backward compat structures.

[2] https://lists.oasis-open.org/archives/virtio-comment/202402/msg00020.ht=
ml

> The phrase
> "It is large enough to include bits set for all supported identifiers"
> was what threw me off. "for all supported identifiers" in the above means
> identifiers supported by driver and not device.
>=20
Above cited text is only applicable to LIST_QUERY and LIST_USE set of comma=
nds.

> Regards
> Satananda


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

