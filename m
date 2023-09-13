Return-Path: <virtio-comment-return-7404-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F38BEDEC71
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Sep 2023 15:24:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C07376846A
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Sep 2023 15:24:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AA6C3986641
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Sep 2023 15:24:37 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 93AF1986633; Wed, 13 Sep 2023 15:24:37 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 833FB986634
	for <virtio-comment@lists.oasis-open.org>; Wed, 13 Sep 2023 15:24:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WSzxQOzbxhWsMFkST3OPLGnQ1JddRFsuVvG1xvhLGR2qTExMYqn4gry6KNwczQRRjd6IsXruqc7z52p/9igyXwt8wN03U/ZvwUV+rrXI3lt20T3T03qPuDsn6L40NRXTVaGlIF1vKPEXN19F8/BaK85ThDmZE9BfiVx8qm+HHi4YRPikFMUzAV2dttzFSXbrKdoYuJyLoBBcRFbgDxcGT9+mjWUk+xFfnkARpwh8zKmaQO+Pf+30wmPRjkBaN100W0ofKHqUMAoBB6p+ekJ7lYUKLXHPV9Xq3ZoHNhpIsRTtAnrqz8GIHuFxXz8+efBJ/wdTSKkHQu3GzEn7LCIv4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RndTJMgxiH0ZITDcEExeae5oElLuLuknoECgYK1I7xo=;
 b=QfN+y3OB4CUKGOdWoZG3zh9fR2pL4FGQTuLn/CqWiJWXO0f3+vUFrsdKf4YYRqj1Rms2cgqSwSxcnKCVRPbOaZafFmjtlsKwCMLZHFYCf6VgDoriJxuIx0L0BCbgDt1OiWIsctBUtMKmdTRb6rLI5B02+eIpEsMdVRJhQ4dD/rpYQfZ+7zms0tFw/PCjG275z2xGZqVBYErcGj5rwSZDGnqhjAPVDs1cIYpErpH67x+dSfavoeDnNzoNXpjSPgKLcHOeWtxVpFY5T7gFnJFey9ciblMZvxLo4MWi0XX9k7FtR0SXWs3aPhn/w7yc/otgALXRolnndVol2PANWUodrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
CC: "jasowang@redhat.com" <jasowang@redhat.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, David Edmondson <david.edmondson@oracle.com>
Thread-Topic: [PATCH v17] virtio-net: support device stats
Thread-Index: AQHZ4VFcizzRxaDjyk+9nFKWIkpGi7AY5kXw
Date: Wed, 13 Sep 2023 15:24:34 +0000
Message-ID:
 <PH0PR12MB5481C32DA10A84488E421328DCF0A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230907060546.12730-1-xuanzhuo@linux.alibaba.com>
