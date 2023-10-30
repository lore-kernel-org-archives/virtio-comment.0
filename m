Return-Path: <virtio-comment-return-8021-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06762C4332F
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 01:36:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4421033585
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 01:36:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 31224986B1D
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 01:36:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 260039869D7; Mon, 30 Oct 2023 01:36:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 18164986A37
	for <virtio-comment@lists.oasis-open.org>; Mon, 30 Oct 2023 01:36:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MwM1VHF+F/E5c8i9mBJ+tHpovZ0NUAjctnMLChuGkVa6hFZbFCHC7OTYvmbRN0C+h8P6zbG1zdZ6T7C53sBTPLuaIJOfuvpJkzgKFkuI1ojK2tXIxuhSkJ4tL30YWh+cSMGt4c9thRme2ln0dcvqRjk5RIcEZv+zk+cSfQKU1WL1bQK54s4nkTyNCBvt5MdGbUFS44qEh7VZLmpBYgHCJX8Dvnyw9ENWCBmyELYHmbtfZ24JKFdLHT2kdjkOJgcCiG8oBWD+ED+wUPcpOIKLAaou7A3Jh9/YmtN9PnqqnWhqOLT3lUTZCv6s8YEgbUqn98KSwPIp4B7/Oq0nBpJprQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eUFDfuGsEdG8G+8WJ34ttLxp3UB8o9/cpThsg4QRGSQ=;
 b=b9Rwde4tjE19rnX0p/3bUB6F+g4GnJG+MA+S435WqGQteTMupHvsT2Gvh4IwqpmOGtWxSt4NZAg/6f1j9s13H2XTMjjYYvxoKt6hH4WuYLlT/XIkU2JwSspSB8tC/2jor5YYinJdFx/MZ4/1bEB/Vs9tE5tbo5fitFAMEd/WL4PjbA0mNSP7W+KeTfvc0QoAhEH4bIWQQXXQh44bl4TgD2R50zVvvpstJ2oxW2rpiMDq/q2v3QHMNt6wwtoHa/onUl7AhzZ/h4DuES94tHvOQW4IcjBwrW4nYCtGgMW6/iS2Bd/hYfopTk7tBjL0eXoiXL95QZDlwnOyy64etO7YeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
From: Satananda Burla <sburla@marvell.com>
To: Parav Pandit <parav@nvidia.com>,
        "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>,
        "mst@redhat.com" <mst@redhat.com>,
        "cohuck@redhat.com" <cohuck@redhat.com>
CC: "shahafs@nvidia.com" <shahafs@nvidia.com>,
        "si-wei.liu@oracle.com"
	<si-wei.liu@oracle.com>,
        "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>,
        Heng Qi <hengqi@linux.alibaba.com>
Thread-Topic: [EXT] [PATCH v3 5/6] virtio-net: Add flow filter match entry,
 action and requests
Thread-Index: AQHaCNjiP0/PNd/KPUOiLzK3+uO4drBhj4EA
Date: Mon, 30 Oct 2023 01:36:22 +0000
Message-ID: 
 <SJ0PR18MB4477FE7AA434828B62E8FD55C3A1A@SJ0PR18MB4477.namprd18.prod.outlook.com>
References: <20231027132324.1349963-1-parav@nvidia.com>
 <20231027132324.1349963-6-parav@nvidia.com>
