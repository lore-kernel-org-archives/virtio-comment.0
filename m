Return-Path: <virtio-comment-return-7574-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F94AE748ED
	for <virtio-comment@archiver.kernel.org>; Sun,  1 Oct 2023 09:42:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id AAC07335C3
	for <virtio-comment@archiver.kernel.org>; Sun,  1 Oct 2023 09:42:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9C4359866AC
	for <virtio-comment@archiver.kernel.org>; Sun,  1 Oct 2023 09:42:46 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 92EE8983D6F; Sun,  1 Oct 2023 09:42:46 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 85B4F98652B
	for <virtio-comment@lists.oasis-open.org>; Sun,  1 Oct 2023 09:42:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hwnI3kDZguB6ERh4w0rlDAaT1Q7aIBkXFbNAOgC200h92OrTU6T4wWo1BkilPSAH76VtAANLUce06YpC8wMpFzk05xvb+/gPYJ09jdGIn/lRDY618AzkSWHBpL2XD/mmJlr+J8WTUzDrEQ0p8CXafBKPVshhUXfdYD5UExiwkIc8UkAbV1Phj5qDwlav9DI90p/2kcC+CB+OcxdUqPs6+Qh0WLsb20Htr+wQjJlJU1GDxchSK8CtUtFAHPbfCDpBKu92+4DccEqqc0ORLVwTE9HSO0YOCLZH0jvmjX0zeJUnvBxySBjEssBdSXXmVBLhViSceWFul56M9bif4d5uJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LubNFowYvh/KcZ6uHzwQkbtwb13QFixTZvD7CNuijTo=;
 b=L0/sMY2BAfU0UzRkKP7pdVVsLMNPkQfJmzBKuyqXfL7LX/Mr0BfevbThgFHjfNywzK660K0OLJa1z9p3+9H1sNs89bPmobob6V6dcmyoiVc8KW3uDog8ERcl2gonQE0DmRM47c/RrGTipGfiuiCjhdpcIf6lDVghnooQ0QNHK4j9zpTcQPLOdKYlZ6ivYw+ZcDfhq4j0Vp0wFlQ6/dCn6L4Nh3uNhk6cHedcCna3E/0LwoMkjc9OmSOKKIEdsqGASsBJM/+5fufLMusGVUgYJeob+LBZw8j7u+XFfc7D7Gs3M4IPOdY3sBaDU4y3wHXSEFXCsQh/MHr5+RFzyNaqBg==
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
Thread-Topic: [EXT] [PATCH 6/7] virtio-net: Add flow filter requests
Thread-Index: AQHZ7Vubs6b2iEb7DEOlGONnSQN0j7A0n7Vw
Date: Sun, 1 Oct 2023 09:42:37 +0000
Message-ID: 
 <SJ0PR18MB4477626C269A031890BB6782C3C6A@SJ0PR18MB4477.namprd18.prod.outlook.com>
References: <20230922134838.3718-1-parav@nvidia.com>
 <20230922134838.3718-7-parav@nvidia.com>
