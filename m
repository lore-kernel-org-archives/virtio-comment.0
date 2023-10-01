Return-Path: <virtio-comment-return-7575-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A104CE748ED
	for <virtio-comment@archiver.kernel.org>; Sun,  1 Oct 2023 09:43:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1758A3E56B
	for <virtio-comment@archiver.kernel.org>; Sun,  1 Oct 2023 09:43:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0FB37986675
	for <virtio-comment@archiver.kernel.org>; Sun,  1 Oct 2023 09:43:10 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 04EEC983D6F; Sun,  1 Oct 2023 09:43:10 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EA54B986637
	for <virtio-comment@lists.oasis-open.org>; Sun,  1 Oct 2023 09:43:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kk/EAHmmzKMFWbhf8Ap7mltVzh/mu5jidzqBK69YFBI0OlQxbfqmkTweqlj0M5tgz8g75T2LSUP58ehdC55ttzqT/F9WF+YkiuzqkakO7CyMRsnTIPP59lIKtVrsddQ2Z+knNmeBZUCWgBA3wrrNO0M6+RQlzRgiqZcG1tm7UQuojXq0zbSKW41XZbtFhzb5eAPo3MGH96rtDga0s8/Z0nuBYclZzfb4TU+oAcGj09W3HE/D0p9YhZtRpwPbS9Nn3xvBocVu6XPqDwylMIi8P/YBCgxjGq5j3p/T1jetul5/kTlawiRxAX+4nMzUrkwHMS3VkbCh1bcdJkDH/aRKXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJNWDaGRb1IK1e1eEQIYEP7axwlkOTVEeBoy2GTIrcY=;
 b=WzXqVhA0Qv/CG/6TN0wEUCTBoHVGRolkKj98t/048BLWodeeT+Z2va8V188Y4Dvvi+g0LoiPdq08Qxl4dOA+yapNgY01Lg0RNCMSX/Q9ZLQQ2oRi9opKtOG3msUEb06//L4V5CROnnUP0nC1myel/j6+AvzNe9e0E9I0frUXNBuv5J++6lLbE6oZBVk4VcMJA+npuXVxSExXTaCL2kUmRXHMQ8MQgo109XPzlvsmo2kvZbVgtOGfqXjzBMMWavzrfQuWnqLk+koj2uf/yQ/l/IUlv7FyZnMXSgDTQD7WG7S4kJmKNuqBO4e+Riy26CCtUXbyUw5lRUUNgc0xV5RvJQ==
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
Thread-Topic: [EXT] [PATCH 7/7] virtio-net: Add flow filter device and driver
 requirements
Thread-Index: AQHZ7VuhPntwZLaLME2l/ChmjxPtcLA0sCqw
Date: Sun, 1 Oct 2023 09:42:59 +0000
Message-ID: 
 <SJ0PR18MB4477C6B390045649ABE8B1F9C3C6A@SJ0PR18MB4477.namprd18.prod.outlook.com>
References: <20230922134838.3718-1-parav@nvidia.com>
 <20230922134838.3718-8-parav@nvidia.com>
