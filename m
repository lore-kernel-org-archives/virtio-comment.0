Return-Path: <virtio-comment-return-6914-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B985C001DC
	for <virtio-comment@archiver.kernel.org>; Sat, 29 Jul 2023 23:28:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C0C2F42C2A
	for <virtio-comment@archiver.kernel.org>; Sat, 29 Jul 2023 23:28:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A67CD986851
	for <virtio-comment@archiver.kernel.org>; Sat, 29 Jul 2023 23:28:58 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 95FE69840BC; Sat, 29 Jul 2023 23:28:58 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 83FBC98680A
	for <virtio-comment@lists.oasis-open.org>; Sat, 29 Jul 2023 23:28:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KESx5Dr73Cb8yhgLoy+Yoee3S+myYdfkY8y85n3eWQU+yq04dZnPLtFRtityDo/N3ECmNfwv3qkA5HtM1ND09qakHUVLPbpQy90G4LJczx2AQ8zTYNw/Y1BVc3lNeiq74d9poEATlacuy/L+U/ZT3fHA6+dvq/KOy1Hd/PRYp6FoKVNdtFYwSzpm+FoD2AZZj2JfT9mySr/FYFaBvIU1eSW7kK8eOJoVSsakXMse0RdtUyP5SeFiACxgBKvqr3jT8IRouxn0AmfrjgIoU4EJdy+y/MVzwqiZTQRD189/Cwwr9l6/Cw+TZ8pAYKmoQ2RltRqp6kY1FwzG6CKAW3N1QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X4Rkgo55yHqGboJXI+JJeDu4iFgZBWz0ZaMo6jO7Zz0=;
 b=R07D0+WRKJ2FpfrLx7Ls1W0VjBDwFi/esyF/7qc5OipUuEKxO4lPOiqVP6B3MCxMom1xJ3NIgnXT8L28mibcjboeKMKGTLDpbcJ3N120Z4FeMZXmolxr+ThM1GEdEuEGZWrbFqFVcF86CHhiz/eY4KNnO4pfFFrkTK/JtkGo6zA44U8orPT9Pn7kuMPCG0mOM+HjYQjEc6UPQxoVBg3kRCsFl1hqGPA9kdU/inZPriiWrDCVx7yMZQzeQ9pU8A7MiLNagaB8d9O/jHel/3Q7lmZl0JmW6Fc11MeNROgK3NHsNi5dec8QsmOBy0N/STxXHHy6PaQUO7+vWOLw4VPpDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: zhenwei pi <pizhenwei@bytedance.com>
CC: Stefan Hajnoczi <stefanha@redhat.com>,
        "parav@nvidia.com"
	<parav@nvidia.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang
	<jasowang@redhat.com>,
        "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>,
        "houp@yusur.tech" <houp@yusur.tech>,
        "helei.sig11@bytedance.com" <helei.sig11@bytedance.com>,
        "zhouhuaping.san@bytedance.com" <zhouhuaping.san@bytedance.com>,
        "xinhao.kong@duke.edu" <xinhao.kong@duke.edu>
Thread-Topic: [virtio-comment] [PATCH v4 4/7] transport-fabrics: introduce
 command set
Thread-Index: AQHZwnRfGoxCPA3rB0yMn5/jURvHMw==
Date: Sat, 29 Jul 2023 23:28:25 +0000
Message-ID: <F0CEEC0A-4087-4BAF-B0AB-E56EF078457D@nutanix.com>
References: <20230626072551.1709389-1-pizhenwei@bytedance.com>
 <20230626072551.1709389-5-pizhenwei@bytedance.com>