In-Reply-To: <20231027132324.1349963-6-parav@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR18MB4477:EE_|CO6PR18MB3858:EE_
x-ms-office365-filtering-correlation-id: c9698390-b1ff-419e-321d-08dbd8e89fb0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Bo5YkBvc69MsfsRu+YUsFW2gPx843o88nhdmMJDlxY0Lec1hhHFmBPNAfXeWWMKSRCcn8nzgrD/87q3aiIldtCPbO9BHysw7pYPpEg/emcvPynkZtwflh+xZU1PukeKjdFl43S8w+WiB2tTxjCseo8zWUHAz1mXibm31Kw3BVmhRloc55yL7Z3jN7otGPwg2Qx/xP+iL3cZ/GLTo43Moa/I+cVwDgTZh+T2nlrQPHeb8Cyc5mEzMd+fzihK5LXB9iqU5GE4dCTmAzDaaJJz7ukA79EQonXTXZ12W/rL0tiotadJHp5HzNAJx9e++Nka2ZI0k+cj3WQfgZ4FkR0YK6S1gIYhu3zltN0kQzf8SCMNe3quhOur2i6YhCPUqGCBkmRDGdNaF9V3D0UYC9g12lAv2WwC12KTLxLvmMvb64SaNW5SpTmktlNAro18Z1+WPGnpPAIHvw1AvTjhLXK6kcisCZNLrenmK+Td4TsjqoNuuYO9stkjVsAchvpzCHnvbYtF9gM5+9wFvzB59Fk6VL7lFLjwtgzy9fwW6w7E1B71/lX73ci/KHhq05StAd457cZveF/L2MutG9VCG1GFxAipZ6/nvplbMSJrrRqSSkkJ09RlQcGb+GeSS19IpoFzKTZ2E9uscysV3zOa9P8F2GQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR18MB4477.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(136003)(346002)(376002)(366004)(396003)(230922051799003)(230173577357003)(230273577357003)(64100799003)(451199024)(186009)(1800799009)(55016003)(83380400001)(26005)(9686003)(2906002)(66946007)(71200400001)(66556008)(66476007)(66446008)(110136005)(316002)(64756008)(41300700001)(54906003)(4326008)(8676002)(8936002)(5660300002)(52536014)(53546011)(7696005)(6506007)(966005)(478600001)(76116006)(38100700002)(122000001)(33656002)(86362001)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ss+6fyyGf8Awm2brmBeQpvc55KnO1o2/VD3ECLvv1czVBFtewR/Qs7MgYyY2?=
 =?us-ascii?Q?piK4G6NvWcrJsde8k5HIF2MMpyQ75czxAvIkzTZVGntZ73WZudsSnjO7my3z?=
 =?us-ascii?Q?rYnia0Epb/RaXvPT7Apt5aTNiXg885ptVPC/JYtnfZugqCe81gMAuKvbfAHS?=
 =?us-ascii?Q?yb1NkTMjxGEhk5UqT7SkzVWWS6I9k0GtHYg0y5nW8d6L2cyICpsnUMXN0Th7?=
 =?us-ascii?Q?A3VThG39ng+KFnz8ENAT+W+Icrcefc6azsPlMPm3ytwQfnr9wu3QOAECk6NB?=
 =?us-ascii?Q?51ZQTpSsvtniwwWfphBBTX9IHM54duOQk+QQmiOW0aAudtb3JQ4N1KY+hj4P?=
 =?us-ascii?Q?MzpvE0TtU7eJxVAk229pcJ8xMjU2cMMASRiLvkNSgi8EvcU0yRQgvx9MFqQf?=
 =?us-ascii?Q?LKLgrpjbT07JV2j0biyNrGZ6NNez8SZBE1h5YGPR8iSzZZmvU1sCpVEVl5HV?=
 =?us-ascii?Q?zVmlmb/9jA3myixfJeEeYBvJ64S5nsFgvWHgYRRPoAg8PdqDJl0HEQ3Edhce?=
 =?us-ascii?Q?x3O9XQVeA5jj3/vot0OI0d190HEd4e5D2qsEwwxy3Zbvg36UGeZDxmAz2XA2?=
 =?us-ascii?Q?jEAzHNtZK1YZHM+A/kI7YnTvsYBmACqdLCFIcTFim9DH3KkS1e63OscNNqo6?=
 =?us-ascii?Q?0ax3v8+LeHjapjHKSmXhl3+TKNl/WykKxdRGkrPsk/AzEty1Fdxv5L1n+gJ+?=
 =?us-ascii?Q?z/QrJQNNM0afoTBuGMufRvwv9WGMW/c9N4NDvS4QCRA1hsJymi362rOoIAeL?=
 =?us-ascii?Q?535Yp/glRUjbvUFW+X7XLOV4MVL4K74h0TXcQkT3tVrBi5glNMCnXtbQ3Wgr?=
 =?us-ascii?Q?sPkI571wfa7ojO97F7zGQaj3ATiZWBjT4ISS7i7eIFQLZC2IzCSg6S22kEwy?=
 =?us-ascii?Q?AR1vqV9c4adrjPX6nK2GrLIE1c0mZDq6pQdAtAkyvg/gvTqQLHpOTxJkLZSG?=
 =?us-ascii?Q?Ah6X4f3wZLYTqhehEgTb6AllWSMm8C3qSvm+GkRMXYe97j8JJTbZL760VZLa?=
 =?us-ascii?Q?j9B1n8Z4ihQ5GTafq55m8nuBiWvmY7j1QXLHGFN8OBRhJ96X12CS77Y0iVaM?=
 =?us-ascii?Q?G7eCksmnkyyPx1ZpPPFXC++3xK4g33Edc9fKZkSFEYWYRQOqb1GutVdbAXS1?=
 =?us-ascii?Q?HHiAJHQPs9c9oUvNySntasFDn0DWtj2IgWo8gHQGKKkiIXuke7TDRyBN7fKQ?=
 =?us-ascii?Q?SN7X+Ch5COK0fUZQHPUdLblxOM7u/J/2tPdUI1csuLfIDPQM53pjs1ktN3tc?=
 =?us-ascii?Q?d3FpsP4IsfM9PAF+3ZNOH2xyXGBdMLx7CpxF4ODsoU8WKzwmRxQvum1bD/IL?=
 =?us-ascii?Q?phMEHh2fRmoFnxJ1qtSPD6GNdb6F9ye62rIDqxSbiCJcsBOsqZB7hPmHtZXo?=
 =?us-ascii?Q?E+Ldo9P5ORMjBN5zeUxqbDYxgUZBAGAEEjEKGcwgqJN7fUEzbsGMZ5ON7NnL?=
 =?us-ascii?Q?H89eHV3rragPYrpwyEoV/pWuK1UuHiQAGb/lzqGbBz6VBr70ayvmvA4CEghA?=
 =?us-ascii?Q?IuwR0rZ/o6yeo4NEqzzDPniPm6HAT8x+9CJkl/o1jniVPzFBvOdHuNCI3cEM?=
 =?us-ascii?Q?/SEdXifMWVQdfFZZYLhHlbhDO/I6h0Fq3JFr9bMz?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR18MB4477.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9698390-b1ff-419e-321d-08dbd8e89fb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2023 01:36:22.5987
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 00wvMccNbKpe1XZYPyTeY8fi87NjfdMUKmDKyKtiCtE/8iQHWBvnhuzAfke2lXI7O/qgh/GuhXroqzfOEBNAOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR18MB3858
X-Proofpoint-GUID: JUO6FAfK3fJ6N7TwuQ2lSR0PXTvH2FfA
X-Proofpoint-ORIG-GUID: lpJEzQA8IDAcy3AhLOz6eOy4lxCwikM7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-30_01,2023-10-27_01,2023-05-22_02
Subject: [virtio-comment] RE: [EXT] [PATCH v3 5/6] virtio-net: Add flow filter match entry,
 action and requests