In-Reply-To: <20230922134838.3718-7-parav@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR18MB4477:EE_|DM6PR18MB3571:EE_
x-ms-office365-filtering-correlation-id: 1beb7931-eb93-487f-2bb2-08dbc262bf92
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 RhTicQ0cSIcyeFYx0T4yy6Aawqyc+sCXOzvJwrexbx3HG0ueXwux+Y4iiBa1OSK2P2QWHdfenjdmtMJ0CPZj14Z8G6MK/yMLHbVygldXjzrXhkgSGXQMWkWKGPihY8YwRdJ1vKtWYS2x/MIFKIEjK/puGcm7KeabfcWOCzb4PAHpEG0V5RNvBjDLrP9kRPWYOGd+yq2GqsIYOhFfYQ2fxI6LZXrjJ9pxaRJYQo+f4r25xpOsvjX2ASpmJemGiReIDYQ+Lg4FPIK3T9dKcB9be1YGhogkbxC/MwRudcTQbzPgJiMFRHH7uz8xVDuDJg+8oUc99Mea8voaND6PXhQAtwADDd4KujbZw1GvTEIVKeu0bJM/G/4SlD7skaNTFPbgdJEkX14eAOT1ybhb4ntfvQfHP0pcPEfSwXArA9DpERN9Kk11lnh750ub4+yI2QsSpCOrN514iItNltz9aQ3hpIDKIZh3I+xU1GYN2TNopeq+BNQ2omelfoFKSUKdfuS7IMLhWLdyWrmJAXaqQSBgOhF5sEOtfeveFIPDyMo/vFRXUPHNMmmw5a2t1x7JDd9SyIYRIGt6VSnkKPn81emPJpGl9VICXe05Tt+sGqEePeQBoDIROxxu4zEGX4uWIOn1
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR18MB4477.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(396003)(376002)(366004)(346002)(136003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(2906002)(52536014)(5660300002)(8936002)(4326008)(26005)(8676002)(41300700001)(64756008)(66446008)(66946007)(76116006)(316002)(66556008)(66476007)(9686003)(54906003)(110136005)(55016003)(53546011)(7696005)(83380400001)(478600001)(966005)(6506007)(71200400001)(33656002)(122000001)(86362001)(38070700005)(38100700002)(87944015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?aOFlZZqH22nubDTlhqWy6drUjP7Sdw5NgGU/R7Y/qDrfNo+GQ4IyLNUep8zL?=
 =?us-ascii?Q?hG9pV+/yrl727ysCldPlz6HRjzlctyc7w1aaCponsuyiONAafssm37Vo7PxM?=
 =?us-ascii?Q?4hLFj/brkdFT1F0Cmvo2zE/1DVIk+wONHm/8FD0SwWa2qjm0+vLyXdvteby5?=
 =?us-ascii?Q?lZ7tJuzPitQmowZHszwFhBvP9lf0/58SnPEPYnut71/KoCUBZ/wFAxDRKOHh?=
 =?us-ascii?Q?sM9uuUbukQXkQohY00ZaxeQyQRR+lt/b2fVz0UM4heUr9H4ye12nYWlBhzPs?=
 =?us-ascii?Q?XnBvszYoN6C0QOJxSYnTprRD4bOul18x3LG3il0IcKEByzaqSBxLT29TJ6SO?=
 =?us-ascii?Q?i7/yNI/aKRFxufosG0VItYOGKEZOyuNu4vPDM/Idcn9BKHZFKPUivZnYMTAc?=
 =?us-ascii?Q?gnm7acua5cgabXJV057bvnFUx/UOHaJ4VkkdHqGHyvIey2DCHg6IPGs4yHBR?=
 =?us-ascii?Q?6SzmPg+akL9wTP9RdOuJjvGUgov22Om0cPc2YX7dk+60FFoNPz188DFvskpd?=
 =?us-ascii?Q?AQJ+5ocq0Q3d/bdPdvwnKQxIgGPzLdgcGyNJaGn/glL/y50f9Z51Ku6vVvsL?=
 =?us-ascii?Q?JmUxlMdqHgEyv/wM+7NfTGFDBT/FU6jp0ClC0hN9UrgUHRz8zHefGoV0mcqr?=
 =?us-ascii?Q?kt1ra0vU8TyucCNzKzWlhdTFuy52X9VKAmIQRvEaqXa3ZT+6Qz0R2sgSmxSn?=
 =?us-ascii?Q?RFIV+KpxNz65HTaW1ylp4+Lw7mH3gwX1DP7c9Fyig+FXblbAVo4GnUCNzugb?=
 =?us-ascii?Q?pubeen2g1fw6VEW5Fxv8BMGju3TW42QVmG4+5eXWSIDpKWR0CIMWHFC0P8T4?=
 =?us-ascii?Q?+hvwzWCq2S7VC5WBY9+pNznbnSSx1TXjrqHdsb2QIn1Hh8WNbZTHmAn+9pxl?=
 =?us-ascii?Q?zXVDbV/tzb34VCSD+5stpVfhb0CEack5ijls+lpqPx1vOf9valrJ7QjRxnRF?=
 =?us-ascii?Q?U17zEuB8bH/C4QDS5gBke9BkAI8wHiS03Qe3VjnFwHJV9y0yjFcTS4A1/SQj?=
 =?us-ascii?Q?kBbloqFRyuwNoApCLC1CjxdovLiAgIGQ0TM5j+e+ttEV+DuzsuipBUZ86cJ6?=
 =?us-ascii?Q?4awiW8EdHlZLVJ8cpYquvQyLbIEe82ZwN20rhyb+ClCnsT/1szBEz5vm9tJc?=
 =?us-ascii?Q?zau+baY20/8L3CmzVptr56YWuRUDYbpeZDaUGbHaMI9k/gU+QkeVMbFw5lw5?=
 =?us-ascii?Q?eu9as8Kiz+gDK4zuf/snYHnmqUNC1mUDAE92+zNY6KWPJNS9caBciZCNN3Ac?=
 =?us-ascii?Q?tvga2uTSH/izIXs1PNrxOCxDm5rI7VTBhgGNzP1VMQMyfDeOiTublbKrpqkt?=
 =?us-ascii?Q?ydGfadVN7MVC8dI2DlXV8z3fm2vqyaNL3Ang3SS/YJUs/pANpz0gJTUoOMG0?=
 =?us-ascii?Q?mDbGLkk2C0pF3KnRCvOUB+a2BuQ4uRl//jYBN6GuC1K7tayjNfRUSF3IUC2J?=
 =?us-ascii?Q?vk5RpS8tX8JH8Y8yTvi12SzM596qTgfiA4NA+6j7d+M/R+SfdbC5YU2qjNhN?=
 =?us-ascii?Q?Z1vyNN8NTJLyesxCNsZREy4kDqtl5F70V95+dBR+J2i2r+in6yccDb4g3+ra?=
 =?us-ascii?Q?okwESJk8h6clyyc2nPfXzuKZ5S3acP8CpPUsZbah?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR18MB4477.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1beb7931-eb93-487f-2bb2-08dbc262bf92
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2023 09:42:37.9353
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /kXhorQ5+l/Exvgk+lMSCX8EQtKQD0tACEjdGPtnQQHWu8GmcHUGkuVUPmecdQSdDKEuho8ounRtkNQKOMK3MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3571
X-Proofpoint-GUID: 914-W9Ign8QiJ8RWHSXfy33zTmTsVoV0
X-Proofpoint-ORIG-GUID: qIiWm6Yc6TjPM9wmJoph1GMee7wFUojI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-01_06,2023-09-28_03,2023-05-22_02
Subject: [virtio-comment] RE: [EXT] [PATCH 6/7] virtio-net: Add flow filter requests

Hi Parav

> -----Original Message-----
> From: Parav Pandit <parav@nvidia.com>
> Sent: Friday, September 22, 2023 6:49 AM
> To: virtio-comment@lists.oasis-open.org; mst@redhat.com; cohuck@redhat.co=
m
> Cc: Satananda Burla <sburla@marvell.com>; shahafs@nvidia.com; si-
> wei.liu@oracle.com; xuanzhuo@linux.alibaba.com; Parav Pandit
> <parav@nvidia.com>; Heng Qi <hengqi@linux.alibaba.com>
> Subject: [EXT] [PATCH 6/7] virtio-net: Add flow filter requests
>=20
> External Email
>=20
> ----------------------------------------------------------------------
> Define generic flow filter add and delete requests and its transport
> using a control virtqueue command and flow filter virtqueue(s).
>=20
> Fixes: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-
> 3A__github.com_oasis-2Dtcs_virtio-
> 2Dspec_issues_179&d=3DDwIDAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DNHDPsfcAYlN2z=
-
> NXHHG4WB09qqS0voo_nf6_kGS625A&m=3DIHsJAbcIVNPgUnWm0efBM1lgMhYDh6GQlsELQ-
> m7_aw_boogVEbpzWqJORcRziIp&s=3DlvduCalnfkSLiEaOMDU3RggyTPrP32u8-
> whKIlB95hk&e=3D
> Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
>  device-types/net/description.tex | 117 +++++++++++++++++++++++++++++++
>  1 file changed, 117 insertions(+)
>=20
> diff --git a/device-types/net/description.tex b/device-
> types/net/description.tex
> index a3cbb29..a96e47a 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -1447,6 +1447,98 @@ \subsubsection{Flow Filter}\label{sec:Device Types
> / Network Device / Device Ope
>  The \field{sport} is valid when VIRTIO_NET_FF_SRC_UDP_PORT is set.
>  This \field{dport} is valid when VIRTIO_NET_FF_DST_UDP_PORT is set.
>=20
> +\paragraph{Flow Filter Request}
> +\label{sec:Device Types / Network Device / Device Operation / Flow Filte=
r
> / Flow Filter Request}
> +
> +Two flow filter requests are supported by the device.
> +
> +\begin{itemize}
> +\item Add or replace a flow filter using a request \field{struct
> virtio_net_ff_add}.
> +
> +\item Delete an existing flow filter using a request \field{struct
> virtio_net_ff_del}.
> +
> +\end{itemize}
> +
> +\begin{lstlisting}
> +struct virtio_net_ff_match_field {
> +        struct virtio_net_ff_match_type type;
> +        struct virtio_net_ff_match_value value;
> +};
> +
> +struct virtio_net_ff_match_fields {
> +        le32 num_entries;
> +        struct virtio_net_ff_match_field match_entries[];
> +};
It is better to fix the network protocol order here.(l2,l3,l4).
> +
> +#define VIRTIO_NET_FF_DEST_RQ 0
> +
> +struct virtio_net_ff_dest {
> +        u8 dest_type;
> +        u8 reserved[3];
> +        union {
> +                le16 vq_index;
> +                le32 reserved1;
> +        };
> +};
> +
> +struct virtio_net_ff_action {
> +        u8 action;
> +        u8 reserved[7];
> +};
> +
> +#define VIRTIO_NET_FF_ACTION_DROP 0
> +#define VIRTIO_NET_FF_ACTION_FORWARD 1
> +
> +struct virtio_net_ff_add {
> +        u8 op;
> +        u8 priority;	/* higher the value, higher priority */
> +        u16 group_id;
> +        le32 id;
> +        struct virtio_net_ff_match_fields match;
> +        struct virtio_net_ff_dest dest;
> +        struct virtio_net_ff_action action;
Isn't dest also an action ? for instance, if ACTION is drop,
there is no point in adding destination, similarly if ACTION
is forward, can we not add the vq_index to the action itself=20
using the reserved bytes? based on action type, the additional
bytes could be interpreted.
> +
> +        struct virtio_net_ff_match_fields mask;	/* optional */
How is the presence of this field indicated if it is optional ?
Does it need a field like has_mask?
Can this be not added into struct virtio_net_ff_match_field ?
The mask only applies to struct virtio_net_ff_match_value. So
it may be better to just use
struct virtio_net_ff_match_field {
	struct virtio_net_ff_match_type type;
	struct virtio_net_ff_match_value value;
	struct virtio_net_ff_match_value mask;
};
instead of repeating the type again.
> +
> +struct virtio_net_ff_del {
> +        u8 op;
> +        u8 padding[3];
> +        le32 id;
> +};
> +
> +#define VIRTIO_NET_FF_REQ__ADD 0
> +#define VIRTIO_NET_FF_REQ__DEL 1
> +
> +struct virtio_net_ff_req_result {
> +        le16 status;
> +};
> +
> +#define VIRTIO_NET_FF_RESULT_OK 0
> +#define VIRTIO_NET_FF_RESULT_ERR 1
> +
> +struct virtio_net_ff_req {
> +        /* Device-readable part */
> +        union {
> +                struct virtio_net_ff_add add;
> +                struct virtio_net_ff_del del;
> +        };
> +        /* Device-writable part */
> +        struct virtio_net_ff_req_result result;
> +};
> +\end{lstlisting}
> +
> +When the flow filter request is sent using a flow filter virtqueue,
> +the descriptors points to \field{struct virtio_net_ff_req}.
> +
> +In the field \field{match_entries}, for each of the array entry the
> +field \field{value} and \field{type} are in the format described in
> +\ref{sec:Device Types / Network Device / Device Operation / Flow Filter =
/
> Match Types and Fields}.
> +
> +When the device completes the request, \field{status} is updated
> +by the device; when the request is successful, \field{status} is
> VIRTIO_NET_FF_RESULT_OK,
> +when there is an error, \field{status} is VIRTIO_NET_FF_RESULT_ERR.
> +
>  \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Devic=
e
> / Device Operation / Control Virtqueue}
>=20
>  The driver uses the control virtqueue (if VIRTIO_NET_F_CTRL_VQ is
> @@ -2125,6 +2217,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device
> Types / Network Device / Devi
>   #define VIRTIO_NET_CTRL_FF_GROUP_ADD 2
>   #define VIRTIO_NET_CTRL_FF_GROUP_DEL 3
>   #define VIRTIO_NET_CTRL_FF_TRANSPORT_MODE_SET 4
> + #define VIRTIO_NET_CTRL_FF_REQ 5
>  \end{lstlisting}
>=20
>  \subparagraph{Flow Filter Capabilities Get}\label{sec:Device Types /
> Network Device / Device Operation / Control Virtqueue / Flow Filter / Flo=
w
> Filter Capabilities Get}
> @@ -2241,6 +2334,30 @@ \subsubsection{Control Virtqueue}\label{sec:Device
> Types / Network Device / Devi
>  \field{mode} is set to 1, it indicates that the driver will use
>  flow filter virtqueue(s) for transporting flow filter requests.
>=20
> +\subparagraph{Flow Filter Requests}\label{sec:Device Types / Network
> Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter
> Requests}
> +
> +When the driver has successfully set flow filter transport mode as
> control
> +virtqueue using command VIRTIO_NET_CTRL_FF_TRANSPORT_MODE_SET, the
> +flow filter requests are transported using command
> +VIRTIO_NET_CTRL_FF_REQ over a control virtqueue.
> +
> +\begin{lstlisting}
> +struct virtio_net_ctrl_ff_req {
> +        union {
> +                struct virtio_net_ff_add add;
> +                struct virtio_net_ff_del del;
> +        };
> +};
> +
> +\end{lstlisting}
> +
> +The \field{command-specific-data} is in format of
> +\field{struct virtio_net_ctrl_ff_req}.
> +
> +When the flow filter request command is successful, the
> +\field{command-specific-result} is in format of
> +\field{struct virtio_net_ff_req_result}.
> +
>  \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
>  Types / Network Device / Legacy Interface: Framing Requirements}
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

