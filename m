Return-Path: <virtio-comment-return-9031-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6136FC46CD2
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 06:05:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A162521698
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 06:05:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6B4CF986877
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 06:05:41 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4603D983F76; Tue, 30 Jan 2024 06:05:41 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3D1E1986876
	for <virtio-comment@lists.oasis-open.org>; Tue, 30 Jan 2024 06:05:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zww3uHRbnoQ35drSHgaFjY+NMB8ThBiabG+ty2HjZpFcheoeiibFb/UHSMCU2umtIpucNEorBq1qj0Vu1AyVPiztLfoWp9FX0Xjo9+9HR8b/wdN2teT84bB0fFLciKlok+MLfL8T+5CF8hQ5BKaZ68gmfbaoGIxLMfsJkxxzPYluS1xgD0q0vVI+JSHi7xP9BjbNzs9+d6ZGacxzr7Z6Jaf+MFZbxcB1n97HYB8S/xeS57UUv5myaic3gK4bW6EKoRqyTPKf3wt/I2c8coMm5g1Fnc6DMso0z+2tZOLacsp6dGsdm24x8DAf1rg4cO49XB6eY8m1s7FAl+oUgcJ32A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujQqJ53NJrk9S0XS4vW/MkET9kChaHxiWdHBcVf5i3o=;
 b=P8DJuOTxiv0GmFXFPFNwbipXLtoGT4W/I+bVq0ybJ6v8zDXE2JD9ay0pibutxUiv/5kgwKde6nNMp0I3Y/UPYqtdLeCAe3Dxjs0Z3acOOLRtGa6CwCO35A1b3cHhez0P8tIMzp0rmpQGFINJuxt/Qdb03XNrDlriouduf4lRZwF1hBOYA5LFZ026LMNv7StLYPJFroKDj5UQ6oxJK88ccWomRBN/4bQplDkzUM9VBJGlPeDNkLhgpu8FYBnXs6r1ohzNW7vVmdT8DdAQ5KARNc3hLh2Pt9VgP4ow9uI+caESmktdEC8dee6y2SQWwp4D2dXpMsVCiZQ/DD4qPX28Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Heng Qi <hengqi@linux.alibaba.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
CC: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Thread-Topic: [PATCH v3] virtio-net: support setting coalescing params for
 multiple vqs
Thread-Index: AQHaUzcnrkM0X18jc0WI6GOxP+VtsrDx240g
Date: Tue, 30 Jan 2024 06:05:03 +0000
Message-ID:
 <PH0PR12MB5481B81E2D440B8CD7CBD4A4DC7D2@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <1706589924-3036-1-git-send-email-hengqi@linux.alibaba.com>
