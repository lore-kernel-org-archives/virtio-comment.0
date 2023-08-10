Return-Path: <virtio-comment-return-7069-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B67CC001E0
	for <virtio-comment@archiver.kernel.org>; Thu, 10 Aug 2023 19:20:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 94E611EDCB
	for <virtio-comment@archiver.kernel.org>; Thu, 10 Aug 2023 19:20:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8DC4C9865D1
	for <virtio-comment@archiver.kernel.org>; Thu, 10 Aug 2023 19:20:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 82F4498658D; Thu, 10 Aug 2023 19:20:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D28E89865AB;
	Thu, 10 Aug 2023 19:19:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eodyfjdPp59DZ+KmZtoFW2DNuzL5psizErz8Y/27pnE06mE0o+9vaXkZ1ENvuB7kuX2DPsu40ucgunSqPG+kx19GvCZyC+OM+TByfVdhkN3uHtjbhTAnhb5U9uhZCE0Bb3vu3Kw8dWq6852mEYda1DoP59Nt6u9F29QFjOFwPamzUUj+Fsngmdh8cs1Qm8nRE0fW9df3LKDhkWezBbHOSXikOJuEjxKnow/ep1ALV6onq7YWlhb31qnd2dXwJWTK2xG+f0X825aUZgEeKPHZSAo3FAYzNCFx1N/DVRQCzuBYh/O/6sNRSnzE4m+qq1f/tnz8ST+y3iuqyWeH9cISAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Dm3WPBfr5/D48uODcAcJCDJZ93RPJYPbEE18glBAxo=;
 b=dClKVjw8ZxRYcp5rPO8CoGzZ83LThX4MlsIeplEa1y6s5pAHjDydnDCgbJt8kMX4ZSzhhIrgzJH2GI0yvxNb6SluRw9ut7KtqHXOI6OjjSGK/wr61+QvgGEyKFUIBIOcqmbrihg0XG0gePn5wmFgSbiwJtlz6oktTG4vl65oPfzr+pKiB+XmdiwhXhag0o9SYL8DLSOdisofdWG6aHOvkUIRmH0n9q24YvzXGZd8iN1kMHLF1+LbWxkHs9AeVnJsR40uCTj9YdpzkO7WnwGjBOk7MIV7DCKYEzHOd/BvdqGsq9fHxnD1BZo4vVhKz0GKuxumvmiOABSx87EHVChhSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
From: Satananda Burla <sburla@marvell.com>
To: Parav Pandit <parav@nvidia.com>,
        "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
CC: "shahafs@nvidia.com" <shahafs@nvidia.com>,
        "hengqi@linux.alibaba.com"
	<hengqi@linux.alibaba.com>,
        "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>
Thread-Topic: [EXT] [virtio] [PATCH requirements 7/7] net-features: Add header
 data split requirements
Thread-Index: AQHZvd/xp0GSXslsF0eqeLx2FWIUk6/kAhlQ
Date: Thu, 10 Aug 2023 19:19:24 +0000
Message-ID: 
 <SJ0PR18MB4477D634202BE468A70B9B44C313A@SJ0PR18MB4477.namprd18.prod.outlook.com>
References: <20230724033421.249893-1-parav@nvidia.com>
 <20230724033421.249893-8-parav@nvidia.com>
