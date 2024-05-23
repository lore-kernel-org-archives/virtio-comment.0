Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2072.outbound.protection.outlook.com [40.107.101.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F49B46AF
	for <virtio-comment@lists.linux.dev>; Thu, 23 May 2024 11:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716462388; cv=fail; b=CDpCUPNF4CutDB7g5ezoigstFX8TEV8ueQu1C2c0Ti8se0OqJMxLWwRdkKRuZVCPyVm3scA8UwPsTr05XUTOmESzUkahVX19GyKtyQebn2JzSRkPLkJ2i/6dMPidV3IJBDcI4GqJxgtcY3a4VP9J9ITJOzqEVzT0X+OE8eDRKy4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716462388; c=relaxed/simple;
	bh=lnjLNuv7IkxJFubhjUDKYBklLP9Xv9DMOvuxBT4+aFY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=h4G4b22Odn8GOHxW9FW1uekFKqWM7UnhiLshPU5OnE3/x2gVPIP5eRqrh5G2Q4gWHGl0ndcyRje2f8YT6nsG/qUCXHKQoEv8Wwo/BKslI3ixrW9vgtcquGxe7nwMHVIQgJDd4PnWUlPndYnwAQ6F5p+GqfVMZdnjIpkPJhv18u4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YQmtXWda; arc=fail smtp.client-ip=40.107.101.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YQmtXWda"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JQ/9fAEjX3O9oyzcZOwqy6woe45QYgjod38bCvEVEn6qXI64YFJ3pSlV7kVVBuUj2Vgktln1VBI+baA+Z9UrugY72aXv+0VZoHoFyzl1sQ4JsxYKSpsD9g8VkyDPmrh70L6KyvbzlNClXHGjWLP2FId984rNLZEPKZnSEaXnfC3TNCeHnebhXJc6KMKbzK9+w8hwe5OzVKCXxRdnlOwveRe52bNT1oFd1V0yYLAAZmpwoPpeeojxkjna1juAF+1PWZUBonW5ss7D0iTJwXVqZg8PucOw7EXLq3tN0c7N1AQ8gBzwngRGyFSx6Svh4lYa2si8keMp+xQoAVud7/kiQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JxTFgTvAa2FvItP5kqnW+MC+0dLmIh3OKpAp7B0lgWQ=;
 b=l/Q3C02Wg4WzzpZSIFs3LGwvDmMSUf95el0Q4DSjJ0WoEXKkdsWKhAua1pdmbHLhNjQuSE51snx5SIyfuxyLRKh+g2DXLrdgkAlOY7Jp4K0FYNn5XmbLSv8q6/pTyiyHikx7u8Gwqr1Ofcbh9L5f9rOMKRDmJ8pXuo0llPIihKDDvfJHF43D2fWhNbEDRHBIfcpCk5O+Go9sfSJ2RG8R+CilrRkBh9NYefNu+5hkLk71g+UmMuy4HplmSB2mEujYGOZs26JFZyNJA+DHyDeUGPU4jESnXzzIvVidFotCVw21UmFXP54J8FGYjwb+eo/3OCgIPSAi+BugPE/jLcK2gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxTFgTvAa2FvItP5kqnW+MC+0dLmIh3OKpAp7B0lgWQ=;
 b=YQmtXWdatvjpF1wQHKMHmYOHth+jSOZi/r1lrEaLU36vcL87e9ropcK8I6zzPHzFJbB2K910W+QtSzRVONaQdpX382bTNBkSrGduM9d5hbq+F8A+ubFtK40VJLqvyw5l4CXNNU8LejmmbwJoB167TM0jT0wzffzsVEROVicC1LHfiVh5tCvTcxUueFHZ8iZtlq5lrjrYwJ2eIsO3WMI3dU3KK6DAiC73I2K8nvJ1h6ZTVQNlJlk064f/DxUb2lKfdCnM5rdexQQbemdkNlFL1CaeqTPN8r7rD3T7bYw1s2l6p0TkLcYQDSKLt7opvv4aQv29wP3qGD0PgdyhEYLRQg==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by CH3PR12MB8726.namprd12.prod.outlook.com (2603:10b6:610:17b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Thu, 23 May
 2024 11:06:23 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7611.016; Thu, 23 May 2024
 11:06:23 +0000
From: Parav Pandit <parav@nvidia.com>
To: Heng Qi <hengqi@linux.alibaba.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: RE: [PATCH v4] virtio-net: clarify coalescing parameters settings
Thread-Topic: [PATCH v4] virtio-net: clarify coalescing parameters settings
Thread-Index: AQHarPfE9ZZ9exKb90SFOxGjT+hTDrGkp6Ng
Date: Thu, 23 May 2024 11:06:23 +0000
Message-ID:
 <PH0PR12MB54810DB98B28AE159D0FA089DCF42@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240523095822.116289-1-hengqi@linux.alibaba.com>
In-Reply-To: <20240523095822.116289-1-hengqi@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH3PR12MB8726:EE_
x-ms-office365-filtering-correlation-id: 1652a80e-a324-4a01-b691-08dc7b18620a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?kFIV30ALtI5r2iILjjzhTb36bzKCn2yzDJjvs+FjHmwjXoZZyQUI+DUurBjE?=
 =?us-ascii?Q?vg/T9dqmofGrKhaeQkvd9IMx72BFim3BUuzxuP6qO23bxBqNZioEEgDaar4R?=
 =?us-ascii?Q?jErfZRm3Z9XlTt2n8nZBmxtPJDi24ClAbFvvwf4j58Oe8ZkpaRlAz4ZPztMn?=
 =?us-ascii?Q?XimcFUGiS5PNvuGWp70FZMBDw9JA0D1e8xs21N7od4Kl3//zEyZzXAKWU/fl?=
 =?us-ascii?Q?HbE7pBMtjBc52OI7uCCZV5MQ1cO6AZ3W48D9PFjfyRuWgLrJJGEcQvDYkF1w?=
 =?us-ascii?Q?9x48YpFxu5N6NZHmgZe9Ik1yMteEJucezNTg05DzwSQ1F4Pib/PKBUvIIAmR?=
 =?us-ascii?Q?/jtgOlJA6QPdVYvZEne5Lun8NV6qTH+VbpqL66yQkHsCKGk4LDccjnOGbVIA?=
 =?us-ascii?Q?tVZvCNZNST4T/JlhY3WSARqXxYZdcTtSDP5hahcHIRXfaG/sGPABC3A3IBTE?=
 =?us-ascii?Q?szbKu0vuPOSD2lJC+xhQTkCeU5I4CEnkaT3q122lx+8ggCASqTSzXu788V/e?=
 =?us-ascii?Q?GbGXKhMJzP7c7ESjTsyZkVkWUW25toLSE0jBQqXFc/dCPyrBKFm/xKYesyTv?=
 =?us-ascii?Q?qNu+g6rnI/d0kkZpkx5NbSfFXIZKZKoD/uONvJPbOu/br8xNDQc7V2qRlFLL?=
 =?us-ascii?Q?zbP/EMd3gzJzHoSV0QiwrzYGA28hIz62RrTsw44150Lm7si7HaeXLTBLNva9?=
 =?us-ascii?Q?umndcWVSVkCxnGHmHgfxX9Ew9nnRBb8o6c+qn2SZT+jjnYkyed4qTsrF5gyN?=
 =?us-ascii?Q?caq14btPrfwa5Fqhx8CtHgNuxcPtI+qJ9SWl/G0sC7wUdZil7TcOWekrFolD?=
 =?us-ascii?Q?d+GKTDjOz/W+kzH7PEgPaHorF3wnkoAy7c3eClaI3q96babf+TbGmfEdRkcC?=
 =?us-ascii?Q?uufAC/3S5NFTTUzrB+TI8qY4QQkqlv6PZPQy6cOFrwtznNWbZX0yzmvzxVvB?=
 =?us-ascii?Q?6p3krO1mo8r6cf1mYA81/6njHP4ML8fTnyO2gMFXTis6hN5T7EmV8NS7ofNF?=
 =?us-ascii?Q?lzgK+MxNIqiJpoxtrlcVP9J2B1tVKXzIdKNF+g4gOO6MJcZUdERIKSEQM3LS?=
 =?us-ascii?Q?uNqhckOthTX3YKvord1f5Qw8AmMWJJO+HD25OjxYAGiTw8sC8xpskaifgGqk?=
 =?us-ascii?Q?Pravw35AcqLNYDX39Q6mbkMu5XkkCoyzOpLnGEWdWcThcEoi91s5L5n0q09I?=
 =?us-ascii?Q?GNZ4kn+Tgzi30jSf6NRoWD8aSuk9reGbtX39x0KykrEZSOd26h1c71jVO5tU?=
 =?us-ascii?Q?b6a8AA+RIIl608lO/QNA6FiTHpAd7aC7EDeib+C9amUCIEsDZYcmqID5D7A4?=
 =?us-ascii?Q?I1ECTa5wUs5DQ0iSnEYPqsiBZHH2iIEigCrcJn91Kbh4gQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?AszDA8rIgQSJlt7d2Ra7knHSY9USH12Ha+kKilyall7IyXMMurzg8sAoRhVh?=
 =?us-ascii?Q?TfrxAj5XyjbcYCRZ/cfNws43lGmAg+Mzpp9C4RLB9MWB2WRqnTakK9RKi+Sv?=
 =?us-ascii?Q?IgZfRqU3gr7mnRMmbvJhKp65+C6a1jEhOzh3WeKKYi61pXZukcABUvGUWbCr?=
 =?us-ascii?Q?CKSbuHnUMIBaCzFLuHKsV4TDSvXdckWaUQyv0AOVKnU4t1tpe2mGWWQafDvw?=
 =?us-ascii?Q?yx8KsNuVXHr+iRhfB3IuFquDGUpPuL6YzO59axsjEPVrhEoNz/vYw1lU/ujf?=
 =?us-ascii?Q?5Xhx0roJQxgjVgxgNegfYHD6Sat83ruLkM+t7BZstySnVQkqHPteDdkFVZI7?=
 =?us-ascii?Q?jY4wXTRRICcnC7KI6VUxhmXv1h3R924LLsdVBjKQ9Ee+Yaaj44Kte2whMR7Y?=
 =?us-ascii?Q?aneo9rgzfRHwem1KfehaFtzPXfWqTmAD2ZiIy7iN2CoDkEwfN2+gaIxH9Smb?=
 =?us-ascii?Q?yJCooEr3mFYYjIleDfbZFn9ROZ9XJprslrAa6JLPU3yeKV0MlLdwYqncfHfJ?=
 =?us-ascii?Q?gcYgQN3YfBarqraHcklERPpxCSmoAolQ1E7Ls6AUgdMp0BpK3FdwciNwMPcn?=
 =?us-ascii?Q?vIUmmRT6G475c3nmX/+0rHiY8yd31Xhh8DMgDt5/4z36U/qtzCvYJlxVk5uH?=
 =?us-ascii?Q?oc7qIcGoWQdx4kpELjh/iQ1QoSHB5cKyTU4oD04IOkT7BzXUL/AO6YTmkYpk?=
 =?us-ascii?Q?ubUmCrJaLCjlq7XBlN6+CzAxm8eNPp2fTn/4VSNYiQV+btGnQzJJnx6ZJ1T2?=
 =?us-ascii?Q?46m6jJYO058E1O5xhRE5SqUr1bwEC97mcJynyCLX4pDF6k+k8VNXBY0qQLU8?=
 =?us-ascii?Q?xyDgGyykI55PcERXwjxRXK5K4t0gTLOPab5CIJVribAHeJ8UBUTSVspiCeka?=
 =?us-ascii?Q?as0kONcbqtA4z0L0HoxCM16jcC/owqKs0jZjWmD6pGd24T3cPQXH00b7SKIE?=
 =?us-ascii?Q?3W8hnoYDSLvoGahf90D4ol5GzL627SQo9qw2B8MODi4bU3rxisV3WIt4jUEl?=
 =?us-ascii?Q?r4yXEtlt1WfrHABiGqQ6JWGd47WLegbRccoL609Ho9UMrmIiYYdUu/Fd3zo6?=
 =?us-ascii?Q?TgitZ2O5m+bsEsJDdN8f/9AxNSAJjG+In7itp0g/lWIocZqRygwXY4C265ZJ?=
 =?us-ascii?Q?vbK2fHQv82j1zDKmsBl06itHJo+gSPNQn7Q1OfuJilVAk1+z2rizl91CqsNB?=
 =?us-ascii?Q?9gIa8olrad+f3XkTOcMfsbDbr1qolCTqzW4JEcuZRg3R0dtk2Lu6v5+EWt3F?=
 =?us-ascii?Q?IDWfd5B+KpBpfvP0XeGadVFSrUFlQfH4AEh0I5VYNakfBCZnfzEfizt0QvUw?=
 =?us-ascii?Q?UEapoEaszSrx+ufzVWb1nsNpM8bwoad1m0Yc5OGMr49+H/HSXopl9HSVJ/UH?=
 =?us-ascii?Q?T4SAJvtl6fRROaC9lSI9uMQY5DHq6LZRCkgX7BMlqjFdyr+A+ycF/Ln9EH22?=
 =?us-ascii?Q?r7ag06nive+AYUoweSqgWw3VgWqI9lEdQuuPaXlVKcElNkBTbufozZJcRdtB?=
 =?us-ascii?Q?5d9kJDdNdRlnb/xU/HvBSLfndcEQ8n+JVRZ1khEfcvKaU1teAPNUsdlsQGs8?=
 =?us-ascii?Q?pSMAR+zsij9hzPR2OVo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1652a80e-a324-4a01-b691-08dc7b18620a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2024 11:06:23.3917
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pi0RBRtOB5xZuVFN/5MMUe6QGRvYGODDGG8kKCviVtqMkyuhrj52eqC85x1N68W2q9bolSpocp3W1rnieytdFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8726


> From: Heng Qi <hengqi@linux.alibaba.com>
> Sent: Thursday, May 23, 2024 3:28 PM
>=20
> The device can set any initial coalescing parameters (0 or non-zero) for =
the
> receive/send queue before the setting command is executed, not just 0,
> enhancing device performance even without DIM enabled.
>=20
> So we need to clarify descriptions that don't fit the behavior.
>=20
> Suggested-by: Jason Wang <jasowang@redhat.com>
> Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> ---
> v3->v4:
>   - Doesn't force the device to remember more stuff. @Parav
>=20
> v2->v3:
>   - Clarify description to be more generic. @Parav
>=20
> v1->v2:
>   - Update description. @Jason
>=20
>  device-types/net/description.tex | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>=20
> diff --git a/device-types/net/description.tex b/device-
> types/net/description.tex
> index 61cce1f..2764e04 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -1803,6 +1803,14 @@ \subsubsection{Control
> Virtqueue}\label{sec:Device Types / Network Device / Devi
>                                          for an enabled transmit/receive =
virtqueue whose index is
> \field{vq_index}.
>  \end{enumerate}
>=20
> +If the VIRTIO_NET_F_NOTF_COAL or VIRTIO_NET_F_VQ_NOTF_COAL feature
> is
> +negotiated, the device may apply any coalescing parameters to each
> +transmit/receive virtqueue before the driver successfully performs one o=
f the
> VIRTIO_NET_CTRL_NOTF_COAL set commands.
> +
> +The driver can query the current coalescing parameters of any enabled
> +transmit/receive virtqueue using the
> VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET
> +command, before or after any VIRTIO_NET_CTRL_NOTF_COAL set command
> is done.
> +
The word "current" is not necessary here, but it fine.

>  The device may generate notifications more or less frequently than speci=
fied
> by set commands of the VIRTIO_NET_CTRL_NOTF_COAL class.
>=20
>  If coalescing parameters are being set, the device applies the last coal=
escing
> parameters set for a @@ -1885,17 +1893,17 @@ \subsubsection{Control
> Virtqueue}\label{sec:Device Types / Network Device / Devi  VIRTIO_NET_ERR=
 if
> the designated virtqueue is not an enabled transmit or receive virtqueue.
>=20
>  Upon disabling and re-enabling a transmit virtqueue, the device MUST set=
 the
> coalescing parameters of the virtqueue -to those configured through the
> VIRTIO_NET_CTRL_NOTF_COAL_TX_SET command, or, if the driver did not set
> any TX coalescing parameters, to 0.
> +to those configured through the VIRTIO_NET_CTRL_NOTF_COAL_TX_SET
> command, or, if the driver did not set any TX coalescing parameters, the =
device
> MAY initialize them to any values.
>=20
>  Upon disabling and re-enabling a receive virtqueue, the device MUST set =
the
> coalescing parameters of the virtqueue -to those configured through the
> VIRTIO_NET_CTRL_NOTF_COAL_RX_SET command, or, if the driver did not set
> any RX coalescing parameters, to 0.
> +to those configured through the VIRTIO_NET_CTRL_NOTF_COAL_RX_SET
> command, or, if the driver did not set any RX coalescing parameters, the
> device MAY initialize them to any values.
>=20
>  The behavior of the device in response to set commands of the
> VIRTIO_NET_CTRL_NOTF_COAL class is best-effort:
>  the device MAY generate notifications more or less frequently than speci=
fied.
>=20
>  A device SHOULD NOT send used buffer notifications to the driver if the
> notifications are suppressed, even if the notification conditions are met=
.
>=20
> -Upon reset, a device MUST initialize all coalescing parameters to 0.
> +Upon reset, a device MAY set any coalescing parameters for all transmit =
and
> receive virtqueues.
>=20
>  \paragraph{Device Statistics}\label{sec:Device Types / Network Device /
> Device Operation / Control Virtqueue / Device Statistics}
>=20
> --
> 2.32.0.3.g01195cf9f

Reviewed-by: Parav Pandit <parav@nvidia.com>