In-Reply-To: <1706589924-3036-1-git-send-email-hengqi@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SA1PR12MB6702:EE_
x-ms-office365-filtering-correlation-id: 10e176b9-d903-4918-3582-08dc2159668a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 YsCmvi4f60mT7VMxSNtJE2dSJHT3ve2Z3pj8WKKSgf/5JCY3W0702N//H9a3riu8K2Z1BdJZkaiecvQ2QkLuzZDkwMNRzfXJH/y1+9DqNYA2sqog+XQkA+zQbs9MhIhfJwxmh2xo1yoy9l6OMr7ahBDl5SYosmxbs/YZUq5H51mz1LW4PyTnfM2U2AgtWA33jeh2sNwp0NkpHtEHOnqRy+tyISxbwHj8ynUPP79YigiZGZX6VDgGHXy4vMQCMoX1JE40YxMDunJHqmb93HSzi7mdYr1SeC4n1ed2WeLujwBPgCFO37SJM3nDwbn4hmonw1rFkYNnCAfwYTuChaSpHCQ7MVwuUcZ+qPhZQfhvifMtbY1QAGQvQLsVqVnYkf3ekE6d5Aa5yGFMMyuT99iRcztXPCijpDvXRgZiRWOJ8z7rqWscjtD6bGeOFSXRP0Gb9sgVeKkvrnHBn1N9Xi66t4zr+FAGo4HJF2R8glRaTL6w3owWi5/egTJQ4j2vxpT1WcF1vzpJZuuiTE7YP7f6yBrKJLLA7cDhUy74P5Lh2Qzc5/Rumq7pSc3e/s/ocFcV4iO9kMzqHNLkqbtH77WjlweWqTYwBusGDwRtOweGAXVzTwit1WH+OLf4hxE/JKsG+xRibzhLSGceAivNbdk+9bo7SGZH9HrDs39KlWquQH4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(366004)(396003)(39860400002)(136003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(83380400001)(966005)(2906002)(5660300002)(38100700002)(122000001)(66556008)(66946007)(54906003)(41300700001)(110136005)(316002)(71200400001)(7696005)(4326008)(66476007)(64756008)(52536014)(26005)(8676002)(8936002)(9686003)(66446008)(478600001)(53546011)(76116006)(6506007)(33656002)(86362001)(38070700009)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ifuJGNVX2yMKTIQbl4mFrXT4xh7dI9PpDRGFChjsgomJGViZKPgRp/Y/8Ehv?=
 =?us-ascii?Q?1WmnCY0aYNlMyeYqhj2Io3g/W64VHeyvD+tkxZnucRvWC4pvnsFfQMdA3iJu?=
 =?us-ascii?Q?07/iXPjGwqLecHyjeWJawj/cFOGByS9FY2oSFL7SqviUPi0AisHwifxu/d1M?=
 =?us-ascii?Q?RS/UD/wpKQdacJN0jvJT4Yiun7ELTxh5z9/d1ByLV3bzAdksIUMzixHlcs+W?=
 =?us-ascii?Q?pvawCCyxcCAYu4PblzJJ81JTnQJoAZa2FE9BQHdotdjV5XJZENAR4a2DQGE3?=
 =?us-ascii?Q?Sx/nmWCPcZZ+PEb9Y84Fw3Fhxl8ZgGb13+7VdSqse4h5wjLFApVpUKoXXTsR?=
 =?us-ascii?Q?sKKBbhPnfKr4FjvCdtXT1ybLRSuzahvHFxXfzfIlScNuOqLxEoOd24I5/Pna?=
 =?us-ascii?Q?Dv6zqNjZUleDOgmIQK+2EY3SSGMx9GesnQUXcehQd/d63usifdtkASFTMp96?=
 =?us-ascii?Q?6uiaLnnsWvAprnsmrPqzTHu7JfqR8ibT6bHT43Yl0Ye4JT9Y7W1PBqhQOdSy?=
 =?us-ascii?Q?Qx3AiB/IOAHHahiojDdx0xaupFwAQ6YFtEHJIr6KJ0yaxy8V7PHYoPoOcTz3?=
 =?us-ascii?Q?htSdfNzak22/7jJCWXH6Ymu2nByyqsslHYZBp/1jyhcobo4b2BMTxMg+6HkO?=
 =?us-ascii?Q?If6O9rx6jMNtu+dZKV3Tgh/L0fhIWAwoRvaTld7ncH37vb2cmisrokGr03ZW?=
 =?us-ascii?Q?1A5XVYyQ58e2+6E9Y3QV7w/JXMuUpgsY+iubzbMRQgMRf9sXPlONml2io8aH?=
 =?us-ascii?Q?XMDcBJdUdk4RvcocqdM/6BHpUgxgFlw2ws/FG6cOPZ5glxJsiqgyGhEeiXBH?=
 =?us-ascii?Q?+Iq4qPUInMw/DYh/V28RM4CwsnuCycn1wT41Vz86jq0wd75dHWU+PhuoCC1x?=
 =?us-ascii?Q?UlH6wn8WuTVSOugNKvtxOaehtRFddwHgr3z3an0OxiZa/IduvgR093PGbXiA?=
 =?us-ascii?Q?6Zcjddak/7PLWyT199fCyUjbPH45AZ6a+ox0v/Zsa0oD9UyBecfG5ETTYzTz?=
 =?us-ascii?Q?on6JpbaJMnjK+BbPYCiuzrgI0gkw9Krwx8r24L/OiTtGVfBDr18h7fYoexgv?=
 =?us-ascii?Q?Yk8mSTQzwKhSJKyGGXMO/IC14mEIZAoSvsdBMZ30K9TeIbo/ScOVQRVPDFfk?=
 =?us-ascii?Q?1ejJ4lSuV5C/9Tr2y0QK5aaRXn+tEMeLUo8TrQg/sFTaCauHlXQGHgLbBRo+?=
 =?us-ascii?Q?tPCkte9FnGRoOnNIQ77i/3/roHVQxw/cHxAc1Zi16GovXPe63YfwNA9uM+vG?=
 =?us-ascii?Q?wVHpFyayoHehSgHMN3mebAtO7+Q8gdSoqa5vOPnqEFjNhrn07tiVj2xNC7MA?=
 =?us-ascii?Q?QsatEAmj2wd8BlA+yww/w92lONy8fkrPMRID2kHVsFO/70aU7jSOjBla5z45?=
 =?us-ascii?Q?TtzUILJSfpmwPddP1jeBnEKadscme1K+UBRdacd0MCaER0/NycqOsjxQbVwv?=
 =?us-ascii?Q?TX1RLZxaWdLVDBp+ByG89tvU20h84Hrp1OO1yMyuY/64I4OPKfoW/AKKLHx1?=
 =?us-ascii?Q?C3axi/1sYI/q7bT8DneptojvosOu01RYkXRpPNm/qB2egjlwush2HtJBZtde?=
 =?us-ascii?Q?i4vnKceLXNyri3kjaJY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10e176b9-d903-4918-3582-08dc2159668a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2024 06:05:03.5595
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i5Qj+U9C3kJ2suGU0q2+DOiTwy5dBXIdIWYPaxT3Wx/EjfOjwQdSH6ZWKenTIxd1b1uxrTsiQO2/a99T1c/tDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6702
Subject: [virtio-comment] RE: [PATCH v3] virtio-net: support setting coalescing params for
 multiple vqs