In-Reply-To: <20230626072551.1709389-5-pizhenwei@bytedance.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR02MB7938:EE_|SJ0PR02MB7280:EE_
x-ms-office365-filtering-correlation-id: cb8a602e-b52f-421d-8a42-08db908b81d3
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 AJS6wk+XBrMZYdNp/MCvLNS85KKwW1f7w3jz5+ky6JxhULqGBCCgYUvTpl+z2grl5CRvkCPXx3YTxXq7tUjgpsIJOGoACRfifUYBJK/yB/IJ03UCuBTyGaIEp6ayjvZWZGA8sA85c7kBrWRRVAh1NKLHHwN/4a/OEEVDIa/9jCw8RgT6N7p8IHTJzfqHvONZkxlNslp1bGcyF2WMo3Z+X920XjCLlU9qscEv7xV+omCfJIxRaNNfHkHUslKnGIc1Q4qgSxjv+glY/mq4RTZpZFnUGvV0fafK7unXOEBXDUM6mr3lryHHabh2VsIY3Q39cILfJ0LHe/DM/TuLd9XhRHql7tPyz2Lk8/doNVKgG4EmNo14+nkh4KsGcyhyjrzv7VIamQ5gvOgxVO5/muLF6KC8XF9JRd64bdUClyYE6ASeVIBHUp1qTnKhUaRNnhYd3kc1+v9ZCZ3IJXQkot77Kwqo8dFiZN0KQ2ToahJAY63Re6BBW4tOyyOyhS+I/VoW7lKofMv1+PsPnS+ZeVefusQnYgk/eWPD1mm/hVWBkyV1LbtbI2m8M1AwmIjQQhrH1EotNstSCdsUGp1HH/wujHA21+JS8KOG2pieTs4npMlGDFqg0mQOFbG4PSBv/rOlZoEVjxWOY04mF/lEd2ZRaA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR02MB7938.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(346002)(376002)(136003)(396003)(451199021)(66899021)(316002)(2906002)(8676002)(8936002)(7416002)(5660300002)(38070700005)(41300700001)(44832011)(33656002)(30864003)(36756003)(86362001)(6486002)(71200400001)(122000001)(54906003)(966005)(6506007)(478600001)(26005)(53546011)(186003)(76116006)(66946007)(66556008)(83380400001)(38100700002)(6512007)(66476007)(64756008)(66446008)(4326008)(2616005)(6916009)(45980500001)(559001)(579004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?uPfGHyPedoZchXgD6DZNQTaAcAZ6fwZMuHFq/uiGk/6ReT+C+GPOi7jK2eiG?=
 =?us-ascii?Q?kmaQvURDNJOQNRh3sLTl8DQNplp45SufEigwME5Kss6whuPBAMP6oKvQn4dk?=
 =?us-ascii?Q?I96V5KjoTIEu5/+gMjjPyTQUxPwg9Fisl5KS3DrtgZUpE93YG1q3YxxC854Y?=
 =?us-ascii?Q?fao5C41PhNM88v9zSBUIipyT2Jb8xlwWYdDQjn846NmLwb8RLjPVxYMoIK4O?=
 =?us-ascii?Q?7mMDC/usxLR/umsk2kMa9fu0MifEvlQ0fDCbzfK2HB6InQoGjGYDgq20phTS?=
 =?us-ascii?Q?edItYOgtSzmexZA+RpMwskLYkAFbAMjI92k74K4Hafr9TH3/MmcQcf4Anlgi?=
 =?us-ascii?Q?N+K50dzGt2Cfd8S5qC0HQrRhvyAYi5m8LoUV60bDb73pxXDRZrHR65h1UMAg?=
 =?us-ascii?Q?Z7hJgw8XYDiObSUdFjE2NH0O+J14Ofw/TM4qp7uvPmMAOktHQVhdM6h5U0b+?=
 =?us-ascii?Q?WNf6T2u0vzPYja3LiiaUbBxYT9OiMXYSL3Z3icAB3Z4+A1kblZ/9c+eZ+L3S?=
 =?us-ascii?Q?At09A8qDORu6HvJZ7C4L2xBmX6QLUgMrEpZBBGWTPXAlvbl4tnC1s84PH5k+?=
 =?us-ascii?Q?Dzhxwh5P3MieuY655kwzv9r7bWhotVw+Wl1xOGBcedNrs1qY5OzhqaLVji6y?=
 =?us-ascii?Q?OQ3StmGGVm28BYs1NySheoJuoqy6vBFfuVYc2aGOZGKMOLqhc0fe4zfQSA9d?=
 =?us-ascii?Q?XWjv4WzQ3jdOsJJGErs7JWATqBeFavIwuWFplUOByInmUORzQ8no4/m3qgR6?=
 =?us-ascii?Q?X/K3zi1ZxmO/Tv3ueoPp2c3pJHztcP4t7POJ1HBlMixyGhGUvnfJxI7L1pGv?=
 =?us-ascii?Q?9G8QO+FIEL5ag3xD5pKsxrSEOMLlVFaxdj8zeDzuPu6tMPBZjfpqkOdkKUht?=
 =?us-ascii?Q?+ITGHJ5w/p5ZYhtL/miBhPv+07WF3N1jFAAOU0ojCgL20W4LVAz7bwlJafTd?=
 =?us-ascii?Q?9CubHOCrSz52/FaM7pd1hzVbCkImVofPfeit1tPQoIcE/baqZtUdesZqFw66?=
 =?us-ascii?Q?ygX3+tuLwNoVdiR6kUM8HC58vUxwsTlAdGH7jzvqouvwn/HxtE0mwIFS1TKr?=
 =?us-ascii?Q?dpCaUidG+0myd6Wjr9xRrlK4Bz+w5lJye2/YJ/y1e2CwnB9hxF+1paEpTEeY?=
 =?us-ascii?Q?ztFuLnUjpTKtbYPQuTAhwyIBE6uIxn+cmRG/chtAolkJX9iI8NN2HXXhAgIt?=
 =?us-ascii?Q?PSTtUWJJ5aKAy7A2aDRU81Dv0KHs1n3n8dQjsSnInlhUvACr1+nKq218wAi/?=
 =?us-ascii?Q?UIrpKx3afFOoavcMiXH4400oI3zGTSJuThdoYpNRum7Z1M8iaLtHHd+ucRGK?=
 =?us-ascii?Q?okm8bYFxhQPGVd1eFxJ4lzWocuU8elJwf15W/DJw+G+OPDc5EQ3ds2XXSEV/?=
 =?us-ascii?Q?ufDJ3TzU1hodC7L4vAYPmNbEWsKKG8u9Clls3Dsf6QSqnm3uSihkspSdnrT+?=
 =?us-ascii?Q?2dccsO27YQ1s/MvQh9fJTEsFdQZB0rS532jj3TbBaWZY3d8Qx73rILJQ/OKq?=
 =?us-ascii?Q?WrGpjsAasJIm6dpe3GjXpH00aG2QhcpNzlW0rnrzdrff+MxnURS/8KuwZ5sC?=
 =?us-ascii?Q?1OnX/nwvOda/dM0kNFgSWYRok/1hop7kXgs1V0UP7WmAhn33xwreuNMFmEJF?=
 =?us-ascii?Q?mw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4DABB92D3242E740B4E98B22D5D3A744@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb8a602e-b52f-421d-8a42-08db908b81d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2023 23:28:25.4806
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fGfznqxFDmCDLvWAOz9aQfQ3UT2gFhXgxhFDoZgLk0YMCeXXrXBxrR12ZzZZmc3qegHbEv7c5x4+VfAWPggNLg6AtyZyNgIBRPTUZX0ABNc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7280
X-Proofpoint-GUID: 8DBwvXsYYnaZA-Z5LZhMTmteRyqMGZEt
X-Proofpoint-ORIG-GUID: 8DBwvXsYYnaZA-Z5LZhMTmteRyqMGZEt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Reason: safe
Subject: Re: [virtio-comment] [PATCH v4 4/7] transport-fabrics: introduce
 command set

As noted in my high level feedback I think the protocol should have redirec=
tion semantics.

> On Jun 26, 2023, at 3:25 AM, zhenwei pi <pizhenwei@bytedance.com> wrote:
>=20
> Introduce command set for Virtio-oF which includes:
> - command id: a tag to distinguish in-flight commands
> - status: indicate the result of a Virtio-oF command
> - opcodes: the Virtio-oF transport layer commands use 0x0000-0x0fff,
>          and the device layer commands use 0x1000-0xffff.
> 	  get/set status/feature/ config use consecutive number.
>=20
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
> transport-fabrics.tex | 616 ++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 616 insertions(+)
>=20
> diff --git a/transport-fabrics.tex b/transport-fabrics.tex
> index d562b2c..3fd9e8e 100644
> --- a/transport-fabrics.tex
> +++ b/transport-fabrics.tex
> @@ -113,3 +113,619 @@ \subsubsection{Keyed Data Transfers}\label{sec:Virt=
io Transport Options / Virtio
>      |COMP|     |COMP|     |COMP|
>      +----+     +----+     +----+
> \end{lstlisting}
> +
> +
> +\subsection{Commands Definition}\label{sec:Virtio Transport Options / Vi=
rtio Over Fabrics / Commands Definition}
> +This section defines data structures, opcodes, and status for Virtio-oF.
> +A Virtio-oF command is fixed to 16 bytes, and a Virtio-oF completion is =
fixed to 16 bytes.
> +Note that the reserved fields of Virtio-oF commands and completions are =
filled with zero.
> +
> +\subsubsection{Command ID}\label{sec:Virtio Transport Options / Virtio O=
ver Fabrics / Commands Definition / Command ID}
> +The Command ID (le16 type) is used to uniquely describe a Virtio-oF PDU =
for identification.
> +Generally, the Virtio-oF initiator allocates a Command ID that is unique=
 for all in-flight commands,
> +and the Virtio-oF target specifies the same Command ID for completion.
> +
> +Command IDs 0xff00 - 0xffff are reserved for the Virtio-oF control queue=
 asynchronous events.
> +The reserved Command IDs for the Virtio-oF control queue are as follows:
> +
> +\begin{tabular}{ |l|l| }
> +\hline
> +Command ID & Description \\
> +\hline \hline
> +0xfffe & Config change. Causes the initiator to generate a configuration=
 change notification \\
> +\hline
> +0xffff & Keepalive. The initiator ignores this event \\
> +\hline
> +0xff00 - 0xfffd & Reserved \\
> +\hline
> +\end{tabular}
> +
> +\subsubsection{Status}\label{sec:Virtio Transport Options / Virtio Over =
Fabrics / Commands Definition / Status}
> +The Status (le16 type) of a Virtio-oF completion is used to indicate the=
 result of a Virtio-oF command in detail.
> +The status values are defined as follows:
> +
> +\begin{lstlisting}
> +/* command executed successfully */
> +#define VIRTIO_OF_STATUS_SUCCESS       0x0000
> +
> +/* unrecognized command, or disabled command due to unsupported feature =
*/
> +#define VIRTIO_OF_STATUS_ENOCMD        0x0001
> +/* in-flight commands exceeded queue size */
> +#define VIRTIO_OF_STATUS_ECMDQUOT      0x0002
> +
> +/* no such target specified by TVQN */
> +#define VIRTIO_OF_STATUS_ENOTGT        0x1001
> +/* failed to create Virtio-oF device instance */
> +#define VIRTIO_OF_STATUS_ENODEV        0x1002
> +/* rejected due to access control */
> +#define VIRTIO_OF_STATUS_EACLREJECTED  0x1003
> +/* bad Virtio-oF device instance ID */
> +#define VIRTIO_OF_STATUS_EBADDEV       0x1010
> +/* mismatched TVQN or IVQN from Virtio-oF device instance */
> +#define VIRTIO_OF_STATUS_EBADVQN       0x1011
> +/* Virtio-oF virtqueue index exceeded */
> +#define VIRTIO_OF_STATUS_EQUEUEQUOT    0x1020
> +/* Virtio-oF virtqueue size exceeded */
> +#define VIRTIO_OF_STATUS_EQSIZEQUOT    0x1021
> +
> +/* unsupported Virtio-oF feature */
> +#define VIRTIO_OF_STATUS_EFEATURE      0x2000
> +/* unsupported Virtio-oF device instance status */
> +#define VIRTIO_OF_STATUS_ESTATUS       0x2010
> +/* unsupported Virtio-oF device instance feature */
> +#define VIRTIO_OF_STATUS_EDEVFEATURE   0x2020
> +/* unsupported offset of device configuration space */
> +#define VIRTIO_OF_STATUS_ECONFOFF      0x2030
> +/* unsupported bytes of device configuration space */
> +#define VIRTIO_OF_STATUS_ECONFBYTES    0x2031
> +/* failed to read device-readable virtqueue buffers */
> +#define VIRTIO_OF_STATUS_EOUTVQBUF     0x20f0
> +/* failed to write device-writable virtqueue buffers */
> +#define VIRTIO_OF_STATUS_EINVQBUF      0x20f1
> +\end{lstlisting}
> +
> +\subsubsection{Opcodes}\label{sec:Virtio Transport Options / Virtio Over=
 Fabrics / Commands Definition / Opcodes}
> +Opcodes (u16 type) of Virtio-oF Commands are as follows:
> +
> +\begin{lstlisting}
> +#define virtio_of_op_connect               0x0000
> +#define virtio_of_op_disconnect            0x0001
> +#define virtio_of_op_keepalive             0x0002
> +#define virtio_of_op_get_feature           0x0004
> +#define virtio_of_op_set_feature           0x0005
> +#define virtio_of_op_get_keyed_num_descs   0x0100
> +#define virtio_of_op_vq                    0x0fff
> +#define virtio_of_op_get_vendor_id         0x1000
> +#define virtio_of_op_get_device_id         0x1001
> +#define virtio_of_op_reset_device          0x1003
> +#define virtio_of_op_get_status            0x1004
> +#define virtio_of_op_set_status            0x1005
> +#define virtio_of_op_get_device_feature    0x1006
> +#define virtio_of_op_set_driver_feature    0x1009
> +#define virtio_of_op_get_vq_size           0x100a
> +#define virtio_of_op_get_config            0x100c
> +#define virtio_of_op_set_config            0x100d
> +\end{lstlisting}
> +
> +\paragraph{Connect Command}\label{sec:Virtio Transport Options / Virtio =
Over Fabrics / Commands Definition / Opcodes / Connect Command}
> +

This would be a good place to introduce some kind of target-side redirect m=
echanism to support redirecting to another IP.

Probably just another op/status code and message from the target for redire=
ction?

> +The Connect Command is used to establish a Virtio-oF queue for both the =
Virtio-oF control queue and Virtio-oF virtqueue, it is always the first com=
mand to execute on a Virtio-oF queue.
> +
> +The structure of the Connect Command structure is as follows:
> +\begin{lstlisting}
> +struct virtio_of_command_connect {
> +        /* opcode is virtio_of_op_connect */
> +        le16 opcode;
> +        /* unique ID for all in-flight commands */
> +        le16 command_id;
> +        /* Virtio-oF device instance ID. 0xffff is reserved for the Virt=
io-oF control queue */
> +        le16 device_instance_id;
> +        /* used by Virtio-oF virtqueue only, equal to virtqueue index */
> +        le16 vq_index;
> +        /* the length of the Connect Body */
> +        le32 length;
> +#define VIRTIO_OF_CONTROL_QUEUE_SIZE 32
> +        /* the size of a Virtio-oF queue, 0 means the maximum queue size=
 supported */
> +        le16 queue_size;
> +        u8 reserved[2];
> +};
> +\end{lstlisting}
> +
> +The structure of the Connect Body is as follows:
> +\begin{lstlisting}
> +struct virtio_of_connect {
> +        /* Virtio-oF initiator VQN */
> +        u8 ivqn[256];
> +        /* Virtio-oF target VQN */
> +        u8 tvqn[256];
> +        u8 reserved[512];
> +};
> +\end{lstlisting}
> +
> +The structure of the Connect Completion is as follows:
> +\begin{lstlisting}
> +struct virtio_of_completion_connect {
> +        le16 status;
> +        le16 command_id;
> +        /* Virtio-oF device instance ID */
> +        le16 device_instance_id;
> +        u8 reserved[10];
> +};
> +\end{lstlisting}
> +
> +The Connect Command, Body, and Completion have the following usages:
> +\begin{itemize}
> +\item The Virtio-oF initiator specifies \texttt{device_instance_id} of 0=
xffff in the Connect command
> +and Virtio-oF initiator/target VQN in the Connect Body to establish the =
Virtio-oF control queue first.
> +\item The Virtio-oF target allocates any available ID for a newly create=
d Virtio-oF device instance,
> +and specifies the \texttt{device_instance_id} of the new Virtio-oF devic=
e instance ID in the Connect Completion.
> +\item The Virtio-oF initiator specifies the Virtio-oF device instance ID=
 and \texttt{vq_index} to establish Virtio-oF virtqueues one by one.
> +The Connect Body is optional for the Virtio-oF virtqueues, once a Virtio=
-oF virtqueue issues a Connect Command without Connect Body, the Virtio-oF =
virtqueue uses the same Connect Body as the Virtio-oF control queue.
> +\end{itemize}
> +
> +\paragraph{Disconnect Command}\label{sec:Virtio Transport Options / Virt=
io Over Fabrics / Commands Definition / Opcodes / Disconnect Command}
> +
> +The Disconnect Command is used to gracefully disconnect both the Virtio-=
oF control queue and Virtio-oF virtqueue. All in-flight commands are comple=
ted upon receipt of the Disconnect Completion.
> +
> +The structure of the Disconnect Command structure is as follows:
> +\begin{lstlisting}
> +struct virtio_of_command_disconnect {
> +        /* opcode is virtio_of_op_disconnect */
> +        le16 opcode;
> +        /* unique ID for all in-flight commands */
> +        le16 command_id;
> +        u8 reserved[12];
> +};
> +\end{lstlisting}
> +
> +The structure of the Disconnect Completion is as follows:
> +\begin{lstlisting}
> +struct virtio_of_completion_disconnect {
> +        le16 status;
> +        le16 command_id;
> +        u8 reserved[12];
> +};
> +\end{lstlisting}
> +
> +The Disconnect Command and Completion have the following usages:
> +\begin{itemize}
> +\item The Virtio-oF initiator should disconnect the Virtio-oF virtqueues=
 before the Virtio-oF control queue.
> +\item Once the Virtio-oF control queue is disconnected, the Virtio-oF de=
vice instance and associated resources should be destroyed.
> +\item If the underlying transport connection of a Virtio-oF queue is dis=
connected without issuing the Disconnect Command, the in-flight commands ar=
e not guaranteed to execute successfully.
> +\end{itemize}
> +
> +\paragraph{Keepalive Command}\label{sec:Virtio Transport Options / Virti=
o Over Fabrics / Commands Definition / Opcodes / Keepalive Command}
> +The Keepalive Command is used as a health check mechanism to detect when=
 a Virtio-oF device instance becomes unavailable, it is used for the Virtio=
-oF control queue only.
> +Once the Virtio-oF device instance becomes unavailable, the initiator sh=
ould disconnect all the Virtio-oF queues and release associated resources.
> +
> +The structure of the Keepalive Command structure is as follows:
> +\begin{lstlisting}
> +struct virtio_of_command_keepalive {
> +        /* opcode is virtio_of_op_keepalive */
> +        le16 opcode;
> +        /* unique ID for all in-flight commands */
> +        le16 command_id;
> +        u8 reserved[12];
> +};
> +\end{lstlisting}
> +
> +The structure of the Keepalive Completion is as follows:
> +\begin{lstlisting}
> +struct virtio_of_completion_keepalive {
> +        le16 status;
> +        le16 command_id;
> +        u8 reserved[12];
> +};
> +\end{lstlisting}
> +
> +\paragraph{Get Feature Command}\label{sec:Virtio Transport Options / Vir=
tio Over Fabrics / Commands Definition / Opcodes / Get Feature Command}
> +The Get Feature Command is used to get feature bits of a Virtio-oF devic=
e instance for the Virtio-oF control queue only.
> +
> +The structure of the Get Feature Command structure is as follows:
> +\begin{lstlisting}
> +struct virtio_of_command_get_feature {
> +        /* opcode is virtio_of_op_get_feature */
> +        le16 opcode;
> +        /* unique ID for all in-flight commands */
> +        le16 command_id;
> +        /* value 0x0 selects feature bits 0 to 63, 0x1 selects feature b=
its 64 to 127, etc */
> +        le32 feature_select;
> +        u8 reserved[8];
> +};
> +\end{lstlisting}
> +
> +The structure of the Get Feature Completion is as follows:
> +\begin{lstlisting}
> +struct virtio_of_completion_get_feature {
> +        le16 status;
> +        le16 command_id;
> +        u8 reserved[4];
> +        /* feature bits */
> +        le64 feature;
> +};
> +\end{lstlisting}
> +
> +The feature bits of a Virtio-oF device instance are as follows:
> +\begin{lstlisting}
> +/* support virtio_of_op_get_keyed_num_descs to get the maximum number of=
 keyed descriptors */
> +#define VIRTIO_OF_F_KEYED_NUM_DESCS            0
> +\end{lstlisting}
> +
> +\paragraph{Set Feature Command}\label{sec:Virtio Transport Options / Vir=
tio Over Fabrics / Commands Definition / Opcodes / Set Feature Command}
> +The Set Feature Command is used to set the feature bits of a Virtio-oF d=
evice instance for the Virtio-oF control queue only.
> +
> +The structure of the Set Feature Command structure is as follows:
> +\begin{lstlisting}
> +struct virtio_of_command_set_feature {
> +        /* opcode is virtio_of_op_set_feature */
> +        le16 opcode;
> +        /* unique ID for all in-flight commands */
> +        le16 command_id;
> +        /* value 0x0 selects feature bits 0 to 63, 0x1 selects feature b=
its 64 to 127, etc */
> +        le32 feature_select;
> +        /* feature bits */
> +        le64 feature;
> +};
> +\end{lstlisting}
> +
> +The structure of the Set Feature Completion is as follows:
> +\begin{lstlisting}
> +struct virtio_of_completion_set_feature {
> +        le16 status;
> +        le16 command_id;
> +        u8 reserved[12];
> +};
> +\end{lstlisting}
> +
> +Note: it is recommended that the
> +\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Commands D=
efinition / Opcodes / Get Feature Command}
> +and Set Feature Command should be executed upon the establishment of the=
 Virtio-oF control queue for feature negotiation.
> +However, they are allowed to be executed during the Virtio-oF control qu=
eue lifecycle.
> +
> +\paragraph{Get Keyed Number Descriptors Command}\label{sec:Virtio Transp=
ort Options / Virtio Over Fabrics / Commands Definition / Opcodes / Get Key=
ed Number Descriptors Command}
> +The Get Keyed Number Descriptors Command is used to get the maximum numb=
er of keyed descriptors of Virtio-oF virtqueues, it is executed on the Virt=
io-oF control queue.
> +
> +The structure of the Get Keyed Number Descriptors Command structure is a=
s follows:
> +\begin{lstlisting}
> +struct virtio_of_command_get_keyed_num_descs {
> +        /* opcode is virtio_of_op_get_keyed_num_descs */
> +        le16 opcode;
> +        /* unique ID for all in-flight commands */
> +        le16 command_id;
> +        u8 reserved[12];
> +};
> +\end{lstlisting}
> +
> +The structure of the Get Keyed Number Descriptors Completion is as follo=
ws:
> +\begin{lstlisting}
> +struct virtio_of_completion_get_keyed_num_descs {
> +        le16 status;
> +        le16 command_id;
> +        /* the maximum number of keyed descriptors */
> +        u8 descs;
> +        u8 reserved[11];
> +};
> +\end{lstlisting}
> +
> +\paragraph{VQ Command}\label{sec:Virtio Transport Options / Virtio Over =
Fabrics / Commands Definition / Opcodes / VQ Command}
> +The VQ Command is used to transmit virtqueue buffers for Virtio-oF virtq=
ueue only.
> +
> +The structure of the VQ Command structure is as follows:
> +\begin{lstlisting}
> +struct virtio_of_command_vq {
> +        /* opcode is virtio_of_op_vq */
> +        le16 opcode;
> +        /* unique ID for all in-flight commands */
> +        le16 command_id;
> +        u8 reserved[4];
> +        /* the length of device-readable virtqueue buffers */
> +        le32 out_length;
> +        /* the length of device-writable virtqueue buffers */
> +        le32 in_length;
> +};
> +\end{lstlisting}
> +
> +The structure of the VQ Completion is as follows:
> +\begin{lstlisting}
> +struct virtio_of_completion_vq {
> +        le16 status;
> +        le16 command_id;
> +        /* the length of virtqueue buffers from Virtio-oF target */
> +        le32 length;
> +        u8 reserved[8];
> +};
> +\end{lstlisting}
> +
> +For \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Protoc=
ol Data Unit/ Stream Data Transfers},
> +\texttt{out_length} of virtio_of_command_vq describes the following byte=
s in a request Virtio-oF PDU,
> +and \texttt{length} of virtio_of_completion_vq describes the following b=
ytes in a response Virtio-oF PDU.
> +
> +For \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Protoc=
ol Data Unit/ Keyed Data Transfers},
> +there are 1 or more keyed descriptors (virtio_of_keyed_desc type) in a r=
equest Virtio-oF PDU to describe the virtqueue buffers of \texttt{out_lengt=
h + in_length} bytes,
> +and \texttt{length} of virtio_of_completion_vq describes the number of b=
ytes written into the device writable portion of the buffer described by th=
e keyed descriptors.
> +
> +\paragraph{Get Vendor ID Command}\label{sec:Virtio Transport Options / V=
irtio Over Fabrics / Commands Definition / Opcodes / Get Vendor ID Command}
> +The Get Vendor ID Command is used to get the Virtio Vendor ID of a Virti=
o-oF device instance for the Virtio-oF control queue only.
> +
> +The structure of the Get Vendor ID Command structure is as follows:
> +\begin{lstlisting}
> +struct virtio_of_command_get_vendor_id {
> +        /* opcode is virtio_of_op_get_vendor_id */
> +        le16 opcode;
> +        /* unique ID for all in-flight commands */
> +        le16 command_id;
> +        u8 reserved[12];
> +};
> +\end{lstlisting}
> +
> +The structure of the Get Vendor ID Completion is as follows:
> +\begin{lstlisting}
> +struct virtio_of_completion_get_vendor_id {
> +        le16 status;
> +        le16 command_id;
> +        /* Virtio Vendor ID */
> +        le32 vendor_id;
> +        u8 reserved[8];
> +};
> +\end{lstlisting}
> +
> +\paragraph{Get Device ID Command}\label{sec:Virtio Transport Options / V=
irtio Over Fabrics / Commands Definition / Opcodes / Get Device ID Command}
> +The Get Device ID Command is used to get the Virtio Device ID of a Virti=
o-oF device instance for the Virtio-oF control queue only.
> +
> +The structure of the Get Device ID Command structure is as follows:
> +\begin{lstlisting}
> +struct virtio_of_command_get_device_id {
> +        /* opcode is virtio_of_op_get_device_id */
> +        le16 opcode;
> +        /* unique ID for all in-flight commands */
> +        le16 command_id;
> +        u8 reserved[12];
> +};
> +\end{lstlisting}
> +
> +The structure of the Get Device ID Completion is as follows:
> +\begin{lstlisting}
> +struct virtio_of_completion_get_device_id {
> +        le16 status;
> +        le16 command_id;
> +        /* Virtio Device ID */
> +        le32 device_id;
> +        u8 reserved[8];
> +};
> +\end{lstlisting}
> +
> +\paragraph{Reset Device Command}\label{sec:Virtio Transport Options / Vi=
rtio Over Fabrics / Commands Definition / Opcodes / Reset Device Command}
> +The Reset Device Command is used to reset a Virtio-oF device instance fo=
r the Virtio-oF control queue only.
> +
> +The structure of the Reset Device Command structure is as follows:
> +\begin{lstlisting}
> +struct virtio_of_command_reset_device {
> +        /* opcode is virtio_of_op_get_device_id */
> +        le16 opcode;
> +        /* unique ID for all in-flight commands */
> +        le16 command_id;
> +        u8 reserved[12];
> +};
> +\end{lstlisting}
> +
> +The structure of the Reset Device Completion is as follows:
> +\begin{lstlisting}
> +struct virtio_of_completion_reset_device {
> +        le16 status;
> +        le16 command_id;
> +        u8 reserved[12];
> +};
> +\end{lstlisting}
> +
> +\paragraph{Get Status Command}\label{sec:Virtio Transport Options / Virt=
io Over Fabrics / Commands Definition / Opcodes / Get Status Command}
> +The Get Status Command is used to get the status of a Virtio-oF device i=
nstance for the Virtio-oF control queue only.
> +
> +The structure of the Get Status Command structure is as follows:
> +\begin{lstlisting}
> +struct virtio_of_command_get_status {
> +        /* opcode is virtio_of_op_get_status */
> +        le16 opcode;
> +        /* unique ID for all in-flight commands */
> +        le16 command_id;
> +        u8 reserved[12];
> +};
> +\end{lstlisting}
> +
> +The structure of the Get Status Completion is as follows:
> +\begin{lstlisting}
> +struct virtio_of_completion_get_status {
> +        le16 status;
> +        le16 command_id;
> +        /* status of the Virtio-oF device instance */
> +        le32 dev_status;
> +        u8 reserved[8];
> +};
> +\end{lstlisting}
> +
> +\paragraph{Set Status Command}\label{sec:Virtio Transport Options / Virt=
io Over Fabrics / Commands Definition / Opcodes / Set Status Command}
> +The Set Status Command is used to set the status of a Virtio-oF device i=
nstance for the Virtio-oF control queue only.
> +
> +The structure of the Set Status Command structure is as follows:
> +\begin{lstlisting}
> +struct virtio_of_command_set_status {
> +        /* opcode is virtio_of_op_set_status */
> +        le16 opcode;
> +        /* unique ID for all in-flight commands */
> +        le16 command_id;
> +        /* status of the Virtio-oF device instance */
> +        le32 status;
> +        u8 reserved[8];
> +};
> +\end{lstlisting}
> +
> +The structure of the Set Status Completion is as follows:
> +\begin{lstlisting}
> +struct virtio_of_completion_set_status {
> +        le16 status;
> +        le16 command_id;
> +        u8 reserved[12];
> +};
> +\end{lstlisting}
> +
> +\paragraph{Get Device Feature Command}\label{sec:Virtio Transport Option=
s / Virtio Over Fabrics / Commands Definition / Opcodes / Get Device Featur=
e Command}
> +The Get Device Feature Command is used to get virtio device feature bits=
 of a Virtio-oF device instance for the Virtio-oF control queue only.