In-Reply-To: <20230907060546.12730-1-xuanzhuo@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|PH0PR12MB5433:EE_
x-ms-office365-filtering-correlation-id: 3e8593da-1a9d-498d-2913-08dbb46d8935
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 /lSEXuXrcqX0ofXkMkquIxh8y8JOwXyV4TpeFNYCUnTNzPNoH8rRr1U+L/nVzMPBxTl/AZClclN7xXHNxgJntcAqGYEohFKtr/7v5snffwUcwNrVZuODJ80EqSd7geH1g5Y5iaDKXbi7BgeWrHhUlHWBEHgsy73NoVHYiYYT4CoO5rEXKnTLVfXkT4TvocDGauLhUtoLK+AvtROEvQMuyGsGj5d9FcvvpvGJ6WJiKcTKYQLR3Es0pAe8h9YY1cwlexyeNTKRCmlhCzAGTS6ra4L8HZR7xKcgedeYyZVUfioNwEpBvhu2Vi+9xVg2oGNQFXBTIET05PZEBw8N+cG824udD3mYemTjqBqboNkTWLyQ0cMTd9wahOOAPzxM0cRA8yTmkDja3G/eNkLOy+aVM1GF/R8U9+fRl1VCGdhfgg591SSbWjy3lc9wfzqoismycH1WEosULGSp+j4tdnlm+fuQq8kmFKwEEFxIZvtV853VbFr3M43oetKoibPl4H6fZTBj4Ie+6sVRc4Wuks3x6ErnFlfUdC7MKG1BWT0iM2pHz8UaaaVhxh8UXnlZkXY17fyb6ZuU11g289mlD5xUQm8z5LXimZ4Fvo50e/pX6y7e9usF8rOPOANZbNmOFjuY
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(136003)(39860400002)(376002)(186009)(1800799009)(451199024)(66556008)(122000001)(2906002)(33656002)(38100700002)(52536014)(38070700005)(5660300002)(55016003)(86362001)(478600001)(54906003)(8676002)(4326008)(66446008)(8936002)(41300700001)(83380400001)(66476007)(6506007)(7696005)(26005)(9686003)(64756008)(316002)(110136005)(71200400001)(76116006)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?hsYBdsqEsl51uIgJcbq7BHfSpnjsuwkmvvveUfDwvqxZwXjiqJq+K7FRZMfH?=
 =?us-ascii?Q?aJx+f0xyyjUntBdkPLKr+KkDex1UY6Ry4ruiTAsisEzIgv+SJ1sSTpnQFnlr?=
 =?us-ascii?Q?WfbG6bEDH9+XKgIP3mkO6YrJY7ilARbMEn3hd5bTRT9olq80pYHiI0u7BgFb?=
 =?us-ascii?Q?36CniWK1RNfTqtEzRI4z1HSNDkTlgfecAj7giu/Z17YeUd6T8nCkWZB1FYy+?=
 =?us-ascii?Q?ywfNfYXWW1nPZa/lzGD48QFDPbOkDQIsg1+Bwuo0yVQ5kC/iEU5zToSL80mt?=
 =?us-ascii?Q?67+opSl9khNkAe5GJZYaDj06hKneX+zJcBPbFALe95g1pT4VDjlm9f4DP1Ku?=
 =?us-ascii?Q?kS/mPhhAXnVpBchTxTBrOVu/63iAAaxLaoE+9fDtVaqqbFgaU5LXB7lV8zmk?=
 =?us-ascii?Q?cLwp0JSArAJx1dPNWrlvmZ5wdD2976QXlu8Rc2dtP7rpKJwwiFnqOkyunIDB?=
 =?us-ascii?Q?XMwfpm/yRcf/O0In+sJK1OMcf04ELOKGzkxBlH3B6idAoevk+LzwKlyVSood?=
 =?us-ascii?Q?/0ngYBe/kbrNaIv+wfYN5J6AdIMnawZeNwxqmA7XTtkGX3XNW14JTVRFFOZf?=
 =?us-ascii?Q?irIjAJ5Ih5vLbTLtRyJKTz6HT/GOyAiV/+FECC3vm4DxhSPaWYF67z53T+bo?=
 =?us-ascii?Q?Ayvv5JGpuuCp7evPAkXa5vMxO0DgSqsZLUkALQenLxwLol3wQ/2OrhPQUFGa?=
 =?us-ascii?Q?Kh5G1fNPZJtKX8jxY0YmyZ2sT0iTuOPiA2qS2xpUYnhelfqRDpJMGyBsyaqA?=
 =?us-ascii?Q?hfsWYj0OoTZnLsxT1A2K0hvO/K1vekd8KuDAyMEx7y+wyX361Sx+bKl/rqQW?=
 =?us-ascii?Q?9wYYq05IP7lkuigJIIHmmzM5Gp9kcvt3z+92NqKOBKyctMvkLFNSlGPU7Blp?=
 =?us-ascii?Q?hmJplG9sPnD6Kb5JpS/X2sYh2CZOuC1yrPbBmFNIeYPAVa4bIt88dIXZZn6+?=
 =?us-ascii?Q?k18bGIdJ7aCSiXG8jGOVK6Xf9XD7ztR6wPyO0Vwbrs1UCOPqVc5NpuEKUsUV?=
 =?us-ascii?Q?fBW66Gf9M5gD34rcTbjRqzjZhIO/vrEoJJdLme6ARnvct9S5IbbnxlkIj4vx?=
 =?us-ascii?Q?7hF9GgMBIxnmqerButkhfrGrUqkIMR2+btMTa7J79jX0rzJCo0iFnmG8cva2?=
 =?us-ascii?Q?+OuzlFum3I9xsbEcOFTX6XfM8jXn+/M3lBLN4MTruP68NqcfJ8a0Hy4X9Pkh?=
 =?us-ascii?Q?ERVNW99bWv1xVJioKoDkb1FEuWLCXHEdYT4LqMoCpcF4qZ5DknlAyaLIpu9a?=
 =?us-ascii?Q?IAitfDxjAYQYJUOG5GrK29HROzpwqN1yhn948PQh7KbpZbuf+8ZAkNnqca24?=
 =?us-ascii?Q?yMwOT12ebUEYAXYXRWpH23paHbZ0X+lWrbNWoJlQyMlaFKNj+PXRGoG+9QBG?=
 =?us-ascii?Q?i8J/NoDWpwl6wu2vm3e1jdqW/4VZWMQ/oOP6aDSBvZUKc+LE8ZojSi7vrgLl?=
 =?us-ascii?Q?UJ3H1/J53QukUljSOLWH63QhKJtdPOEeEhj/Cp4fyV+dELaF8aKqP68bR8u4?=
 =?us-ascii?Q?c2D1KQJ5f5SC6dQR92jSbmgG/EZQdy2bCyM3Iw3y3FGB+ryOTBmAAOACkYnj?=
 =?us-ascii?Q?iRDlqQ4U5IzFBX1JHIY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e8593da-1a9d-498d-2913-08dbb46d8935
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2023 15:24:34.9325
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 45q+lSksnLgkJISjYftfKUd7Fh0MctoGl3zucLW/iw8La5YJrPzaKnyAWIj7Y4g1mZMW/uEQNFXwMhH0agoRbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5433
Subject: [virtio-comment] RE: [PATCH v17] virtio-net: support device stats