Hi Heng,

> From: Heng Qi <hengqi@linux.alibaba.com>
> Sent: Tuesday, January 30, 2024 10:15 AM
> To: virtio-comment@lists.oasis-open.org
> Cc: Jason Wang <jasowang@redhat.com>; Michael S. Tsirkin
> <mst@redhat.com>; Xuan Zhuo <xuanzhuo@linux.alibaba.com>; Parav Pandit
> <parav@nvidia.com>
> Subject: [PATCH v3] virtio-net: support setting coalescing params for mul=
tiple
> vqs
>=20
> Currently, when each time the driver attempts to update the coalescing
> parameters for a vq, it needs to kick the device and wait for the ctrlq r=
esponse
> to return.
> The following path is observed: 1. Driver kicks the device; 2. After the =
device
> receives the kick, CPU scheduling occurs and DMA multiple buffers multipl=
e
> times; 3. The device completes processing and replies with a response.
>=20
> Since Linux ctrlq currently cannot add commands in batches, it can only
> process one request synchronously at a time.
It can. Please refactor the kernel code to not depend on OS global rtnl loc=
k.
This cannot be the motivation for spec patch discussed in v2 time.

> When a large-queue driver want to issue multiple requests, the subsequent
> request must wait for the previous request to be processed before it can =
be
> sent:
>   1. The driver kicks the device frequently, this often interrupt the wor=
k of
>      the device-side CPU. In addition, each vq request
>   2. Each request is pipelined and there can always be only one request i=
n the
>      pipeline, causing more delays for the device-side CPU to wait for th=
e DMA
>      request to complete.
>=20
> These interruptions and overhead will strain the CPU responsible for
> controlling the path of the DPU, especially in multi-device and large-que=
ue
> scenarios.
>=20
Please remove above line as you acked below that those driver notifications=
 are ignored by the device in [1].