> +
> +The structure of the Get Device Feature Command structure is as follows:
> +\begin{lstlisting}
> +struct virtio_of_command_get_device_feature {
> +        /* opcode is virtio_of_op_get_device_feature */
> +        le16 opcode;
> +        /* unique ID for all in-flight commands */
> +        le16 command_id;
> +        /* value 0x0 selects feature bits 0 to 63, 0x1 selects feature b=
its 64 to 127, etc */
> +        le32 feature_select;
> +        u8 reserved[8];
> +};
> +\end{lstlisting}
> +
> +The structure of the Get Device Feature Completion is as follows:
> +\begin{lstlisting}
> +struct virtio_of_completion_get_device_feature {
> +        le16 status;
> +        le16 command_id;
> +        u8 reserved[4];
> +        /* feature bits */
> +        le64 feature;
> +};
> +\end{lstlisting}
> +
> +\paragraph{Set Driver Feature Command}\label{sec:Virtio Transport Option=
s / Virtio Over Fabrics / Commands Definition / Opcodes / Set Driver Featur=
e Command}
> +The Set Driver Feature Command is used to set virtio driver feature bits=
 of a Virtio-oF device instance for the Virtio-oF control queue only.
> +
> +The structure of the Set Driver Feature Command structure is as follows:
> +\begin{lstlisting}
> +struct virtio_of_command_set_driver_feature {
> +        /* opcode is virtio_of_op_set_driver_feature */
> +        le16 opcode;
> +        /* unique ID for all in-flight commands */
> +        le16 command_id;
> +        /* value 0x0 selects feature bits 0 to 63, 0x1 selects feature b=
its 64 to 127, etc */
> +        le32 feature_select;
> +        /* feature bits */
> +        le64 feature;
> +};
> +\end{lstlisting}
> +
> +The structure of the Set Driver Feature Completion is as follows:
> +\begin{lstlisting}
> +struct virtio_of_completion_set_driver_feature {
> +        le16 status;
> +        le16 command_id;
> +        u8 reserved[12];
> +};
> +\end{lstlisting}
> +
> +\paragraph{Get VQ Size Command}\label{sec:Virtio Transport Options / Vir=
tio Over Fabrics / Commands Definition / Opcodes / Get VQ Size Command}
> +The Get VQ Size Command is used to get the maximum queue size of a Virti=
o-oF virtqueue for the Virtio-oF control queue only.
> +
> +The structure of the Get VQ Size Command structure is as follows:
> +\begin{lstlisting}
> +struct virtio_of_command_get_vq_size {
> +        /* opcode is virtio_of_op_get_vq_size */
> +        le16 opcode;
> +        /* unique ID for all in-flight commands */
> +        le16 command_id;
> +        /* the Virtio-oF virtqueue index */
> +        le16 vq_index;
> +        u8 reserved[10];
> +};
> +\end{lstlisting}
> +
> +The structure of the Get VQ Size Completion is as follows:
> +\begin{lstlisting}
> +struct virtio_of_completion_get_vq_size {
> +        le16 status;
> +        le16 command_id;
> +        /* size of Virtio-oF virtqueues */
> +        le16 size;
> +        u8 reserved[10];
> +};
> +\end{lstlisting}
> +
> +Note: the Virtio-oF control queue has a fixed queue size, the Virtio-oF =
initiator can specify a smaller Virtio-oF virtqueue size by
> +\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Commands D=
efinition / Opcodes / Connect Command}.
> +
> +\paragraph{Get Config Command}\label{sec:Virtio Transport Options / Virt=
io Over Fabrics / Commands Definition / Opcodes / Get Config Command}
> +The Get Config Command is used to get the device configuration space of =
a Virtio-oF device instance for the Virtio-oF control queue only.
> +
> +The structure of the Get Config Command structure is as follows:
> +\begin{lstlisting}
> +struct virtio_of_command_get_config {
> +        /* opcode is virtio_of_op_get_config */
> +        le16 opcode;
> +        /* unique ID for all in-flight commands */
> +        le16 command_id;
> +        /* offset of device configuration space */
> +        le16 offset;
> +        /* bytes to get, available values: 1, 2, 4, 8 */
> +        u8 bytes;
> +        u8 reserved[9];
> +};
> +\end{lstlisting}
> +
> +The structure of the Get Config Completion is as follows:
> +\begin{lstlisting}
> +struct virtio_of_completion_get_config {
> +        le16 status;
> +        le16 command_id;
> +        /* generation count for the device configuration space */
> +        le32 generation;
> +        /* v is u8, u16, u32, or u64, then: v =3D (typeof v)le64_to_cpu(=
config) */
> +        le64 config;
> +};
> +\end{lstlisting}
> +
> +\paragraph{Set Config Command}\label{sec:Virtio Transport Options / Virt=
io Over Fabrics / Commands Definition / Opcodes / Set Config Command}
> +The Set Config Command is used to set the device configuration space of =
a Virtio-oF device instance for the Virtio-oF control queue only.
> +
> +The structure of the Set Config Command structure is as follows:
> +\begin{lstlisting}
> +struct virtio_of_command_set_config {
> +        /* opcode is virtio_of_op_set_config */
> +        le16 opcode;
> +        /* unique ID for all in-flight commands */
> +        le16 command_id;
> +        /* offset of device configuration space */
> +        le16 offset;
> +        /* bytes to get, available values: 1, 2, 4, 8 */
> +        u8 bytes;
> +        u8 reserved;
> +        /* v is u8, u16, u32, or u64, then: config =3D cpu_to_le64((u64)=
v) */
> +        le64 config;
> +};
> +\end{lstlisting}
> +
> +The structure of the Set Config Completion is as follows:
> +\begin{lstlisting}
> +struct virtio_of_completion_set_config {
> +        le16 status;
> +        le16 command_id;
> +        u8 reserved[12];
> +};
> +\end{lstlisting}
> +
> +\paragraph{Config Change Completion}\label{sec:Virtio Transport Options =
/ Virtio Over Fabrics / Commands Definition / Opcodes / Config Change Compl=
etion}
> +A Config Change Completion is used as a configuration change notificatio=
n of a Virtio-oF device instance for the Virtio-oF control queue only.
> +Note: only a single outstanding Config Change Completion is allowed, the=
 configuration change notification is suppressed until the Virtio-oF initia=
tor issues a
> +\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Commands D=
efinition / Opcodes / Get Config Command}.
> +
> +The structure of the Config Change Completion is as follows:
> +\begin{lstlisting}
> +struct virtio_of_completion_config_change {
> +        le16 status;
> +        /* command_id is 0xfffe */
> +        le16 command_id;
> +        /*  generation count for the device configuration space */
> +        le32 generation;
> +        u8 reserved[8];
> +};
> +\end{lstlisting}
> +
> +\paragraph{Keepalive Completion}\label{sec:Virtio Transport Options / Vi=
rtio Over Fabrics / Commands Definition / Opcodes / Keepalive Completion}
> +A Keepalive Completion is used as a health check mechanism to detect whe=
n a Virtio-oF initiator becomes unavailable, it is used by a Virtio-oF devi=
ce instance for the Virtio-oF control queue only.
> +Once the Virtio-oF initiator becomes unavailable, the Virtio-oF target s=
hould destroy the Virtio-oF device instance and associated resources.
> --=20
> 2.25.1
>=20
>=20
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>=20
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>=20
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
>=20
>=20


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