In-Reply-To: <20230922134838.3718-8-parav@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR18MB4477:EE_|BN9PR18MB4124:EE_
x-ms-office365-filtering-correlation-id: 5f75b2c8-cd53-4e97-e412-08dbc262cc62
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 MsfKsGIrrKAu9QGkDihfPVDGrhZwZjHJoXfqrO4xQJOiqqup901cCTI8Fk+l79nzJW7DlAXvGt8EqPcNWVrG40vEgTC5z9ZH4PKP2m6Jq245A9dONJQahAMyhx3krZynkcrO+9hkZbqEqQD/aSiD3mdFsXGvDXODLT0aekaYXUQ5E2Ebsc9eQb0ldSP1Sp8tuz5MVLr026YDVIZfMSH8Rd5hFH8+PN/qCKBBC4ZxMLr6sMDT6MaoM1P9tMpMhFDyGrMaDzE/fw6mQEoluJrf0ukxrVyNjANyzASEdY+92JzcdY2ur1AMkwznf5wd6Agpr5wJuaIWsWLEsTTR5+i3tDBUNfTYSyNtwf0z2uaRFIEyhyKGo1U93x6+zq4Nw2v55VjBUjTnY95o2LbHts/rTLw5K7bP0nqmnZaa5WI++KO484qYEHvz1NUyv33OFIkYjnDjzY8gCE5Whg4ERMm4IJLKPOLj3av1KPr3V9mlgdjYQllbNoGVZzN9TSo0KT0Lj5MaqdHx6jtLY6HSR6RNHAV0WbDNYXXdR1+RhIzR42YQ3K6IfI0s30oxBFBp4TFnUoFKLrdYznLJEeMu2X66RJFYAPIOZ3TDnND+Y+X6z0w=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR18MB4477.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(396003)(39850400004)(376002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(2906002)(71200400001)(9686003)(38100700002)(38070700005)(76116006)(110136005)(66556008)(7696005)(66946007)(66446008)(33656002)(6506007)(86362001)(478600001)(966005)(83380400001)(66476007)(26005)(122000001)(64756008)(316002)(55016003)(54906003)(5660300002)(41300700001)(52536014)(8936002)(8676002)(4326008)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?qIHj/WLCtcJPQlhBd91z0Jjds8xAcvzQoA15sSupv22XP8std52bwx8mIRj+?=
 =?us-ascii?Q?ITVDsIezX4G9+gY2sfRMXw3Db7YihsqQBiKY93to+5GYT11FTDv/Z+SdNeGO?=
 =?us-ascii?Q?qzsANrLxA5xGZhP9CJW0VS71QLV/ZL3JJZ8QUkc7xYy0CuhvR+qfLpAS+qET?=
 =?us-ascii?Q?AlAwpzI3xDXe7np0U0ehWjq+HJK12gMEtustSt5W1jLXxoEegtip28qO2hsD?=
 =?us-ascii?Q?V/wbU8ZcwR4rKYeLjHhyBODIELpO3cmqDAvS2s807MerzOiQjSGxA+qGARiE?=
 =?us-ascii?Q?+2QOreBzVwqa899LvuTay2fJfMDEU5L2bVtTIioQUEtCCLxf/S+ROMXGsQOg?=
 =?us-ascii?Q?ZzgyrvAZ7P4pB7qQraJBp0WPp2T2utiW1S5RGsfDJiv/igv6Hj02+hPWF5ty?=
 =?us-ascii?Q?V1m8fhaF/EQts7s0k493rNeJgDihVdOXsCK4we77QWa63s7NlDihXfqoDGF6?=
 =?us-ascii?Q?6QaDSCeWEKzETGcW0Z4AKGt1hkjp8nUJxrJM8yD9Ar04FLsnnJYMgoUK+qtl?=
 =?us-ascii?Q?XUEQmAJzZlmNc4vBsHlMymkkPfhxx0j82mYsteivHD4GiGIcVJkXfcYk2bup?=
 =?us-ascii?Q?IHMdAn91bh8VA/6K7txWtni50i7yA63ilYJOw2waJMW97xfQuDAe/HwCtfNW?=
 =?us-ascii?Q?B1eQ2/m9K8obhspemcQr92CFXXWTvR0SsU8MX0+xrOoQRuIhI3V4C1hAEGpP?=
 =?us-ascii?Q?wvwCn9hnNjEDAOR64DHjXAKU5xMQIctw4EFUvMhG6ScvwrvzIA/RSAJRwQ0S?=
 =?us-ascii?Q?+92WFle7pYBt+wwKrY32MpbN3pl8mtYwxWwam+3fShm2MeJlpbnowGaUTauy?=
 =?us-ascii?Q?mSz9PdKdSRUyX4zYepv5+4C4zjBf+0uDHAXVuXiJ2MpNLAdMgEL6UbeQd2t8?=
 =?us-ascii?Q?mRF5VHx++u/V45d0QOIVZV8XLzzy3YwW5jQzKHOfthfaP/tqtG1pS+cmeKzX?=
 =?us-ascii?Q?vhjU1D9TU1Z0KbAI0xaRlSwY19+IxrZDBkbBDtjl3S11C3O6TeBBLI69+MTd?=
 =?us-ascii?Q?XsvqQR+8FzZDf+O/zHzV4S0XDaRRhsXzfStNJ2xTWSUIW+BfcDkcPKnwDAzO?=
 =?us-ascii?Q?BLXDenNskZiYcEMlEgR69D6cllQsYizPx9ZaxybaZp2f6Q3PfYubHafV25ma?=
 =?us-ascii?Q?5v5UODXdEl0jyno/u+xNgoRGYdfmKVxy0EAh966pgsy4hg4JwQDE1ujPXuBn?=
 =?us-ascii?Q?pYGMsPSTPg/8+4xAp4BmMIfc2o9/qLBBlMoH7zB3J6LChI8JNX/0+NKdnHSt?=
 =?us-ascii?Q?qW+sxUnmPBpSLcUitfTGidwOGc6RXAfcA+iCRM7LktjZzg2oVU6+M47I7u2B?=
 =?us-ascii?Q?qvCfTRoAYRqvOcs2vNZjj0J+X+IHcQehGzVBWJoduI12zasPZF2FgfmIsY8j?=
 =?us-ascii?Q?hg+FZ/jcxzc20qZemWIlJSVUx3l7ysIwcphniarMOshGHVIT5sutjar/wjIk?=
 =?us-ascii?Q?kL6ZpqeRpTbfwLlTYXQBIUJh/p5ZcnHaUntIZ8N39Kg8THdTzBZ0a6bWZJiY?=
 =?us-ascii?Q?QCxecPzt1jMBXs9WiVOrcZt7+IWqBa1nC7hsPPXqr27K6ztaMh5hmHlSVw5i?=
 =?us-ascii?Q?IYgnUBqmncOleDW2kuMi7KiMb7r6MQVaUQsS/NXJ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR18MB4477.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f75b2c8-cd53-4e97-e412-08dbc262cc62
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2023 09:42:59.4097
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EcSD9glRkCZ18OIXzHHoCJz9bYCotp6uB+O5jqbQemZJm+kgEBAPVaOMcXgw19P1w4MEunIz0v8vxF7QRBSE0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR18MB4124
X-Proofpoint-ORIG-GUID: G6jjjhPrHa0Aih65N7jVO1zOxNFIRvbB
X-Proofpoint-GUID: uyBeSPnMF-tA0ig1bqzubti8n6mvPhqW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-01_06,2023-09-28_03,2023-05-22_02
Subject: [virtio-comment] RE: [EXT] [PATCH 7/7] virtio-net: Add flow filter device and driver
 requirements

Hi Parav

> -----Original Message-----
> From: Parav Pandit <parav@nvidia.com>
> Sent: Friday, September 22, 2023 6:49 AM
> To: virtio-comment@lists.oasis-open.org; mst@redhat.com; cohuck@redhat.co=
m
> Cc: Satananda Burla <sburla@marvell.com>; shahafs@nvidia.com; si-
> wei.liu@oracle.com; xuanzhuo@linux.alibaba.com; Parav Pandit
> <parav@nvidia.com>; Heng Qi <hengqi@linux.alibaba.com>
> Subject: [EXT] [PATCH 7/7] virtio-net: Add flow filter device and driver
> requirements
>=20
> External Email
>=20
> ----------------------------------------------------------------------
> The flow filter functionality consists of the following
> four components.
> Add driver and device requirements for it.
>=20
> 1. Device capabilities query for commands VIRTIO_NET_CTRL_FF_CAP_GET,
>    VIRTIO_NET_CTRL_FF_MATCH_CAP_GET.
> 2. Flow filter group operation commands VIRTIO_NET_CTRL_FF_GROUP_ADD
>    and VIRTIO_NET_CTRL_FF_GROUP_DEL.
> 3. Flow filter transport mode set command
>    VIRTIO_NET_CTRL_FF_TRANSPORT_MODE_SET.
> 4. Flow filter requests using command VIRTIO_NET_CTRL_FF_REQ and
>    the structure virtio_net_ff_op for the flow filter virtqueue.
>=20
> Fixes: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-
> 3A__github.com_oasis-2Dtcs_virtio-
> 2Dspec_issues_179&d=3DDwIDAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DNHDPsfcAYlN2z=
-
> NXHHG4WB09qqS0voo_nf6_kGS625A&m=3D8GgvPPzhkMzjnrqhLPEu7j1B0uqFdiy5e7lQGfU=
ZEW
> MOxPwYNGtfRt_j2pephKf8&s=3D8VGvaTxBK738Ex8bGnhEXIrrDkavvG_JfEZ7TkUYe-4&e=
=3D
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> ---
>  device-types/net/description.tex | 116 +++++++++++++++++++++++++++++++
>  1 file changed, 116 insertions(+)
>=20
> diff --git a/device-types/net/description.tex b/device-
> types/net/description.tex
> index a96e47a..6f89096 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -2358,6 +2358,122 @@ \subsubsection{Control Virtqueue}\label{sec:Devic=
e
> Types / Network Device / Devi
>  \field{command-specific-result} is in format of
>  \field{struct virtio_net_ff_req_result}.
>=20
> +\devicenormative{\subparagraph}{Flow Filter}{Device Types / Network
> Device / Device Operation / Control Virtqueue / Flow Filter}
> +
> +When the VIRTIO_NET_F_FLOW_FILTER is negotiated, the device MUST support
> +VIRTIO_NET_CTRL_FF_CAP_GET, VIRTIO_NET_CTRL_FF_MATCH_CAP_GET,
> VIRTIO_NET_CTRL_FF_GROUP_ADD,
> +VIRTIO_NET_CTRL_FF_GROUP_DEL, VIRTIO_NET_CTRL_FF_TRANSPORT_MODE_SET and
> +VIRTIO_NET_CTRL_FF_REQ commands.
> +
> +When the VIRTIO_NET_F_FLOW_FILTER is not negotiated, the device MUST
> respond
> +with error VIRTIO_NET_ERR for
> +VIRTIO_NET_CTRL_FF_CAP_GET, VIRTIO_NET_CTRL_FF_MATCH_CAP_GET,
> VIRTIO_NET_CTRL_FF_GROUP_ADD,
> +VIRTIO_NET_CTRL_FF_GROUP_DEL, VIRTIO_NET_CTRL_FF_TRANSPORT_MODE_SET and
> +VIRTIO_NET_CTRL_FF_REQ commands.
> +
> +When the command VIRTIO_NET_CTRL_FF_CAP_GET completes successfully, the
> device
> +MUST return either \field{max_vqs} to be non zero or return
> +\field{cvq_supports_ff_ops} to 1; the device MUST return non zero value
> for fields
> +\field{max_groups}, \field{max_ff_per_group}, \field{max_ff},
> +\field{max_match_fields} and \field{max_flow_priorities_per_group}.
> +
> +When the command VIRTIO_NET_CTRL_FF_MATCH_CAP_GET completes successfully=
,
> the
> +device MUST return non zero value for \field{num_entries} and return
> +corresponding number of valid entries.
May be better to say the fields_bmap cannot be 0 for any returned entry.
The same field type should not repeat multiple times. Also it is better=20
to order the entries in network protocol order (l2,l3,l4).
> +
> +The device MUST respond VIRTIO_NET_ERROR for the command
> +VIRTIO_NET_CTRL_FF_GROUP_ADD if there are existing flow filters for the
> +supplied group \field{id} or for the supplied \field{priority}.
> +
> +The device MUST respond VIRTIO_NET_ERROR for the command
> +VIRTIO_NET_CTRL_FF_GROUP_DEL if the group identified with \field{id}
> +does not exist in the device.
How about issuing VIRTIO_NET_CTRL_FF_GROUP_DEL when there are non zero
number of flow filters in the group ? that also result in error, right?=20


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