[1] https://lists.oasis-open.org/archives/virtio-comment/202401/msg00132.ht=
ml

> To solve the above problems, we internally tried batch request, which mer=
ges
> requests from multiple queues and sends them at once. We conservatively
> tested
> 8 queue commands and sent them together. The DPU processing efficiency
> can be improved by 8 times, which greatly eases the DPU's support for mul=
ti-
> device and multi-queue DIM.
>=20
> Suggested-by: Xiaoming Zhao <zxm377917@alibaba-inc.com>
> Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> ---
> v2->v3:
>     1. Update some descriptions. @ Michael
>     2. virtio_net_ctrl_mrg_coal_vq -> virtnet_ctrl_mrg_coal_vq
>     3. Reword the commit log.
>=20
> v1->v2: Updated commit log. Due to sensitivity, sorry that can not give
> v1->the
>         absolute value directly. @Michael
>=20
>  device-types/net/description.tex | 28 ++++++++++++++++++++++------
>  1 file changed, 22 insertions(+), 6 deletions(-)
>=20
> diff --git a/device-types/net/description.tex b/device-
> types/net/description.tex
> index aff5e08..dbca203 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -1667,8 +1667,8 @@ \subsubsection{Control
> Virtqueue}\label{sec:Device Types / Network Device / Devi  for notificati=
on
> coalescing.
>=20
>  If the VIRTIO_NET_F_VQ_NOTF_COAL feature is negotiated, the driver can -
> send commands VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET and
> VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET -for virtqueue notification
> coalescing.
> +send commands VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET,
> +VIRTIO_NET_CTRL_NOTF_COAL_VQS_SET and
> VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET for virtqueue notification coalescing.
>=20
>  \begin{lstlisting}
>  struct virtio_net_ctrl_coal {
> @@ -1682,11 +1682,17 @@ \subsubsection{Control
> Virtqueue}\label{sec:Device Types / Network Device / Devi
>      struct virtio_net_ctrl_coal coal;
>  };
>=20
> +struct virtnet_ctrl_mrg_coal_vq {
Since this doing at batch level, ctrl_coal_vq_batch or ctrl_coal_vqs_batch =
seems better name.

> +        le16 num_entries; /* indicates number of valid entries */
> +        struct virtio_net_ctrl_coal_vq entries[]; };
> +
>  #define VIRTIO_NET_CTRL_NOTF_COAL 6
>   #define VIRTIO_NET_CTRL_NOTF_COAL_TX_SET  0
>   #define VIRTIO_NET_CTRL_NOTF_COAL_RX_SET 1
>   #define VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET 2
>   #define VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET 3
> + #define VIRTIO_NET_CTRL_NOTF_COAL_VQS_SET 4

A new feature bit is needed as the driver does not know if all the devices =
support this command or not.
For example, some device does not support VQS_SET command.
The device is already out that supports notification features per VQ (witho=
ut coalescing support) and does not plan to support coalescing because OS l=
evel enqueue command is optimal for it like rest of the tx and rx q.

>  \end{lstlisting}
>=20
>  Coalescing parameters:
> @@ -1706,6 +1712,7 @@ \subsubsection{Control
> Virtqueue}\label{sec:Device Types / Network Device / Devi  \item For the
> command VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET, the structure
> virtio_net_ctrl_coal_vq is write-only for the driver.
>  \item For the command VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET,
> \field{vq_index} and \field{reserved} are write-only
>        for the driver, and the structure virtio_net_ctrl_coal is read-onl=
y for the
> driver.
> +\item For the command VIRTIO_NET_CTRL_NOTF_COAL_VQS_SET, the
> structure virtnet_ctrl_mrg_coal_vq is write-only for the driver.
>  \end{itemize}
>=20
>  The class VIRTIO_NET_CTRL_NOTF_COAL has the following commands:
> @@ -1716,6 +1723,9 @@ \subsubsection{Control
> Virtqueue}\label{sec:Device Types / Network Device / Devi
>                                          for an enabled transmit/receive =
virtqueue whose index is
> \field{vq_index}.
>  \item VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET: use the structure
> virtio_net_ctrl_coal_vq to get the \field{max_usecs} and \field{max_packe=
ts}
> parameters
>                                          for an enabled transmit/receive =
virtqueue whose index is
> \field{vq_index}.
> +\item VIRTIO_NET_CTRL_NOTF_COAL_VQS_SET: use the structure
> virtnet_ctrl_mrg_coal_vq to set the \field{max_usecs} and \field{max_pack=
ets}
> parameters
> +                                         for \field{num_entries} enabled=
 transmit/receive
> virtqueues. The corresponding index value
> +                                         of each configured virtqueue is=
 \field{vq_index}.
>  \end{enumerate}
>=20
>  The device may generate notifications more or less frequently than speci=
fied
> by set commands of the VIRTIO_NET_CTRL_NOTF_COAL class.
> @@ -1782,9 +1792,13 @@ \subsubsection{Control
> Virtqueue}\label{sec:Device Types / Network Device / Devi
>=20
>  The driver MUST set \field{vq_index} to the virtqueue index of an enable=
d
> transmit or receive virtqueue.
>=20
> +The driver MUST set \field{num_entries} to a non-zero value and MUST
> +NOT set \field{num_entries} to a value greater than the number of enable=
d
> transmit and receive virtqueues.
> +
>  The driver MUST have negotiated the VIRTIO_NET_F_NOTF_COAL feature
> when issuing commands VIRTIO_NET_CTRL_NOTF_COAL_TX_SET and
> VIRTIO_NET_CTRL_NOTF_COAL_RX_SET.
>=20
> -The driver MUST have negotiated the VIRTIO_NET_F_VQ_NOTF_COAL feature
> when issuing commands VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET and
> VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET.
> +The driver MUST have negotiated the VIRTIO_NET_F_VQ_NOTF_COAL
> feature
> +when issuing commands VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET,
> VIRTIO_NET_CTRL_NOTF_COAL_VQS_SET and
> VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET.
>=20
>  The driver MUST ignore the values of coalescing parameters received from=
 the
> VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET command if the device responds
> with VIRTIO_NET_ERR.
>=20
> @@ -1794,10 +1808,12 @@ \subsubsection{Control
> Virtqueue}\label{sec:Device Types / Network Device / Devi
>=20
>  The device SHOULD respond to VIRTIO_NET_CTRL_NOTF_COAL_TX_SET and
> VIRTIO_NET_CTRL_NOTF_COAL_RX_SET commands with VIRTIO_NET_ERR if it
> was not able to change the parameters.
>=20
> -The device MUST respond to the VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET
> command with VIRTIO_NET_ERR if it was not able to change the parameters.
> +The device MUST respond to VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET and
> +VIRTIO_NET_CTRL_NOTF_COAL_VQS_SET commands with VIRTIO_NET_ERR
> if it
> +was not able to change some of the coalescing parameters. In this case, =
all of
> the parameters MUST remain unchanged, for all virtqueues.
>=20
> -The device MUST respond to VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET and
> VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET commands with -VIRTIO_NET_ERR if
> the designated virtqueue is not an enabled transmit or receive virtqueue.
> +The device MUST respond to VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET,
> +VIRTIO_NET_CTRL_NOTF_COAL_VQS_SET and
> VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET commands with VIRTIO_NET_ERR if
> the designated virtqueue is not an enabled transmit or receive virtqueue.
>=20
>  Upon disabling and re-enabling a transmit virtqueue, the device MUST set=
 the
> coalescing parameters of the virtqueue  to those configured through the
> VIRTIO_NET_CTRL_NOTF_COAL_TX_SET command, or, if the driver did not set
> any TX coalescing parameters, to 0.
> --
> 1.8.3.1


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