In-Reply-To: <20230724033421.249893-8-parav@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR18MB4477:EE_|SJ0PR18MB4447:EE_
x-ms-office365-filtering-correlation-id: e158a84c-c155-4b4b-d8c7-08db99d6b517
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ppp0RkAX1QyOxbzGHabRB+hZ+CsSDAR6JBjpmrD1QQjmoMOvbQnNK0HzMJUtQ+DrAQ9RNJwpvGcnGURitAoUziow1JEQkfPe6mAbejfsEAmAGjmETQI67TeLscW703OPcNoHQvmN2TqIAMMb++woGZnAlmiqPgNMnRmlBxOKdXUUv97+f9tBS+TutkhMSnfQ3HR3bP5Vn22x1ndDvnVSgT0jcQjH2HwTzOS8r2+AwX9/3CeaVgpTNJgDf45X9Ho/JeeWPfe2+mWhc5wBGUPFtJaQQ2c3q1TfZBBrYp3CNMbvv69mceujaY8IwUHZ8enDYsTx4hy7wcU+DW6OFtm6+8oRTPSnAR5vXwDC5LH1460WQaOIH9zHf2x6c0psGe2HVyNpR/5FP15CwhKDOaq7QN8vdM0xoLQ/nPrGpuu0PzKFvc2Q8OOY1XCiTVqcBPIAyyDkeEap52eYyCiExUxC21a/Mq20XX0glp54CG77mzr6C9shDkAUPXdbUrxnQuWWGx+DQn6/TmMD8sSLrVojbPjifhvD/zxMeTqMaIVhoGLDSw8IwT4dSgZLeMCDL19G0Wsu6lhLnoTOmwxeK6WPz6Hg2OnvhFo3q9O9+dA9k8o=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR18MB4477.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(346002)(136003)(366004)(39860400002)(1800799006)(451199021)(186006)(8676002)(8936002)(26005)(6506007)(53546011)(41300700001)(33656002)(16799955002)(83380400001)(2906002)(122000001)(38100700002)(38070700005)(86362001)(55016003)(5660300002)(52536014)(7696005)(966005)(66476007)(66556008)(66946007)(66446008)(76116006)(64756008)(4326008)(9686003)(478600001)(19627235002)(71200400001)(110136005)(54906003)(66899021)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?6eMzPyTusmcll20wRun/kOW371B141Jdt1Z9YqSovMxDZedN64yTP+0g1lxK?=
 =?us-ascii?Q?z2Fe6Nhdd2q5oeTyospTcr2R69lzYVzXuqgKyFVA4qhDeb2JzybwYRtDx7sP?=
 =?us-ascii?Q?GwrrC1MekmPycLAIhs4nCYivmOMptrB307WZgxYgL/PgNhJ1KWO8AdbfqW2z?=
 =?us-ascii?Q?GmEXsghntu0nsDiRtIGQN7Xhj3bW6dGyWSpodHsbmedZ3ZXm3LEKGr/lslt8?=
 =?us-ascii?Q?ErNxHR70l4jQkzjeUv8gQ/VUEli/QAbbJ7kF7LQNvO9yDhuGZb+xsM/adORU?=
 =?us-ascii?Q?Vp+UPFSngu7lAj49PCP85/pax5ZkgVbsyLdqFX3NLWDMdBRT5dxckHoYOImg?=
 =?us-ascii?Q?+n4EpqyHEgsbuH5+Ys3+8b+7Xd1pDszw83DeevgtOcMEwpJy1ymQE0Ty+6EL?=
 =?us-ascii?Q?ZarKBfsLTc4a6UQ9jJhvlj/DOAhaXlirND5ksi+AhPVDrmbO8nEaBnDM02eg?=
 =?us-ascii?Q?b35a3ZCbMehLMvVOCWvNRmMPtpS/1l4MO89PQ1l7y7qcscXE5BeUyfJ29xLK?=
 =?us-ascii?Q?0iSOTwu4qEtEbbm4ablo49JucMe6ChN2CC/udaRbh0Jsk7oT+HIS9qPpgRsC?=
 =?us-ascii?Q?64PwXh648ALu6NXQ+P9fygix7eZFOL3nyOLdNWBBtKqR4/S7pOhR5C6y9ly0?=
 =?us-ascii?Q?LPq3ZTDa/GoHDUX5gJbTuA1nW971bu4MMcL0AN8Vkg8tkl7Hs9bjG33jkDyM?=
 =?us-ascii?Q?poIzQsIRi/J//Pa1MSqXBs5El/9Ok95OTahvyOncb8NpMSgVwfzq2u6MuxV8?=
 =?us-ascii?Q?MN2JYsq6rcssXbnMOTWw/OZTJhSDTfFeQk05GaDRjnc+RSBNc22QbbdTwDWq?=
 =?us-ascii?Q?jCfoqEwOxVUDJv+fzz0Gn2Lzi0cpfby8EYoyQ8QI/bhJyaYPABLLj0oELqG4?=
 =?us-ascii?Q?h1TpmOWfmIpK0XyNIJGA28EqM7CE+luk1wzYRYL30/oGCxtoDPIhBGypt8Wy?=
 =?us-ascii?Q?lnUE3pD7g0PsoboW9haUVc02M+oLWXDlhcrLDwEgKKOnFdO5YOKpKpQDRtCp?=
 =?us-ascii?Q?nRcpCx4Vp9LQcwcV7nIc/ZF9FOodvxJIW6tZa0/f0v6vzz5KWnvInfCJYP9r?=
 =?us-ascii?Q?GZb08Bk9ceOnFIgzTLNU+ohiiKaOQMVFXQT5bqWqCu3qzubZCMZhSV6vmaan?=
 =?us-ascii?Q?x6XzM/8FyEqvF+LDhO7YQZG67Wr1Ri9U0ckzw8h1/o+KznYc0FGjQwu7uNHi?=
 =?us-ascii?Q?5uASwwpwHJj45ned6JJCukJ/LQUTA9/P54uY45amUcSGsTT7PtULeQqXUn/7?=
 =?us-ascii?Q?SJcF9S+dMJ0XxJQwghwJuBJ/cYwm3rb+H1WQacJp65oATHwP38BT0Yd12L1h?=
 =?us-ascii?Q?JUwrvbB2hv+3f9U8oJFRBshIR7odOFjTmPkWlHrc3L+aqMxygBqMffGj2pVK?=
 =?us-ascii?Q?g+tnR1hB2Q9y3uq8e6GBIQn1vGik9fuurZgU3Lk4nbRueeAfOjePa7SbHFhq?=
 =?us-ascii?Q?/9TTLZeJv5yambcHCDdkBMioE9WRLvOKwHrsS7f3HgR7hkzwEJW/kvcaHvXc?=
 =?us-ascii?Q?F3IytzDEqfvnNC0KCUyKNWtzGVDS7VPGc7Sf5H4TOZLxXY6LzbFIJnqj9TcP?=
 =?us-ascii?Q?RhD4mRshUjZTNnI+7wNex03XhQw8+O6tkZVnU9LZ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR18MB4477.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e158a84c-c155-4b4b-d8c7-08db99d6b517
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2023 19:19:24.2807
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QWCpvzv13c9nkPKxpPii+6XUCAKqtbwy9U1+FXSYC3xX4EM6/0s+NEZ6n8ZXyBDqQnRenY/cv1wqDodBQxdI8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR18MB4447
X-Proofpoint-ORIG-GUID: mkBTPiJ7lVAxCNvPixhnHvb6cd4Et_ts
X-Proofpoint-GUID: mkBTPiJ7lVAxCNvPixhnHvb6cd4Et_ts
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-10_15,2023-08-10_01,2023-05-22_02
Subject: [virtio-comment] RE: [EXT] [virtio] [PATCH requirements 7/7] net-features: Add header
 data split requirements