Hi Xuan,

> From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> Sent: Thursday, September 7, 2023 11:36 AM

I am sorry I missed few small comments in v16.
Please find it below.

[..]

> +\begin{lstlisting}
> +struct virtio_net_ctrl_queue_stats {
> +       struct {
> +           le16 vq_index;
> +           le16 reserved[3];
> +           le64 types_bitmap[1];
> +       } stats[];
> +};
> +
> +struct virtio_net_stats_reply_hdr {
> +#define VIRTIO_NET_STATS_TYPE_REPLY_CVQ       32
> +
> +#define VIRTIO_NET_STATS_TYPE_REPLY_RX_BASIC  0
> +#define VIRTIO_NET_STATS_TYPE_REPLY_RX_CSUM   1
> +#define VIRTIO_NET_STATS_TYPE_REPLY_RX_GSO    2
> +#define VIRTIO_NET_STATS_TYPE_REPLY_RX_SPEED  3
> +
> +#define VIRTIO_NET_STATS_TYPE_REPLY_TX_BASIC  16
> +#define VIRTIO_NET_STATS_TYPE_REPLY_TX_CSUM   17
> +#define VIRTIO_NET_STATS_TYPE_REPLY_TX_GSO    18
> +#define VIRTIO_NET_STATS_TYPE_REPLY_TX_SPEED  19
> +    u8 type;
> +    u8 reserved;
> +    le16 vq_index;
> +    le32 size;
> +}
> +\end{lstlisting}
> +
> +To obtain device statistics, use the VIRTIO_NET_CTRL_STATS_GET command
> +with the \field{command-specific-data} which is in the format of
> +\field{struct virtio_net_ctrl_queue_stats}. When the command completes
> +successfully, \field{command-specific-result} contains multiple
> +statistic results, each statistic result has the \field{struct
> +virtio_net_stats_reply_hdr} as the header.
> +
> +The fields of the \field{struct virtio_net_ctrl_queue_stats}:
> +\begin{description}
> +    \item [vq_index]
> +        The index of the virtqueue to obtain the statistics.
> +
> +    \item [types_bitmap]
> +        This is a bitmask of the types of statistics to be obtained. The=
refore, a
> +        \field{stats} inside \field{struct virtio_net_ctrl_queue_stats} =
may
> +        indicate multiple statistic replies for the virtqueue.
> +\end{description}
> +
> +The fields of the \field{struct virtio_net_stats_reply_hdr}:
> +\begin{description}
> +    \item [type]
> +        The type of the reply statistic.
> +
> +    \item [vq_index]
> +        The virtqueue index of the reply statistic.
> +
> +    \item [size]
> +        The size of bytes of the reply statistic.
I missed to review this before.
We need to tell if the size contains the reply header or not.
So, how about,