Hi Parav

> -----Original Message-----
> From: Parav Pandit <parav@nvidia.com>
> Sent: Friday, October 27, 2023 6:23 AM
> To: virtio-comment@lists.oasis-open.org; mst@redhat.com;
> cohuck@redhat.com
> Cc: Satananda Burla <sburla@marvell.com>; shahafs@nvidia.com; si-
> wei.liu@oracle.com; xuanzhuo@linux.alibaba.com; Parav Pandit
> <parav@nvidia.com>; Heng Qi <hengqi@linux.alibaba.com>
> Subject: [EXT] [PATCH v3 5/6] virtio-net: Add flow filter match entry,
> action and requests
>=20
> External Email
>=20
> ----------------------------------------------------------------------
> Define flow filter match key for the defined types.
>=20
> Currently it covers the most common filter types and value
> of Ethernet header, IP addresses, TCP and UDP ports.
>=20
> Define generic flow filter add and delete requests and its transport
> using a control virtqueue command and flow filter virtqueue(s).
>=20
> Fixes: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-
> 3A__github.com_oasis-2Dtcs_virtio-
> 2Dspec_issues_179&d=3DDwIDAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DNHDPsfcAYlN2z=
-
> NXHHG4WB09qqS0voo_nf6_kGS625A&m=3DpDD152kDeYQpenIq0s9wtl9jKhGXu8vH8UADzvj=
3
> 0H0vYSHapi4Dg_VGMbM6Q11k&s=3DJVXwjbepSf9bUQv4ij0cZm6juQ5i1eh61To_7gykte8&=
e
> =3D
> Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> Signed-off-by: Parav Pandit <parav@nvidia.com>
>=20
> ---
> changelog:
> v1->v2:
> - squashed with match fields definition patch of v1
> - added length to the flexible array defintion struct to benefit
>   from future runtime length bound checkers listed in
>   https://urldefense.proofpoint.com/v2/url?u=3Dhttps-
> 3A__people.kernel.org_kees_bounded-2Dflexible-2Darrays-2Din-
> 2Dc&d=3DDwIDAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DNHDPsfcAYlN2z-
> NXHHG4WB09qqS0voo_nf6_kGS625A&m=3DpDD152kDeYQpenIq0s9wtl9jKhGXu8vH8UADzvj=
3
> 0H0vYSHapi4Dg_VGMbM6Q11k&s=3Dd23DLZc9XwFc79vSSZqnKj8FcXXZZOeQbK73LIlxNgY&=
e
> =3D
> - renamed value to key
> - addressed comments from Satananda
> - merged destination and action to one struct
> v0->v1:
> - reworded add flow request text to consider optional mask
> - replaced respond with set
> - added mask flag to the type
> ---
>  device-types/net/description.tex | 209 +++++++++++++++++++++++++++++++
>  1 file changed, 209 insertions(+)
>=20
> diff --git a/device-types/net/description.tex b/device-
> types/net/description.tex
> index c52ed41..486f661 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -1270,6 +1270,50 @@ \subsubsection{Flow Filter}\label{sec:Device
> Types / Network Device / Device Ope
>  };
>  \end{lstlisting}
>=20
> +\begin{lstlisting}
> +struct virtio_ff_match_entry {
> +        le16 type;
> +        u8 mask_present;
> +        u8 key_mask_len; /* sum of length of fields key and mask */
> +        le64 fields_bmap;
> +        u8 key[];
> +        u8 mask[]; /* optional, only present when mask_present is set
> to 1 */
> +};
> +
> +struct virtio_ff_match {
> +       u8 num_entries; /* indicates number of valid entries */
> +       u8 reserved[7];
> +       struct virtio_ff_match_entry entries[];
> +};
> +
> +#define VIRTIO_NET_FF_DEST_TYPE_RQ 0
> +
> +struct virtio_ff_action_forward {
> +        u8 dest_type;
> +        u8 reserved[3];
> +        union {
> +                le16 vq_index;
> +                le32 reserved1;
> +        };
> +};
> +
> +#define VIRTIO_NET_FF_ACTION_DROP 0
> +#define VIRTIO_NET_FF_ACTION_FORWARD 1
> +
> +struct virtio_ff_action_entry {
> +        u8 action;
> +        u8 len; /* indicates the length of value in bytes */
> +        u8 value[];
> +};
> +
> +struct virtio_ff_action {
> +        u8 num_entries; /* indicates number of valid entries */
> +        u8 reserved[7];
> +        struct virtio_ff_action_entry entries[];
> +};
Thanks. Looks good now.

Regards
Satananda

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