Hi Parav

> -----Original Message-----
> From: virtio@lists.oasis-open.org <virtio@lists.oasis-open.org> On
> Behalf Of Parav Pandit
> Sent: Sunday, July 23, 2023 8:34 PM
> To: virtio-comment@lists.oasis-open.org
> Cc: shahafs@nvidia.com; hengqi@linux.alibaba.com; virtio@lists.oasis-
> open.org; Parav Pandit <parav@nvidia.com>
> Subject: [EXT] [virtio] [PATCH requirements 7/7] net-features: Add
> header data split requirements
>=20
> External Email
>=20
> ----------------------------------------------------------------------
> Add header data split requirements for the receive packets.
>=20
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
>  net-workstream/features-1.4.md | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/net-workstream/features-1.4.md b/net-workstream/features-
> 1.4.md
> index 37820b6..a64e356 100644
> --- a/net-workstream/features-1.4.md
> +++ b/net-workstream/features-1.4.md
> @@ -11,6 +11,7 @@ together is desired while updating the virtio net
> interface.
>  3. Virtqueue notification coalescing re-arming support
>  4  Virtqueue receive flow filters (RFF)
>  5. Device timestamp for tx and rx packets
> +6. Header data split for the receive virtqueue
>=20
>  # 3. Requirements
>  ## 3.1 Device counters
> @@ -306,3 +307,15 @@ struct virtio_net_rff_delete {
>     point of reception from the network.
>  3. The device should provide a receive packet timestamp in a single DMA
>     transaction along with the rest of the receive completion fields.
> +
> +## 3.6 Header data split for the receive virtqueue
> +1. The device should be able to DMA the packet header and data to two
> different
> +   memory locations, this enables driver and networking stack to
> perform zero
> +   copy to application buffer(s).
> +2. The driver should be able to configure maximum header buffer size
> per
> +   virtqueue.
> +3. The header buffer to be in a physically contiguous memory per
> virtqueue
> +4. The device should be able to indicate header data split in the
> receive
> +   completion.
The device should also be able to indicate the size of the header that
has been placed in the header buffer.=20
> +5. The device should be able to zero pad the header buffer when the
> received
> +   header is shorter than cpu cache line size.
I am not sure why this is needed. The driver would anyway need the size
of header that was placed in the header buffer to be indicated by the
device and would not consume beyond that.
> --
> 2.26.2
>=20
>=20
> ---------------------------------------------------------------------
> To unsubscribe from this mail list, you must leave the OASIS TC that
> generates this mail.  Follow this link to all your TCs in OASIS at:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasis-
> 2Dopen.org_apps_org_workgroup_portal_my-
> 5Fworkgroups.php&d=3DDwIDAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DNHDPsfcAYlN2z-
> NXHHG4WB09qqS0voo_nf6_kGS625A&m=3D8mCmsaqsETpHBYC1cSO251gJSPqA8d8Tv5mTc3A=
v
> 0hL0J7SuDkUgA4w2WQFUq-pD&s=3D4CzAmGWykUmjgHgWM2C2-
> S4tknBE2erM7pTbXK10r7M&e=3D


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