The number of bytes for the statistics entry including size of \field{struc=
t virtio_net_stats_reply_hdr}.

[..]

> +    \item [tx_gso_segments]
> +        The number of segments cutted from GSO packets.
> +
s/cutted/prepared

> +    \item [tx_gso_segments_bytes]
> +        The bytes of segments cutted from GSO packets.
> +

> +The structure corresponding to the receiveq speed statistics is
> +\field{struct virtio_net_stats_rx_speed}. The corresponding type is
> +VIRTIO_NET_STATS_TYPE_RX_SPEED. This is for the receiveq.
> +
> +The device has the allowance for the speed. If
> +VIRTIO_NET_F_SPEED_DUPLEX has been negotiated, the driver can get this
> +by \field{speed}. When the received packets rate exceeds the
> +\field{speed}, some packets may be dropped by the device.

For 100Gbps speed, at 1500 bytes, 'packet rate' is roughly 8 mpps.
So what you wanted to say here is the packet bit rate instead of packet rat=
e.

Please change from packet rate to packet bitrate.

> +\devicenormative{\subparagraph}{Device Statistics}{Device Types /
> +Network Device / Device Operation / Control Virtqueue / Device
> +Statistics} The device MUST replies to the command
s/replies/reply

I think you want to add the line,=20
When feature bit F_STATS is negotiated, the device MUST reply ...

> +VIRTIO_NET_CTRL_STATS_QUERY with the \field{struct
> virtio_net_stats_capabilities}. \field{supported_stats_types} includes al=
l the
> statistic types supported by the device.
> +
> +If \field{struct virtio_net_ctrl_queue_stats} is incorrect (such as the
> +following), the device MUST set \field{ack} to VIRTIO_NET_ERR. Even if
> +there is only one error, the device MUST fail the entire command.
> +\begin{itemize}
> +    \item \field{vq_index} exceeds the queue range.
> +    \item \field{types_bitmap} contains unknown types.
> +    \item One or more of the bits present in \field{types_bitmap} is not=
 valid
> +        for the specified virtqueue.
> +    \item The feature corresponding to the specified \field{types_bitmap=
} was
> +        not negotiated.
> +    \item The size of the buffer allocated by the driver for \field{comm=
and-
> specific-result}
> +        is less than the total size of the statistics specialed by
> +        \field{struct virtio_net_ctrl_queue_stats}.
> +\end{itemize}
> +
> +The device MUST set the actual size of the space occupied by the reply
s/space/bytes

> +to the \field{size} of the \field{hdr}. And the device MUST set the
> +\field{type} and the \field{vq_index} of the statistic header.
> +
> +\drivernormative{\subparagraph}{Device Statistics}{Device Types /
> +Network Device / Device Operation / Control Virtqueue / Device
> +Statistics}
> +
> +The types contained in the \field{types_bitmap} MUST be queried from
> +the device via command VIRTIO_NET_CTRL_STATS_QUERY.
> +
> +\field{types_bitmap} in \field{struct virtio_net_ctrl_queue_stats} MUST
> +be valid to the vq specified by \field{vq_index}.
> +
> +The \field{command-specific-result} buffer allocated by the driver MUST
> +be able to hold all the statistics specified by \field{struct
> +virtio_net_ctrl_queue_stats}.
> +
This may not be true when we consider backward compatibility.
For example, driver of 1.4 will allocate 100 bytes and device follows spec =
1.5 which may be returning another additional 150 bytes.

So it should be rephrased as,

The \field{command-specific-result} buffer allocated by the driver may be s=
maller or bigger than all the statistics specified by=20
\field{struct virtio_net_ctrl_queue_stats}. The device MUST fill up only up=
to the valid bytes.

I think you need to also add driver requirement that buffer should be at le=
ast aligned to the size of the reply header so that there is no partial ent=
ry in response.



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

